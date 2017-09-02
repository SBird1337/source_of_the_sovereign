#include <battle_locations.h>
#include <types.h>
#include <battle_structs.h>
#include <pkmn_abilities.h>
#include <moves.h>

extern void* str_worry_seed_ref;
extern void* str_entrainment_ref;
extern void* str_simple_beam_ref;
extern void* str_role_play_ref;
extern void* str_skill_swap_ref;

u8 worry_seed() {
    u8 def_ability = battle_participants[battle_defender_bank].ability_id;
    if (def_ability == ABILITY_STANCE_CHANGE && def_ability == ABILITY_MULTITYPE && def_ability == ABILITY_TRUANT) {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        battle_participants[battle_defender_bank].ability_id = ABILITY_INSOMNIA;
        battle_last_used_ability = ABILITY_INSOMNIA;
        battle_string_chooser = str_worry_seed_ref;
        return false;
    }
    return false;
}

u8 entrainment() {
    u8 def_ability = battle_participants[battle_defender_bank].ability_id;
    if (def_ability == ABILITY_TRACE || def_ability == ABILITY_TRUANT || def_ability == ABILITY_FLOWER_GIFT || def_ability == ABILITY_IMPOSTER || def_ability == ABILITY_STANCE_CHANGE || def_ability == ABILITY_MULTITYPE) {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        battle_participants[battle_defender_bank].ability_id = battle_participants[battle_attacker_bank].ability_id;
        battle_last_used_ability = battle_participants[battle_defender_bank].ability_id;
        battle_string_chooser = str_entrainment_ref;
        return false;
    }
    return false;
}

u8 simple_beam() {
    u8 def_ability = battle_participants[battle_defender_bank].ability_id;
    if (def_ability == ABILITY_STANCE_CHANGE && def_ability == ABILITY_MULTITYPE && def_ability == ABILITY_TRUANT) {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        battle_participants[battle_defender_bank].ability_id = ABILITY_SIMPLE;
        battle_last_used_ability = ABILITY_SIMPLE;
        battle_string_chooser = str_simple_beam_ref;
        return false;
    }
    return false;
}

u8 role_play() {
    u8 def_ability = battle_participants[battle_defender_bank].ability_id;
    if (def_ability == ABILITY_ZEN_MODE || def_ability == ABILITY_WONDER_GUARD || def_ability == ABILITY_MULTITYPE || def_ability == ABILITY_IMPOSTER || def_ability == ABILITY_ILLUSION || def_ability == ABILITY_STANCE_CHANGE) {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        battle_participants[battle_attacker_bank].ability_id = battle_participants[battle_defender_bank].ability_id;
        battle_last_used_ability = battle_participants[battle_attacker_bank].ability_id;
        battle_string_chooser = str_role_play_ref;
        return false;
    }
    return false;
}

u8 skill_swap() {
    u8 check_ability = battle_participants[battle_defender_bank].ability_id;
    if (check_ability == ABILITY_ZEN_MODE || check_ability == ABILITY_WONDER_GUARD || check_ability == ABILITY_MULTITYPE || check_ability == ABILITY_STANCE_CHANGE) {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {

        check_ability = battle_participants[battle_attacker_bank].ability_id;
        if (check_ability == ABILITY_ZEN_MODE || check_ability == ABILITY_WONDER_GUARD || check_ability == ABILITY_MULTITYPE || check_ability == ABILITY_STANCE_CHANGE) {
            //we fail
            battlescript_cursor = (void*) (0x081D7DF0);
            return true;
        } else {
            u8 swap = battle_participants[battle_defender_bank].ability_id;
            battle_participants[battle_defender_bank].ability_id = battle_participants[battle_attacker_bank].ability_id;
            battle_participants[battle_attacker_bank].ability_id = swap;
            battle_string_chooser = str_skill_swap_ref;
            return false;
        }
    }
    return false;
}

u8 ability_change() {
    switch (battle_executed_move) {
        case MOVE_WORRY_SEED:
            return worry_seed();
        case MOVE_ENTRAINMENT:
            return entrainment();
        case MOVE_SIMPLE_BEAM:
            return simple_beam();
        case MOVE_ROLE_PLAY:
            return role_play();
        case MOVE_SKILL_SWAP:
            return skill_swap();
        default:
            return false;
    }
}