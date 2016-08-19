#include <battle_initiative.h>
#include <battle.h>
#include <battle_help.h>
#include <bpre.h>
struct move_info move_table[1024];

u16 get_speed(u8 bank) {
    u16 speed = battle_participants[bank].spd;
    switch (get_item_effect(bank, 1)) {
        case ITEM_EFFECT_IRONBALL:
            speed >>= 1;
            break;
        case ITEM_EFFECT_CHOICESCARF:
            speed = (speed * 150) / 100;
            break;
        case ITEM_EFFECT_QUICKPOWDER:
            if (battle_participants[bank].poke_species == POKE_DITTO && !battle_participants[bank].status2.transformed)
                speed <<= 1;
            break;
    }
    if (has_ability_effect(bank, 0, 1)) {
        u8 weather_effects = weather_abilities_effect();
        switch (battle_participants[bank].ability_id) {
            case ABILITY_CHLOROPHYLL:
                if (weather_effects && (battle_weather.flags.harsh_sun || battle_weather.flags.permament_sun || battle_weather.flags.sun))
                    speed *= 2;
                break;
            case ABILITY_SWIFT_SWIM:
                if (weather_effects && (battle_weather.flags.rain || battle_weather.flags.downpour || battle_weather.flags.permament_rain || battle_weather.flags.heavy_rain))
                    speed *= 2;
                break;
            case ABILITY_SAND_RUSH:
                if (weather_effects && (battle_weather.flags.sandstorm || battle_weather.flags.permament_sandstorm))
                    speed *= 2;
                break;
            case ABILITY_QUICK_FEET:
                if (battle_participants[bank].status.flags.burn || battle_participants[bank].status.flags.poison || battle_participants[bank].status.flags.toxic_poison)
                    speed *= 2;
                else if (battle_participants[bank].status.flags.paralysis)
                    speed *= 4;
                break;
        }
    }
    if (battle_participants[bank].status.flags.paralysis)
        speed >= 2;
    if (custom_battle_elements.ptr->side_affecting[get_side_from_bank(bank)].tailwind)
        speed *= 2;
    //TODO: unburden
    speed = (speed * stat_buffs[battle_participants[bank].spd_buff].dividend) / (stat_buffs[battle_participants[bank].spd_buff].divisor);
    return speed;
}

enum init_enum get_first_to_strike(u8 bank_one, u8 bank_two, u8 ignore_prio) {
    enum init_enum result = TIE;
    //TODO: implement quash
    if (!ignore_prio) {
        u16 move_one = battle_participants[bank_one].moves[battle_stuff_ptr.ptr->chosen_move_position[bank_one]];
        u16 move_two = battle_participants[bank_two].moves[battle_stuff_ptr.ptr->chosen_move_position[bank_two]];

        s8 prio_one = 0;
        s8 prio_two = 0;
        //note priority changing effects and abilities not added as of yet
        if (battle_menu_chosen_item[bank_one] == 0)
            prio_one = move_table[move_one].priority;
        if (battle_menu_chosen_item[bank_two] == 0)
            prio_two = move_table[move_two].priority;
        if (prio_one > prio_two)
            result = ONE;
        else if (prio_two > prio_one)
            result = TWO;
    }
    if (result == TIE) {
        //TODO: calculate item bracket effects
        //TODO: calculate speed
        u8 stall_one = has_ability(bank_one, ABILITY_STALL);
        u8 stall_two = has_ability(bank_two, ABILITY_STALL);
        if (stall_one && !stall_two)
            result = TWO;
        else if (stall_two && !stall_one)
            result = ONE;
        else {
            u16 speed_one = get_speed(bank_one);
            u16 speed_two = get_speed(bank_two);
            if (custom_battle_elements.ptr->field_affecting.trick_room || (stall_one && stall_two)) {
                u16 swap_speed = speed_one;
                speed_one = speed_two;
                speed_two = swap_speed;
            }
            if (speed_one > speed_two)
                result = ONE;
            else if (speed_two > speed_one)
                result = TWO;
            else if (random() & 1)
                result = ONE;
        }
    }
    return result;
}

