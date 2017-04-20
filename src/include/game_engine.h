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
 * @file game_engine.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Game Environment
 * 
 * This header file contains methods to interact with the game environment,
 * misc. functions i.e. access to flags / variables and (encrypted) pokémon
 * data.
 */

#ifndef GAME_ENGINE_H
#define GAME_ENGINE_H

/* === INCLUDE === */
#include <types.h>
#include <battle_structs.h>

/* === EXTERN METHODS === */

/**
 * @brief get pointer of var
 * @param index variable to access
 * @return pointer to given variable storage
 */
extern u16 *var_access(u32 index);

/**
 * @brief gets value of variable at index
 * @param index index to get varaible value from
 * @return value of VAR[index]
 */
extern u16 var_get(u16 index);

/**
 * @brief sets variable at index to value
 * @param index unsigned index of the variable
 * @param value value to set the variable to
 * @return true on success, false otherwise
 */
extern u8 var_set(u16 index, u16 value);

/**
 * @brief checks if flag is set
 * @param flag index of flag to check
 * @return flag status (bool)
 */
extern u8 flag_check(u32 flag);

/**
 * @brief clears a flag
 * @param flag flag index to clear
 */
extern void flag_clear(u16 flag);

/**
 * @brief sets a flag
 * @param flag flag index to set
 */
extern void flag_set(u16 flag);

/**
 * @brief gets attribute of pokémon
 * @param poke_address address to pokémon structure
 * @param request request from the attribute request table
 * @param destination destination to write to (if not returned directly)
 * @return requested value (if not too big)
 */
extern u32 pokemon_get_attribute(struct pokemon* poke_address, u8 request, void* destination);

struct move_data {
    u8 effect;
    u8 damage;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 effect_accuracy;
    u8 target;
    s8 priority;
    u8 flags;
    u8 arg1;
    u8 split;
    u8 arg3;
};

extern struct move_data move_table[676];

/**
 * @brief sets attribute of pokémon
 * @param poke_address address to pokémon structure
 * @param request request from the attribute request table
 * @param new_value pointer to new value
 */
void pokemon_set_attribute(struct pokemon* poke_address, u8 request, void* new_value);

/**
 * @brief gets the gender of the selected pokemon
 * @param poke_address address to pokémon structure
 * @return true if the pokémon is female, false otherwise
 */
extern u8 pokemon_get_gender(struct pokemon* poke_address);

/**
 * @brief gets x12 value of item
 * @param item_id item to get value of
 * @return corresponding x12 value 
 */
extern u8 item_get_x12(u16 item_id);

/* TODO: Implement without macros */
#define pokemon_party_player ((struct pokemon*) 0x02024284)

#endif /* GAME_ENGINE_H */

