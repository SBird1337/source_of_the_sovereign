#include <battle_test.h>
#include <battle.h>
#include <bpre.h>
#include <debug.h>
#include <battle_initiative.h>
#include <abilities.h>

#define TEST_AMOUNT 10000

void test_speed() {
    print("Initiating Initiative Unit\nTest...\n");
    u8 pass = true;
    battle_participants[0].spd = 10;
    battle_participants[1].spd = 11;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    print("testing (await TWO):");
    enum init_enum result = get_first_to_strike(0, 1, 0);
    if (result == TWO)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }
    battle_participants[0].spd = 12;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    print("testing (await ONE):");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }
    battle_participants[0].spd = 10;
    battle_participants[1].spd = 11;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);

    //trick room
    custom_battle_elements.ptr->field_affecting.trick_room = 1;
    print("activating trick room...\n");
    print("testing (await ONE):");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[0].spd = 12;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    print("testing (await TWO):");
    result = get_first_to_strike(0, 1, 0);
    if (result == TWO)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[1].ability_id = ABILITY_STALL;
    print("stall test (+tr): ");
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }
    custom_battle_elements.ptr->field_affecting.trick_room = 0;
    print("stall test (-tr): ");
    
    result = get_first_to_strike(0, 1, 0);
    if (result == ONE)
        print("\xFE\x1 pass\n\xFE\x0");
    else {
        pass = false;
        print("\xFE\x2 fail\n\xFE\x0");
    }

    battle_participants[1].ability_id = 0;

    print("\nPRESS A TO CONTINUE...");
    wait_for_btn(1);
    debug_clean();

    print("speed value tests...\n");
    battle_participants[0].spd = 75;
    battle_participants[1].spd = 60;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    u16 speed_one = get_speed(0);
    u16 speed_two = get_speed(1);
    printf("unaffected speed: %d", speed_one);
    printf(": %d", speed_two);
    if (speed_one == 75 && speed_two == 60) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.paralysis = 1;
    battle_participants[1].status.flags.paralysis = 1;
    speed_one = get_speed(0);
    speed_two = get_speed(1);
    printf("para speed: %d", speed_one);
    printf(": %d", speed_two);

    if (speed_one == 18 && speed_two == 15) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].spd_buff = 12;
    battle_participants[1].spd_buff = 12;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    printf("para/speed+6: %d", speed_one);
    printf(": %d", speed_two);

    if (speed_one == 75 && speed_two == 60) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.paralysis = 0;
    battle_participants[1].status.flags.paralysis = 0;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    printf("speed+6: %d", speed_one);
    printf(": %d", speed_two);

    if (speed_one == 300 && speed_two == 240) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }

    battle_participants[0].spd_buff = 3;
    battle_participants[1].spd_buff = 3;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    printf("speed-3: %d", speed_one);
    printf(": %d", speed_two);

    if (speed_one == 30 && speed_two == 24) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }

    battle_participants[0].spd_buff = 6;
    battle_participants[1].spd_buff = 6;
    print("activating chemtrails...\n");
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
    print("weather test:");
    print(weather_pass ? "\xFE\x1 pass\xFE\x0\n" : "\xFE\x2 fail\xFE\x0\n");
    if (!weather_pass)
        pass = false;

    print("tailwind + weather: ");
    custom_battle_elements.ptr->side_affecting[0].tailwind = 1;
    custom_battle_elements.ptr->side_affecting[0].tailwind_bank = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind = 1;
    custom_battle_elements.ptr->side_affecting[1].tailwind_bank = 1;
    speed_one = get_speed(0);
    speed_two = get_speed(1);

    if (speed_one == 300 && speed_two == 240) {
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    custom_battle_elements.ptr->side_affecting[0].tailwind = 0;
    custom_battle_elements.ptr->side_affecting[0].tailwind_bank = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind = 0;
    custom_battle_elements.ptr->side_affecting[1].tailwind_bank = 0;
    battle_weather.flags.rain = 0;
    battle_weather.flags.sun = 0;
    battle_weather.flags.sandstorm = 0;


    print("quick feet: ");
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
        print(" \xFE\x1pass\xFE\x0\n");
    } else {
        print("\xFE\x02 fail\xFE\x0\n");
        pass = false;
    }
    battle_participants[0].status.flags.sleep = 0;
    battle_participants[0].ability_id = 0;
    battle_participants[1].ability_id = 0;
    wait_for_btn(8);
    debug_clean();
    //stress
    battle_participants[0].spd = 20;
    battle_participants[1].spd = 20;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    int count_one = 0;
    int count_two = 0;
    for (int i = 0; i < TEST_AMOUNT; ++i) {
        result = get_first_to_strike(0, 1, 0);
        if (result == ONE)
            count_one++;
        else
            count_two++;
    }

    printf("tie stress test...\ncount \xFE\x1%d\xFE\x0 / ", count_one);
    printf(" \xFE\x2%d\xFE\x0\n", count_two);
    int ratio_one = (count_one * 100) / TEST_AMOUNT;
    int ratio_two = (count_two * 100) / TEST_AMOUNT;
    printf("%d%% / ", ratio_one);
    printf("%d%%\n", ratio_two);
    print("\nPRESS A TO CONTINUE...");

    wait_for_btn(1);
    debug_clean();


    if (pass)
        set_debug_background(0x3E0);
    else
        set_debug_background(0x1F);
    print("test complete\n(entering deadlock)");
    while (true) {
    }
    return;
}