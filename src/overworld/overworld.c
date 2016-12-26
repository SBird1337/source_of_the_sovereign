/****************************************************************************
 * Copyright (C) 2015-2016 by the SotS Team                                 *
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
 * @file overworld.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Routines to work with the new overworld npc table
 * 
 */

/* === INCLUDES === */
#include <game_engine.h>

/* === DEFINES === */
#define OW_REPLACE_VAR  0x500A
#define OW_REPLACE_TO_VAR   0x500B

/* === STRUCTURES === */
struct ow_point{
    u16 x;
    u16 y;
};

struct npc_type {
    u16 tiles_tag;
    u16 pal_num;
    u16 pal_tag_2;
    u16 field_6;
    struct ow_point pos_neg_center;
    u8 pal_slot_unk;
    u8 field_D;
    u16 pal_table;
    u32 oam;
    u32 field_14;
    u32 image_anims;
    u32 gfx_table;
    u32 rot_scale_anims;
};

/* === PROTOTYPES === */
/**
 * @brief get the npc type struct by given 16 bit npc id
 * @param npc_id short npc id
 * @return pointer to corresponding npc_type structure
 */
struct npc_type* npc_get_type(u16 npc_id);

/* === EXTERN STATICS ===*/
struct npc_type** ow_main_table;
struct npc_type** ow_second_table;
struct npc_type** ow_third_table;

/* === IMPLEMENTATIONS === */
struct npc_type* npc_get_type(u16 npc_id)
{
    /* Not possible in a global scope because of gcc cow magic */
    struct npc_type** npc_tables[3] = {ow_main_table, ow_second_table, ow_third_table};
    //struct npc_type** npc_tables[] = {ow_main_table, ow_second_table, ow_third_table};
    u16* replace_ow = var_access(OW_REPLACE_VAR);
    if(*replace_ow > 0 && *replace_ow - 1 == npc_id)
    {
        npc_id = *var_access(OW_REPLACE_TO_VAR);
    }
    u8 table = (npc_id >> 8);
    return (npc_tables[table][npc_id & 0xFF]);
}
