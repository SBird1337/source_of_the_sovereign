/****************************************************************************
 * Copyright (C) 2015-2017 by the SotS Team                                 *
 *                                                                          *
 * This file is part of Sovereign of the Skies.                             *
 *                                                                          *
 *   Sovereign of the Skies is free software: you can redistribute it       *
 *   and/or modify it                                                       *
 *   under the terms of the GNU Lesser General Public License as published  *
 *   by the Free Software Foundation, either version 3 of the License, or   *
 *   (at your option) any later version provided you include a copy of the  *
 *   licence and this header.                                               *
 *                                                                          *
 *   Sovereign of the Skies is distributed in the hope that it will be      *
 *   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 *                                                                          *
 *   You should have received a copy of the GNU Lesser General Public       *
 *   License along with Sovereign of the Skies.                             *
 *   If not, see <http://www.gnu.org/licenses/>.                            *
 ****************************************************************************/

 /**
 * @file flag_manipulation.c
 * @author Sturmvogel
 * @date 25 may 2017
 * @brief functions for preserving flags and reusing difficulty
 */
#include <pokeagb/pokeagb.h>

#define TRAINER_FLAG_SPACE_START 0x1000

extern u16 tb_modify_flag_id(u16 flag_id);
u16 trainerflag_fix_difficulty(u16 flag_id);

u16 load_hword(void* ptr)
{
    u8* to_load = (u8*)ptr;
    u16 result = *to_load;
    u16 result2 = *(to_load+1) << 8;
    return result | result2;
}

u8 load_byte(void* ptr)
{
    return (u8) (*((u8*)ptr));
}

u16 trainerflag_fix_difficulty(u16 flag_id)
{
    u16 new_flag = ((flag_id - TRAINER_FLAG_SPACE_START + 1) / 3) + TRAINER_FLAG_SPACE_START;
    dprintf("trainerflag_fix_difficulty;; flag_id: 0x%x, reduced: 0x%x, status: %s\n", flag_id, new_flag, flag_check(new_flag) ? "true" : "false");
    return new_flag;
}

bool trainer_check_flag_on_spot(u8 npc_id)
{
    void* script = npc_get_script_by_npc_id(npc_id);
    /* probably inject some script execution here */

    u16 flag = tb_modify_flag_id(load_hword(script+2));
    /* check for line of sight */

    u8 hit_result = npc_trainer_and_raycast_hit(&npc_states[npc_id]);

    if(hit_result == 0)
        return false;

    if(flag_check(trainerflag_fix_difficulty(flag + TRAINER_FLAG_SPACE_START)))
        return false;

    if((load_byte(script + 1) == 4) && (player_cant_double_battle() > 0))
        return false;
    
    spot_trainer_8080334(npc_id, script);
    spot_trainer_8081E68(&npc_states[npc_id], hit_result -1);
    return true;

}

u8 trainerflag_read_fix(void* script_location)
{
    script_location+=2;
    u16 flag = load_hword(script_location);
    //dprintf("trainerflag_read_fix: 0x%x", flag);
    flag = trainerflag_fix_difficulty(flag + TRAINER_FLAG_SPACE_START);
    return flag_check(flag);
}

volatile u8 test;

u16 trainerflag_opponent_fix(void)
{
    return trainerflag_fix_difficulty(trainerbattle_flag_id + TRAINER_FLAG_SPACE_START);
}

bool trainerflag_check_fix(u16 flag)
{
    return flag_check(trainerflag_fix_difficulty(flag + TRAINER_FLAG_SPACE_START));
}

void trainerflag_set_fix(u16 flag)
{
    flag_set(trainerflag_fix_difficulty(flag + TRAINER_FLAG_SPACE_START)); 
}

void trainerflag_clear_fix(u16 flag)
{
    flag_clear(trainerflag_fix_difficulty(flag + TRAINER_FLAG_SPACE_START));
}

void flag_set(u16 flag)
{
    u8* addr = flag_byte_access(flag);
    if(addr != NULL)
        *addr |= 1 << (flag & 7);
}
