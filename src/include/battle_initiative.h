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
 * @file battle_initiative.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Methods calculating speed based stats in-battle
 */

#ifndef BATTLE_INITIATIVE_H
#define BATTLE_INITIATIVE_H

/* === INCLUDES === */
#include <types.h>

/* === ENUMERATIONS === */
enum init_enum {ONE, TWO, TIE};

/* === PROTOTYPES === */

/**
 * @brief calculate who strikes first
 * @param bank1 first contrahend
 * @param bank2 second contrahend
 * @param ignore_prio ignore priority of moves
 * @return bank to strike first as described in enumeration
 */
enum init_enum get_first_to_strike(u8 bank1, u8 bank2, u8 ignore_prio);

/**
 * @brief get the (modified) speed of bank
 * @param bank bank to get speed of
 * @return modified speed value of pokemon in bank
 */
u16 get_speed(u8 bank);
#endif /* BATTLE_INITIATIVE_H */

