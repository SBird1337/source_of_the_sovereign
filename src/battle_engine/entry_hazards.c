#include "battle_help.h"
#include <bpre.h>

extern void* bs_stealth_rock;
extern void* bs_toxic_spikes;
extern void* bs_toxic_spikes_bad;
extern void* bs_sticky_web;
extern void* bs_toxic_resolve;

extern void* bs_spikes_lain;
extern void* bs_rocks_lain;
extern void* bs_toxic_lain;
extern void* bs_sticky_lain;

u8 execute_entry_hazards() {
    u8 active_side = get_side_from_bank(battle_active_bank);
    u8 has_effect = 0;
    struct side_affecting* active_side_affecting = &custom_battle_elements.ptr->side_affecting[active_side];
    if (side_affecting_halfword[active_side].spikes_on && !(side_affecting_halfword[active_side].spikes_damage_done)) {
        //spikes lay down, deal spiky damage
        u32 damage = (battle_participants[battle_active_bank].max_hp) / ((5 - battle_side_timers[active_side].spikes_amount) * 2);
        if (damage == 0)
            damage = 1;
        battle_damage_store = damage;

        side_affecting_halfword[active_side].spikes_damage_done = 1;
        battle_script_push();
        battlescript_cursor = (void*) (0x081D8CBE);
        has_effect = 1;
    } else if (active_side_affecting->stealth_rock && !(active_side_affecting->stealth_rock_done)) {
        active_side_affecting->stealth_rock_done = 1;
        //check for magic guard here
        u32 damage = battle_participants[battle_active_bank].max_hp;
        switch (type_effectiveness_calc(MOVE_STEALTH_ROCK, TYPE_ROCK, battle_active_bank^1, battle_active_bank, 0) >> 4) {
            case 1:
                damage = damage >> 5;
                break;
            case 2:
                damage = damage >> 4;
                break;
            case 4:
                damage = damage >> 3;
                break;
            case 8:
                damage = damage >> 2;
                break;
            case 16:
                damage = damage >> 1;
                break;
        }
        if (damage == 0)
            damage = 1;
        battle_damage_store = damage;

        battle_script_push();
        battlescript_cursor = bs_stealth_rock;
        has_effect = 1;
    } else if (active_side_affecting->toxic_spikes_psn && !(active_side_affecting->toxic_spikes_done)) {
        active_side_affecting->toxic_spikes_done = 1;
        if (has_type(battle_active_bank, TYPE_POISON)) {
            has_effect = 1;
            active_side_affecting->toxic_spikes_psn = 0;
            active_side_affecting->toxic_spikes_badpsn = 0;
            battle_script_push();
            battlescript_cursor = bs_toxic_resolve;
        } else if (!cant_poison(battle_active_bank, 0)) {
            if (active_side_affecting->toxic_spikes_badpsn) {
                battle_participants[battle_active_bank].status.flags.toxic_poison = 1;
                battle_script_push();
                battlescript_cursor = bs_toxic_spikes_bad;
            }
            else {
                battle_participants[battle_active_bank].status.flags.poison = 1;
                battle_script_push();
                battlescript_cursor = bs_toxic_spikes;
            }
            prepare_setattributes_in_battle(0, REQUEST_STATUS_BATTLE, 0, 4, &battle_participants[battle_active_bank].status.flags);
            mark_buffer_bank_for_execution(battle_active_bank);
            has_effect = 1;
        }
    } else if (active_side_affecting->sticky_web && !(active_side_affecting->sticky_web_done) && battle_participants[battle_active_bank].spd_buff != 0) {
        active_side_affecting->sticky_web_done = 1;
        battle_script_push();
        battlescript_cursor = bs_sticky_web;
        battle_stat_changer = 0x93;
        has_effect = 1;
    }

    if (has_effect) {
        custom_battle_elements.ptr->various.var1 = battle_active_bank;
        battle_participants[battle_active_bank].status2.destinny_bond = 0;
        battle_hitmarker &= 0xFFFFFFBF;
    }
    return has_effect;
}

u8 lay_entry_hazards() {
    u8 target_side = get_side_from_bank(battle_defender_bank);
    u8 fail = 0;
    struct side_affecting* target_side_struct = &custom_battle_elements.ptr->side_affecting[target_side];
    switch (battle_executed_move) {
        case MOVE_SPIKES:
            if (battle_side_timers[target_side].spikes_amount < 3) {
                battle_side_timers[target_side].spikes_amount++;
                side_affecting_halfword[target_side].spikes_on = 1;
                battlescript_cursor = bs_spikes_lain;
            } else {
                fail = 1;
            }
            break;
        case MOVE_STEALTH_ROCK:
            if (target_side_struct->stealth_rock == 0) {
                target_side_struct->stealth_rock = 1;
                battlescript_cursor = bs_rocks_lain;
            } else
                fail = 1;
            break;
        case MOVE_TOXIC_SPIKES:
            if (target_side_struct->toxic_spikes_psn == 0) {
                target_side_struct->toxic_spikes_psn = 1;
                battlescript_cursor = bs_toxic_lain;
            } else if (target_side_struct->toxic_spikes_badpsn == 0) {
                target_side_struct->toxic_spikes_badpsn = 1;
                battlescript_cursor = bs_toxic_lain;
            } else
                fail = 1;
            break;
        case MOVE_STICKY_WEB:
            if (target_side_struct->sticky_web == 0) {
                target_side_struct->sticky_web = 1;
                battlescript_cursor = bs_sticky_lain;
            } else
                fail = 1;
            break;
        default:
            fail = 1;
            break;
    }
    if (fail) {
        //failed execution
        battlescript_cursor = (void*) (0x081D7DF0);
    }
    return 1;
}