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
 * @file check_tileset.c
 * @author Sturmvogel
 * @date 21 may 2017
 * @brief Check tileset stuff and store on last result
 * 
 */

#include <map.h>
#include <game_engine.h>
#include <agb_debug.h>

void sp_check_tileset(void)
{
    u16 x;
    u16 y;
    player_get_pos_to(&x, &y);
    dprintf("reading from %d %d\n", x,y);
    u16 block_id = current_map_block_id_at(x,y);
    dprintf("block id: %d\n", block_id);
    var_set(0x800D, current_map_block_id_at(x,y));
}