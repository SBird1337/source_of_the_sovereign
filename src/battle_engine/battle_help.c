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
 * @file battle_help.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Some general helper methods for battle
 */

/* === INCLUDE === */

#include <battle_common.h>
#include <battle_custom_structs.h>
#include <battle_help.h>
#include <battle_locations.h>
#include <game_engine.h>
#include <pkmn_abilities.h>
#include <pkmn_attributes.h>
#include <pkmn_item_effects.h>
#include <pkmn_items.h>
#include <pkmn_types.h>

/* === STATICS === */

/* from kds emerald battle engine upgrade */
u8 type_effectiveness_table[TYPE_FAIRY - 0x4][TYPE_FAIRY - 0x4] = {
    {10, 10, 10, 10, 10, 05, 10, 00, 05, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10}, // normal
    {20, 10, 05, 05, 10, 20, 05, 00, 20, 10, 10, 10, 10, 10, 05, 20, 10, 20, 05}, // fight
    {10, 20, 10, 10, 10, 05, 20, 10, 05, 10, 10, 10, 20, 05, 10, 10, 10, 10, 10}, // flying
    {10, 10, 10, 05, 05, 05, 10, 05, 00, 10, 10, 10, 20, 10, 10, 10, 10, 10, 20}, // poison
    {10, 10, 00, 20, 10, 20, 05, 10, 20, 10, 20, 10, 05, 20, 10, 10, 10, 10, 10}, // ground
    {10, 05, 20, 10, 05, 10, 20, 10, 05, 10, 20, 10, 10, 10, 10, 20, 10, 10, 10}, // rock
    {10, 05, 05, 05, 10, 10, 10, 05, 05, 10, 05, 10, 20, 10, 20, 10, 10, 20, 05}, // bug
    {00, 10, 10, 10, 10, 10, 10, 20, 10, 10, 10, 10, 10, 10, 20, 10, 10, 05, 10}, // ghost
    {10, 10, 10, 10, 10, 20, 10, 10, 05, 10, 05, 05, 10, 05, 10, 20, 10, 10, 20}, // steel
    {10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10}, // egg
    {10, 10, 10, 10, 10, 05, 20, 10, 20, 10, 05, 05, 20, 10, 10, 20, 05, 10, 10}, // fire
    {10, 10, 10, 10, 20, 20, 10, 10, 10, 10, 20, 05, 05, 10, 10, 10, 05, 10, 10}, // water
    {10, 10, 05, 05, 20, 20, 05, 10, 05, 10, 05, 20, 05, 10, 10, 10, 05, 10, 10}, // grass
    {10, 10, 20, 10, 00, 10, 10, 10, 10, 10, 10, 20, 05, 05, 10, 10, 05, 10, 10}, // electric
    {10, 20, 10, 20, 10, 10, 10, 10, 05, 10, 10, 10, 10, 10, 05, 10, 10, 00, 10}, // psychic
    {10, 10, 20, 10, 20, 10, 10, 10, 05, 10, 05, 05, 20, 10, 10, 05, 20, 10, 10}, // ice
    {10, 10, 10, 10, 10, 10, 10, 10, 05, 10, 10, 10, 10, 10, 10, 10, 20, 10, 00}, // dragon
    {10, 05, 10, 10, 10, 10, 10, 20, 10, 10, 10, 10, 10, 10, 20, 10, 10, 05, 05}, // dark
    {10, 20, 10, 05, 10, 10, 10, 10, 05, 10, 05, 10, 10, 10, 10, 10, 20, 20, 10}  // fairy
};

/* === IMPLEMENTATIONS === */
u16 battle_damage_type_effectiveness_update(u8 attacking_type, u8 defending_type, u8 atk_bank, u8 def_bank,
                                            u16 chained_effect, u8 airstatus) {
    u8 effect, atype = attacking_type, dtype = defending_type;
    if (!chained_effect || atype == TYPE_EGG || dtype == TYPE_EGG)
        return chained_effect;

    if (atype >= TYPE_FAIRY)
        atype = atype - 5;

    if (dtype >= TYPE_FAIRY)
        dtype = dtype - 5;
    effect = type_effectiveness_table[atype][dtype];

    if (custom_battle_elements.ptr->various.inverse_battle) {
        if (effect == 20) {
            effect = 5;
        } else if (effect == 5 || effect == 0) {
            effect = 20;
        }
    }
    /* handle normal / fighting on ghost */
    if ((((attacking_type == TYPE_NORMAL || attacking_type == TYPE_FIGHTING) && defending_type == TYPE_GHOST &&
          ((battle_participants[def_bank].status2.foresight))) ||
         battle_participants[atk_bank].ability_id == ABILITY_SCRAPPY) &&
        effect == 0) {
        effect = 10;
    }
    /* handle other effectiveness changers here */

    switch (effect) {
    case 0:
        chained_effect = 0;
        break;
    case 5:
        chained_effect = chained_effect >> 1;
        break;
    case 20:
        chained_effect = chained_effect << 1;
        break;
    }
    return chained_effect;
}

