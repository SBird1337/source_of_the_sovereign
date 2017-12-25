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
 * @file attack_names.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Some globals used in-battle
 */


#ifndef BATTLE_LOC_H_
#define BATTLE_LOC_H_

#include <types.h>

u8 battle_active_bank;
u8 battle_stat_changer;
void* battle_string_chooser;
u8 battle_last_used_ability;
u16 battle_executed_move;
u8 battle_attacker_bank;
u8 battle_defender_bank;
u8 battle_damage_multiplier;
s32 battle_damage_store;
u32 battle_hitmarker;
void* battlescript_cursor;
u8 battle_menu_chosen_item[4];
u8 battle_turn_order[4];
u16 battle_base_power;

#endif