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
#include <config.h>

#define EVO_NULL {0,0,0, {false, 0}}
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
#define EVO_WEAR_ITEM 16
#define EVO_WEAR_ITEM_NIGHT 17
#define EVO_WEAR_ITEM_DAY 18
#define EVO_LEVEL_NIGHT 19
#define EVO_LEVEL_DAY 20
#define EVO_LEVEL_VAR 21
#define EVO_LEVEL_MOVE 22

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
    struct
    {
        u16 gender: 2;
        u16 versatile: 14;
    } argument_2;
};

struct evo_result
{
    u8 can_evolve;
    u8 consume_item;
    u8 evolve_to;
};

struct evo_information evolutions[][MAX_EVOLUTIONS] = {
    {EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL},               //Nothing
    {{EVO_LEVEL_MOVE,7,2,{0, 336}},EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL},   //BISASAM
    {{EVO_LEVEL_UP,32,3,{0, 0}},EVO_NULL,EVO_NULL,EVO_NULL,EVO_NULL},//BISAKNOSP
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
    u8 gender = pokemon_get_gender(arguments.poke);
    u8 gender_arg = arguments.evolution.argument_2.gender;
    dprintf("A pokemon with gender value %d\n", gender);
    if(gender_arg == 1)
    {
        if(gender)
            return EVO_NO_EVO;
    }
    if(gender_arg == 2)
    {
        if(!gender)
            return EVO_NO_EVO;
    }
    
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
        return EVO_NO_EVO;
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
    u8 gender = pokemon_get_gender(arguments.poke);
    u8 gender_arg = arguments.evolution.argument_2.gender;
    
    if(gender_arg == 1)
    {
        if(gender)
            return EVO_NO_EVO;
    }
    if(gender_arg == 2)
    {
        if(!gender)
            return EVO_NO_EVO;
    }

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

struct evo_result evolve_by_special_place(struct evo_call_arguments arguments)
{
    u16 value = var_get(EVO_VAR);
    dprintf("A pokemon tried to evolve using the var evo method: value: %d needed: %d\n", value, arguments.evolution.argument_2.versatile);
    if(arguments.evolution.argument_2.versatile != value)
    {
        return EVO_NO_EVO;
    }
    return evolve_by_level(arguments);
}

struct evo_result evolve_by_beauty(struct evo_call_arguments arguments)
{
    u32 beauty = pokemon_get_attribute(arguments.poke, ATTR_BEAUTY, NULL);
    dprintf("A pokemon tires to evolve by beauty: value: %d; required: %d.\n", beauty, BEAUTY_BOUND);
    if(beauty > BEAUTY_BOUND && arguments.source == LEVEL_UP)
        return evolve_by_level(arguments);
    return EVO_NO_EVO;
}

struct evo_result evolve_by_worn_item(struct evo_call_arguments arguments)
{
    
    struct evo_result level_result = evolve_by_level(arguments);
    if(!level_result.can_evolve)
        return EVO_NO_EVO;
    u16 item_to_wear = arguments.evolution.argument_2.versatile;
    dprintf("A pokemon tried to evolve by item. pkmn_item: %d; argument item: %d", arguments.item, item_to_wear);
    if(arguments.item != item_to_wear)
        return EVO_NO_EVO;
    
    return (struct evo_result){true, false, arguments.evolution.evolve_to};
}

struct evo_result evolve_by_worn_item_day(struct evo_call_arguments arguments)
{
    dprintf("A pokemon tried to use the (not implmented) evolve_by_worn_item_day evo method.\n");
    return evolve_by_worn_item(arguments);
}

struct evo_result evolve_by_worn_item_night(struct evo_call_arguments arguments)
{
    dprintf("A pokemon tried to use the (not implmented) evolve_by_worn_item_night evo method.\n");
    return evolve_by_worn_item(arguments);
}

struct evo_result evolve_by_move(struct evo_call_arguments arguments)
{
    u16 move_one = pokemon_get_attribute(arguments.poke, ATTR_ATTACK_1, NULL);
    u16 move_two = pokemon_get_attribute(arguments.poke, ATTR_ATTACK_2, NULL);
    u16 move_three = pokemon_get_attribute(arguments.poke, ATTR_ATTACK_3, NULL);
    u16 move_four = pokemon_get_attribute(arguments.poke, ATTR_ATTACK_4, NULL);
    u16 move_needed = arguments.evolution.argument_2.versatile;
    dprintf("A pokemon tried to evolve using evolve_by_move: needed: %d, one: %d, two: %d, three: %d, four: %d\n", move_needed, move_one, move_two, move_three, move_four);
    if((move_one == move_needed) || (move_two == move_needed) || (move_three == move_needed) || (move_four == move_needed))
        return evolve_by_level(arguments);
    else
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
    evolve_invalid_method,                            //Method 0 INVALID
    evolve_by_happiness,                              //Method 1
    evolve_invalid_method, //TODO: Happiness DAY        Method 2
    evolve_invalid_method, //TODO: Happiness NIGHT      Method 3
    evolve_by_level,                                  //Method 4
    evolve_by_trade_group,                            //Method 5
    evolve_by_trade_group,                            //Method 6
    evolve_by_stone,                                  //Method 7
    evolve_by_atk_def,                                //Method 8
    evolve_by_atk_def,                                //Method 9
    evolve_by_atk_def,                                //Method 10
    evolve_random,                                    //Method 11
    evolve_random,                                    //Method 12
    evolve_by_level,   //Shedninja SPAWN                Method 13
    evolve_no_method, //Shedninja SPAWNED             //Method 14
    evolve_by_beauty,                                 //Method 15
    evolve_by_worn_item,                              //Method 16
    evolve_by_worn_item_day, //TODO implement day       Method 17
    evolve_by_worn_item_night, //TODO implement night   Method 18
    evolve_invalid_method, //TODO implement level night Method 19
    evolve_invalid_method, //TODO implement level day   Method 20
    evolve_by_special_place,                          //Method 21
    evolve_by_move                                    //Method 22
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