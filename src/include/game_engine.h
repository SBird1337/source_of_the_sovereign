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

/* === EXTERN METHODS === */

/**
 * @brief get pointer of var
 * @param index variable to access
 * @return pointer to given variable storage
 */
extern u16 *var_access(u32 index);

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
 * @brief gets attribute of pokémon
 * @param poke_address address to pokémon structure
 * @param request request from the attribute request table
 * @param destination destination to write to (if not returned directly)
 * @return requested value (if not too big)
 */
extern u32 pokemon_get_attribute(struct pokemon* poke_address, u8 request, void* destination);

/**
 * @brief sets attribute of pokémon
 * @param poke_address address to pokémon structure
 * @param request request from the attribute request table
 * @param new_value pointer to new value
 */
void pokemon_set_attribute(struct pokemon* poke_address, u8 request, void* new_value);

#endif /* GAME_ENGINE_H */

