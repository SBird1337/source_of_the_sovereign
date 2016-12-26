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
 * @file battle_help.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Some helper methods to calculate in-battle outcomes etc.
 */

#ifndef BATTLE_HELP_H_
#define BATTLE_HELP_H_

#include <types.h>

/**
 * @brief get item effect of bank
 * @param bank bank to check effect
 * @param check_negating_effects if true only return effect if it can be executed
 * @return item effect of item held by bank
 */
u8 battle_item_get_effect(u8 bank, u8 check_negating_effects);

/**
 * @brief update the chained effectiveness according to parameters
 * @param attacking_type type of attacking move
 * @param defending_type type of defender
 * @param atk_bank bank of attacker
 * @param def_bank bank of defender
 * @param chained_effect previously chained effect
 * @param airstatus airborne status according to enumeration
 * @return new chained effect
 */
u16 battle_damage_type_effectiveness_update(u8 attacking_type, u8 defending_type, u8 atk_bank, u8 def_bank, u16 chained_effect, u8 airstatus);

/**
 * @brief fully calculate effectiveness from a base effectiveness (def: 64)
 * @param chained_effect chained input (def: 64)
 * @param move_type attacking move type
 * @param target_bank bank of target
 * @param atk_bank bank of attacker
 * @param airstatus airstatus of defender
 * @return chained effectiveness
 */
u16 battle_apply_type_effectiveness(u16 chained_effect, u8 move_type, u8 target_bank, u8 atk_bank, u8 airstatus);

/**
 * @brief calculate type effectiveness from front to back
 * @param move executed move
 * @param move_type type of executed move according to type enumeration
 * @param atk_bank bank of attacker
 * @param def_bank bank of defender
 * @param effects_handling_and_recording TO BE DONE
 * @return effectiveness of made attack
 */
u16 battle_type_effectiveness_calc(u16 move, u8 move_type, u8 atk_bank, u8 def_bank, u8 effects_handling_and_recording);

/**
 * @brief has bank type
 * @param bank bank to check
 * @param type type to check for
 * @return true if bank has type, false otherwise
 */
u8 battle_bank_has_type(u8 bank, u8 type);

/**
 * @brief check if bank is resistant to poison
 * @param bank bank to check for
 * @param self_inflicted was poison self_inflicted?
 * @return 0 if pokemon can be poisoned; 1 if already poisoned; 2 if other status condition e.g. burn; 3 if blocked by type; 4 if blocked by ability; 5 if blocked by safeguard; 6 if blocked by misty terrain (TODO)
 * 
 */
u8 battle_bank_is_poison_resistant(u8 bank, u8 self_inflicted);

/**
 * @brief counts usable party pokemon of side from bank
 * @param bank bank of which usable pokemon should be counted
 * @return usable (not dead) pokemon on side from bank
 */
u8 battle_count_party_pokemon(u8 bank);
#endif