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
 * @file evolution_methods.c
 * @author Sturmvogel
 * @date 18 apr 2017
 * @brief decide if a pokémon is able to evolve and what the consequences are.
 *
 */
#include <game_engine.h>
#include <pkmn_attributes.h>
#include <agb_debug.h>

enum evo_source
{
    LEVEL_UP,
    TRADE,
    STONE_EVOLUTION,
    STONE_REQUEST
};

u16 evolution_try_evolve(struct pokemon* pokemon, enum evo_source source, u16 stoneId)
{
    u16 held_item = pokemon_get_attribute(pokemon, ATTR_HELD_ITEM, NULL);
    u16 species = pokemon_get_attribute(pokemon, ATTR_SPECIES, NULL);
    u16 level = pokemon_get_attribute(pokemon, ATTR_LEVEL, NULL);
    //TODO PID
    dprintf("Species %d tried to evolve.\n", species);
    dprintf("Cause: %d\n", source);
    dprintf("Held Item: %d; Level: %d\nBlocking evolution for debug.", held_item, level);
    return 150;
}