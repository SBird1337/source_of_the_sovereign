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
 * @file battle_test.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Unit tests for battles, very temporary and undocumented
 */

#include <types.h>
#include <battle_test.h>
#include <debug.h>
#include <battle_initiative.h>
#include <pkmn_abilities.h>
#include <battle_structs.h>
#include <battle_common.h>
#include <battle_custom_structs.h>

#define TEST_AMOUNT 10000

void test_speed() {
    debug_print("Initiating Initiative Unit\nTest...\n");
    u8 pass = true;
    battle_participants[0].spd = 10;
    battle_participants[1].spd = 11;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);
    debug_print("testing (await TWO):");
    enum init_enum result = get_first_to_strike(0, 1, 0);
    if (result == TWO)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }
    battle_participants[0].spd = 12;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);
    debug_print("testing (await ONE):");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }
    battle_participants[0].spd = 10;
    battle_participants[1].spd = 11;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);

    //trick room
    custom_battle_elements.ptr->field_affecting.trick_room = 1;
    debug_print("activating trick room...\n");
    debug_print("testing (await ONE):");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[0].spd = 12;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);
    debug_print("testing (await TWO):");
    result = get_first_to_strike(0, 1, 0);
    if (result == TWO)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[1].ability_id = ABILITY_STALL;
    debug_print("stall test (+tr): ");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }
    custom_battle_elements.ptr->field_affecting.trick_room = 0;
    debug_print("stall test (-tr): ");
    
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        debug_print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        debug_print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[1].ability_id = 0;

    debug_print("\nPRESS A TO CONTINUE...");
    debug_wait_for_btn(1);
    debug_clean();

    debug_print("speed value tests...\n");
    battle_participants[0].spd = 75;
    battle_participants[1].spd = 60;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);
    u16 speed_one = get_speed(0);
    u16 speed_two = get_speed(1);
    debug_printf("unaffected speed: %d", speed_one);
    debug_printf(": %d", speed_two);
    if (speed_one == 75 && speed_two == 60) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.paralysis = 1;
    battle_participants[1].status.flags.paralysis = 1;
    speed_one = get_speed(0);
    speed_two = get_speed(1);
    debug_printf("para speed: %d", speed_one);
    debug_printf(": %d", speed_two);

    if (speed_one == 18 && speed_two == 15) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].spd_buff = 12;
    battle_participants[1].spd_buff = 12;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    debug_printf("para/speed+6: %d", speed_one);
    debug_printf(": %d", speed_two);

    if (speed_one == 75 && speed_two == 60) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.paralysis = 0;
    battle_participants[1].status.flags.paralysis = 0;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    debug_printf("speed+6: %d", speed_one);
    debug_printf(": %d", speed_two);

    if (speed_one == 300 && speed_two == 240) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }

    battle_participants[0].spd_buff = 3;
    battle_participants[1].spd_buff = 3;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    debug_printf("speed-3: %d", speed_one);
    debug_printf(": %d", speed_two);

    if (speed_one == 30 && speed_two == 24) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }

    battle_participants[0].spd_buff = 6;
    battle_participants[1].spd_buff = 6;
    debug_print("activating chemtrails...\n");
    battle_weather.flags.rain = 1;
    battle_weather.flags.sun = 1;
    battle_weather.flags.sandstorm = 1;
    u8 weather_pass = true;
    battle_participants[0].ability_id = ABILITY_CHLOROPHYLL;
    speed_one = get_speed(0);
    if (speed_one != 150)
        weather_pass = false;
    battle_participants[0].ability_id = ABILITY_SWIFT_SWIM;
    speed_one = get_speed(0);
    if (speed_one != 150)
        weather_pass = false;
    battle_participants[0].ability_id = ABILITY_SAND_RUSH;
    battle_participants[1].ability_id = ABILITY_SAND_RUSH;
    speed_one = get_speed(0);
    if (speed_one != 150)
        weather_pass = false;
    debug_print("weather test:");
    debug_print(weather_pass ? "\xFE\x1 pass\xFE\x0\n" : "\xFE\x2 fail\xFE\x0\n");
    if (!weather_pass)
        pass = false;

    debug_print("tailwind + weather: ");
    custom_battle_elements.ptr->side_affecting[0].tailwind = 1;
    custom_battle_elements.ptr->side_affecting[0].tailwind_bank = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind = 1;
    custom_battle_elements.ptr->side_affecting[1].tailwind_bank = 1;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    if (speed_one == 300 && speed_two == 240) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    custom_battle_elements.ptr->side_affecting[0].tailwind = 0;
    custom_battle_elements.ptr->side_affecting[0].tailwind_bank = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind_bank = 0;
    battle_weather.flags.rain = 0;
    battle_weather.flags.sun = 0;
    battle_weather.flags.sandstorm = 0;


    debug_print("quick feet: ");
    battle_participants[0].ability_id = ABILITY_QUICK_FEET;
    battle_participants[1].ability_id = ABILITY_QUICK_FEET;
    battle_participants[0].status.flags.paralysis = 1;
    battle_participants[1].status.flags.poison = 1;

    speed_one = get_speed(0);
    speed_two = get_speed(1);
    u8 quick_feet_pass = true;
    if (speed_one == 112 && speed_two == 90) {
        battle_participants[0].status.flags.sleep = 1;
        battle_participants[1].status.flags.poison = 0;
        battle_participants[0].status.flags.paralysis = 0;
        speed_one = get_speed(0);
        speed_two = get_speed(1);
        if (!(speed_one == 75 && speed_two == 60)) {
            quick_feet_pass = false;
        }
    } else
        quick_feet_pass = false;

    if (quick_feet_pass) {
        debug_print(" \xFE\x1pass\xFE\x0\n");
    } else {
        debug_print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.sleep = 0;
    battle_participants[0].ability_id = 0;
    battle_participants[1].ability_id = 0;
    debug_wait_for_btn(8);
    debug_clean();
    //stress
    battle_participants[0].spd = 20;
    battle_participants[1].spd = 20;
    debug_printf("bank_one.spd: %d\n", battle_participants[0].spd);
    debug_printf("bank_two.spd: %d\n", battle_participants[1].spd);
    int count_one = 0;
    int count_two = 0;
    for (int i = 0; i < TEST_AMOUNT; ++i) {
        result = get_first_to_strike(0, 1, 0);
        if (result == ONE)
            count_one++;
        else
            count_two++;
    }

    debug_printf("tie stress test...\ncount \xFE\x1%d\xFE\x0 / ", count_one);
    debug_printf(" \xFE\x2%d\xFE\x0\n", count_two);
    int ratio_one = (count_one * 100) / TEST_AMOUNT;
    int ratio_two = (count_two * 100) / TEST_AMOUNT;
    debug_printf("%d%% / ", ratio_one);
    debug_printf("%d%%\n", ratio_two);
    debug_print("\nPRESS A TO CONTINUE...");

    debug_wait_for_btn(1);
    debug_clean();


    if (pass)
        debug_set_bg(0x3E0);
    else
        debug_set_bg(0x1F);
    debug_print("test complete\n(entering deadlock)");
    while (true) {
    }
    return;
}