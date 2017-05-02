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

/* 
 * File:   npc.h
 * Author: Sturmvogel
 *
 * Created on May 2, 2017
 * @brief Provides structures for NPC access
*/

#ifndef NPC_H
#define NPC_H

#include <types.h>
        
/* === STRUCTURES === */


struct coords_16 {
    u16 x;
    u16 y;
};

struct npc_state
{
    u8 bitfield;
    u8 field_1;
    u8 field_2;
    u8 field_3;
    u8 oam_id;
    u8 type_id;
    u8 running_behavior;
    u8 is_trainer;
    u8 local_id;
    u8 local_mapnumber;
    u8 local_mapbank;
    u8 height;
    struct coords_16 stay_around;
    struct coords_16 to;
    struct coords_16 from;
    u8 direction;
    u8 movement_area;
    u8 field_1A;
    u8 oamid2;
    u8 an_index;
    u8 sight_distance;
    u8 tile_to;
    u8 tile_from;
    u8 unknown_1;
    u8 unknown_2;
    u8 field_22;
    u8 field_23;
};


struct npc_type {
    u16 tiles_tag;
    u16 pal_num;
    u16 pal_tag_2;
    u16 field_6;
    struct coords_16 pos_neg_center;
    u8 pal_slot_unk;
    u8 field_D;
    u16 pal_table;
    u32 oam;
    u32 field_14;
    u32 image_anims;
    u32 gfx_table;
    u32 rot_scale_anims;
};

#endif /* NPC_H */

