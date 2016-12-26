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
 * @file battle_end_of_turn.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Handle end of turn effects
 */

/* === INCLUDE === */

#include <battle_structs.h>
#include <pkmn_types.h>

/* === PROTOTYPES === */

/**
 * @brief handle the end of turn stuff
 */
void battle_end_of_turn();

/* === IMPLEMENTATIONS === */
void battle_end_of_turn() {
    for (int i = 0; i < 4; ++i) {
        if (battle_participants[i].type1 == TYPE_EGG)
            battle_participants[i].type1 = TYPE_FLYING;
        if (battle_participants[i].type2 == TYPE_EGG)
            battle_participants[i].type2 = TYPE_FLYING;
    }
    return;
}