u16 battle_apply_type_effectiveness(u16 chained_effect, u8 move_type, u8 target_bank, u8 atk_bank, u8 airstatus) {
    u8 defender_type1 = battle_participants[target_bank].type1;
    u8 defender_type2 = battle_participants[target_bank].type2;
    /* set different types */
    if (defender_type2 == defender_type1)
        defender_type2 = TYPE_EGG;
    chained_effect = battle_damage_type_effectiveness_update(move_type, defender_type1, atk_bank, target_bank,
                                                             chained_effect, airstatus);
    chained_effect = battle_damage_type_effectiveness_update(move_type, defender_type2, atk_bank, target_bank,
                                                             chained_effect, airstatus);
    return chained_effect;
}

u16 battle_type_effectiveness_calc(u16 move, u8 move_type, u8 atk_bank, u8 def_bank,
                                   u8 effects_handling_and_recording) {
    u16 chained_effect = 64;
    // TODO: double_type moves
    // TODO: get air status
    chained_effect = battle_apply_type_effectiveness(chained_effect, move_type, def_bank, atk_bank, 2);
    // TODO: save into structs
    // TODO: effect_handling_and_recording
    return chained_effect;
}

u8 battle_bank_has_type(u8 bank, u8 type) {
    return battle_participants[bank].type1 == type || battle_participants[bank].type2 == type;
}

u8 battle_item_get_effect(u8 bank, u8 check_negating_effects) {
    if (check_negating_effects) {
        if (battle_participants[bank].ability_id == ABILITY_KLUTZ ||
            custom_battle_elements.ptr->bank_affecting[bank].embargo)
            return ITEM_EFFECT_NOEFFECT;
    }
    if (battle_participants[bank].held_item == ITEM_ENIGMABERRY) {
        return battle_enigma_berry[bank].battle_effect_x12;
    } else {
        return item_get_x12(battle_participants[bank].held_item);
    }
}

u8 battle_bank_is_poison_resistant(u8 bank, u8 self_inflicted) { // 0 == can poison
    // 1 == is already poisoned
    // 2 == has other major condition
    // 3 == type doesn't allow it
    // 4 == ability doesn't allow it
    // 5 == safeguard protection
    // 8 == misty terrain doesn't allow it !TODO!
    if (battle_participants[bank].status.flags.poison || battle_participants[bank].status.flags.toxic_poison)
        return 1;
    if (battle_participants[bank].status.int_status)
        return 2;
    if (battle_bank_has_type(bank, TYPE_POISON) || battle_bank_has_type(bank, TYPE_STEEL))
        return 3;
    if (((battle_participants[bank].ability_id == ABILITY_IMMUNITY ||
          (battle_participants[bank].ability_id == ABILITY_LEAF_GUARD &&
           (battle_weather.flags.sun || battle_weather.flags.permament_sun || battle_weather.flags.harsh_sun)))))
        return 4;
    if (side_affecting_halfword[get_side_from_bank(bank)].safeguard_on && !self_inflicted)
        return 5;
    return 0;
}

u8 battle_count_party_pokemon(u8 bank) {
    struct pokemon *poke;
    if (get_side_from_bank(bank))
        poke = &party_opponent[0];
    else
        poke = &party_player[0];
    u8 usable_pokes = 0;
    for (u8 i = 0; i < 6; i++) {
        if (pokemon_get_attribute(&poke[i], ATTR_CURRENT_HP, 0) != 0 &&
            pokemon_get_attribute(&poke[i], ATTR_IS_EGG, 0) != 1 &&
            pokemon_get_attribute(&poke[i], ATTR_SPECIES, 0) != 0)
            usable_pokes++;
    }
    return usable_pokes;
}