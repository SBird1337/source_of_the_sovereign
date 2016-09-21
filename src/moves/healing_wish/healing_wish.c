#include <battle.h>
#include <battle_help.h>

u8 set_healing_wish() {
    if (count_party_pokemon(battle_attacker_bank) <= 1) {
        //it will fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        u8 user_side = get_side_from_bank(battle_attacker_bank);
        custom_battle_elements.ptr->side_affecting[user_side].lunardance = true;
        battle_damage_store = battle_participants[battle_attacker_bank].current_hp;
        battle_hitmarker |= 0x100; //No substitute, only glory in death!
        return false;
    }
    return false;
}