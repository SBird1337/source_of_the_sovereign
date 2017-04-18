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
#include <math.h>

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
#define MAX_EVOLUTIONS 5
#define EVO_NO_EVO (struct evo_result){false,false,0}

#define HAPPY_BOUND 219
#define BEAUTY_BOUND 170

#define EVO_HAPPINESS 1
#define EVO_LEVEL_UP 4
#define EVO_TRADE 5
#define EVO_TRADE_ITEM 6
#define EVO_STONE 7
#define EVO_ATK 8
#define EVO_DEF 9
#define EVO_ADEQU 10
#define EVO_PERSO_HIGH 11
#define EVO_PERSO_LOW 12
#define EVO_SPAWN 13
#define EVO_SPAWNED 14
#define EVO_BEAUTY 15

struct evo_information evolutions[][MAX_EVOLUTIONS] = {
    {EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL},               //Nothing
    {{EVO_BEAUTY,7,2,0,0},{EVO_SPAWNED,7,150,0,0},EVO_NULL,EVO_NULL,EVO_NULL},   //BISASAM
    {{EVO_LEVEL_UP,32,3,0,0},EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL},//BISAKNOSP
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
    if(arguments.evolution.argument <= arguments.level && arguments.source == LEVEL_UP)
    {
        return (struct evo_result){true, false, arguments.evolution.evolve_to};
    }
    else
    {
        return (struct evo_result){false, false, 0};
    }
}

struct evo_result evolve_by_trade_group(struct evo_call_arguments arguments)
{
    if(arguments.source != TRADE)
    {
        return (struct evo_result){false, false, 0};
    }
    if(arguments.evolution.method == EVO_TRADE_ITEM)
    {
        if(arguments.item != arguments.evolution.argument)
            return (struct evo_result){false, false, 0};
        else
            return (struct evo_result){true,true, arguments.evolution.evolve_to};
    }
    else if(arguments.evolution.method == EVO_TRADE)
    {
        return (struct evo_result){true, false, arguments.evolution.evolve_to};
    }
    else
    {
        dprintf("An invalid trade group method was reached in \"evolve_by_trade_group\"\nmethod: %d", arguments.evolution.method);
        return (struct evo_result){false,false,0};
    }
}

struct evo_result evolve_random(struct evo_call_arguments arguments)
{
    if(arguments.source != LEVEL_UP)
    {
        return EVO_NO_EVO;
    }
    u32 pid = pokemon_get_attribute(arguments.poke, ATTR_PID, NULL);
    pid = pid & 0xFFFF;
    u8 mod = __aeabi_uidivmod(pid, 10);
    dprintf("A pokemon tries to evolve at random: pid: %d, low: %d, mod: %d\n", pid, pid, mod);
    if(mod >= 5)
    {
        if(arguments.evolution.method == EVO_PERSO_HIGH)
            return (struct evo_result){true, false, arguments.evolution.evolve_to};
        else
            return EVO_NO_EVO;
    }
    else
    {
        if(arguments.evolution.method == EVO_PERSO_LOW)
            return (struct evo_result){true, false, arguments.evolution.evolve_to};
        else
            return EVO_NO_EVO;
    }
}

struct evo_result evolve_by_stone(struct evo_call_arguments arguments)
{
    if(arguments.source != STONE_EVOLUTION && arguments.source != STONE_REQUEST)
    {
        return (struct evo_result){false,false, 0};
    }
    if(arguments.stoneId == arguments.evolution.argument)
    {
        return (struct evo_result){true, false, arguments.evolution.evolve_to};
    }
    else
    {
        return (struct evo_result){false,false,0};
    }
}

