#include <battle_common.h>
#include <battle_locations.h>
#include <battle_custom_structs.h>
#include <battle_structs.h>

u8 set_magnet_rise() {
    struct bank_affecting* user = &custom_battle_elements.ptr->bank_affecting[battle_attacker_bank];
    if (user->magnet_rise || user->smacked_down || battle_status_3[battle_attacker_bank].rooted) {
        //we failed
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    } else {
        user->magnet_rise = 5;
        return false;
    }
    return false;
}