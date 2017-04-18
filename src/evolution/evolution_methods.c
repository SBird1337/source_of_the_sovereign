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

struct evo_information
{
    u16 method;
    u16 argument;
    u16 evolve_to;
    u8 arg1;
    u8 arg2;
};

struct evo_result
{
    u8 can_evolve;
    u8 consume_item;
    u8 evolve_to;
};

#define EVO_NULL {0,0,0,0,0}
#define EVO_LEVEL_UP 4
#define MAX_EVOLUTIONS 3

struct evo_information evolutions[][MAX_EVOLUTIONS] = {
    {EVO_NULL,EVO_NULL,EVO_NULL},
    {{EVO_LEVEL_UP,16,2,0,0},EVO_NULL,EVO_NULL},
    {{EVO_LEVEL_UP,32,3,0,0},EVO_NULL,EVO_NULL},
};

struct evo_call_arguments
{
    u16 item;
    u16 level;
    enum evo_source source;
    u16 stoneId;
    struct pokemon* poke;
    struct evo_information evolution;
};

typedef struct evo_result (*evolution_callback)(struct evo_call_arguments);

struct evo_result evolve_by_level(struct evo_call_arguments arguments)
{
    if(arguments.source != LEVEL_UP)
    {
        return (struct evo_result){false, false, 0};
    }
    if(arguments.evolution.argument <= arguments.level)
    {
        return (struct evo_result){true, false, arguments.evolution.evolve_to};
    }
    return (struct evo_result){false, false, 0};
}

static evolution_callback evolution_methods[] =
{
    NULL,
    NULL, //TODO: Happiness
    NULL, //TODO: Happiness DAY
    NULL, //TODO: Happiness NIGHT
    evolve_by_level
};

u16 evolution_try_evolve(struct pokemon* pokemon, enum evo_source source, u16 stoneId)
{
    u16 held_item = pokemon_get_attribute(pokemon, ATTR_HELD_ITEM, NULL);
    u16 species = pokemon_get_attribute(pokemon, ATTR_SPECIES, NULL);
    u16 level = pokemon_get_attribute(pokemon, ATTR_LEVEL, NULL);
    //TODO PID
    dprintf("Species %d tried to evolve.\n", species);
    dprintf("Cause: %d\n", source);
    struct evo_information* current_evolution_structure = evolutions[species];
    struct evo_result result;
    for(int i = 0; i < MAX_EVOLUTIONS; ++i)
    {
        if(current_evolution_structure[i].method != 0)
        {
            dprintf("found valid evolution with method %d for species %d", current_evolution_structure[i].method, species);
            struct evo_call_arguments args = {held_item, level, source, stoneId, pokemon, current_evolution_structure[i]};
            result = evolution_methods[current_evolution_structure[i].method](args);
            if(result.can_evolve)
                break;
        }
    }
    if(result.can_evolve)
    {
        if(result.consume_item)
        {
            //TODO: Consume
        }
        return result.evolve_to;
    }
    else
        return 0;
    /*evolve everything to mewtu for jiggs & giggles*/
    return 150;
}