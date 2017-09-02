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
 * @file battle_abilities.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Some methods concerning in-battle abilities
 */

/* === INCLUDE === */
#include <battle_abilities.h>
#include <battle_custom_structs.h>
#include <battle_structs.h>

/* === IMPLEMENTATIONS === */
u8 ability_has_effect(u8 bank, u8 mold_breaker, u8 gastro)
{
    if(gastro && custom_battle_elements.ptr->bank_affecting[bank].gastro_acided)
        return false;
    return true;
    //TODO: MOLD BREAKER
}

u8 ability_weather_effects()
{
    //TODO: AIR LOCK AND CLOUD NINE
    return true;
}
u8 ability_has_ability(u8 bank, u8 ability)
{
    return (ability_has_effect(bank,0,1) && battle_participants[bank].ability_id == ability);
}