struct evo_result evolve_by_atk_def(struct evo_call_arguments arguments)
{
    u32 atk = pokemon_get_attribute(arguments.poke, ATTR_ATTACK, NULL);

    
    u32 def = pokemon_get_attribute(arguments.poke, ATTR_DEFENCE, NULL);
    dprintf("A pokemon wants to evolve by atk and def.\n");
    dprintf("Level required: %d, pkmn level: %d, pkmn atk: %d, pkmn def: %d\n", arguments.evolution.argument, arguments.level, atk, def);
    if(arguments.evolution.method == EVO_ATK)
    {
        if(atk > def)
            return evolve_by_level(arguments);
        else
            return EVO_NO_EVO;
    }
    if(arguments.evolution.method == EVO_DEF)
    {
        if(def > atk)
            return evolve_by_level(arguments);
        else
            return EVO_NO_EVO;
    }
    if(arguments.evolution.method == EVO_ADEQU)
    {
        if(atk == def)
            return evolve_by_level(arguments);
        else
            return EVO_NO_EVO;
    }
    dprintf("invalid atk and def evo code reached.\n");
    return EVO_NO_EVO;
}

struct evo_result evolve_by_happiness(struct evo_call_arguments arguments)
{
    u32 happiness = pokemon_get_attribute(arguments.poke, ATTR_HAPPINESS, NULL);
    dprintf("A pokemon wants to evolve by happiness.\n");
    dprintf("Happiness value: %d; needed: %d\n", happiness, HAPPY_BOUND);
    if((happiness > HAPPY_BOUND) && (arguments.source == LEVEL_UP))
    {
        return (struct evo_result){true,false,arguments.evolution.evolve_to};
    }
    else
    {
        return (struct evo_result){false,false,0};
    }
}

struct evo_result evolve_by_beauty(struct evo_call_arguments arguments)
{
    u32 beauty = pokemon_get_attribute(arguments.poke, ATTR_BEAUTY, NULL);
    dprintf("A pokemon tires to evolve by beauty: value: %d; required: %d.\n", beauty, BEAUTY_BOUND);
    if(beauty > BEAUTY_BOUND && arguments.source == LEVEL_UP)
        return evolve_by_level(arguments);
    return EVO_NO_EVO;
}

struct evo_result evolve_no_method(struct evo_call_arguments arguments)
{
    //For shedninja
    return EVO_NO_EVO;
}

struct evo_result evolve_invalid_method(struct evo_call_arguments arguments)
{
    dprintf("A pokemon tried to execute an evolution method that is not yet implemented.\n");
    return (struct evo_result){false, false, 0};
}

static evolution_callback evolution_methods[] =
{
    evolve_invalid_method,
    evolve_by_happiness,
    evolve_invalid_method, //TODO: Happiness DAY
    evolve_invalid_method, //TODO: Happiness NIGHT
    evolve_by_level,
    evolve_by_trade_group,
    evolve_by_trade_group,
    evolve_by_stone,
    evolve_by_atk_def,
    evolve_by_atk_def,
    evolve_by_atk_def,
    evolve_random,
    evolve_random,
    evolve_by_level,   //Shedninja SPAWN
    evolve_no_method, //Shedninja SPAWNED
    evolve_by_beauty
};

u16 evolution_try_evolve(struct pokemon* pokemon, enum evo_source source, u16 stoneId)
{
    u16 held_item = pokemon_get_attribute(pokemon, ATTR_HELD_ITEM, NULL);
    u16 species = pokemon_get_attribute(pokemon, ATTR_SPECIES, NULL);
    u16 level = pokemon_get_attribute(pokemon, ATTR_LEVEL, NULL);
    dprintf("Species %d tried to evolve.\n", species);
    dprintf("Cause: %d\n", source);
    if(species > 2)
    {
        dprintf("Currently no evolution possible due to short table!\n");
        return 0;
    }
    struct evo_information* current_evolution_structure = evolutions[species];
    struct evo_result result;
    for(int i = 0; i < MAX_EVOLUTIONS; ++i)
    {
        if(current_evolution_structure[i].method != 0)
        {
            dprintf("found valid evolution with method %d for species %d\n", current_evolution_structure[i].method, species);
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
            u16 zero = 0;
            pokemon_set_attribute(pokemon, ATTR_HELD_ITEM, &zero);
        }
        return result.evolve_to;
    }
    else
        return 0;
}