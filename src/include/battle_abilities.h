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
 * @file battle_abilities.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Some methods concerning in-battle abilities
 */

#ifndef BATTLE_ABILITIES_H
#define BATTLE_ABILITIES_H

/* === INCLUDES === */

#include <types.h>

/**
 * @brief checks if ability is blocked
 * @param bank bank to check for
 * @param mold_breaker check for mold breaker?
 * @param gastro check for gastro acid?
 * @return true if the ability has an effect, false otherwise.
 */
u8 ability_has_effect(u8 bank, u8 mold_breaker, u8 gastro);

/**
 * @brief do weather abilities have an effect?
 * @return false if weather abilities are blocked, true otherwise
 */
u8 ability_weather_effects();

/**
 * @brief has bank ability
 * @param bank bank to check
 * @param ability ability to check for
 * @return true if bank has ability, false otherwise
 */
u8 ability_has_ability(u8 bank, u8 ability);

#endif /* BATTLE_ABILITIES_H */

