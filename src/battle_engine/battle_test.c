#include <battle_test.h>
#include <battle.h>
#include <bpre.h>
#include <debug.h>
#include <battle_initiative.h>

void test_battle() {
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
    
    wait_for_btn(1);
    debug_clean();
    
    //stress
    battle_participants[0].spd = 20;
    battle_participants[1].spd = 20;
    printf("bank_one.spd: %d\n", battle_participants[0].spd);
    printf("bank_two.spd: %d\n", battle_participants[1].spd);
    int count_one = 0;
    int count_two = 0;
    for (int i = 0; i < 5000; ++i) {
        result = get_first_to_strike(0, 1, 0);
        if (result == ONE)
            count_one++;
        else
            count_two++;
    }
    printf("tie stress test...\ncount \xFE\x1%d\xFE\x0 / ", count_one);
    printf(" \xFE\x2%d\xFE\x0\n", count_two);
    wait_for_btn(1);
    debug_clean();
    if(pass)
        set_debug_background(0x3E0);
    else
        set_debug_background(0x31);
    print("test complete\n(entering deadlock)");
    while(true)
    {}
    return;
}