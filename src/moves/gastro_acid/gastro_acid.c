#include <battle_locations.h>
#include <battle_structs.h>
#include <battle_custom_structs.h>

u8 gastro_acid_set() {
    if (custom_battle_elements.ptr->bank_affecting[battle_defender_bank].gastro_acided) {
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    }
    custom_battle_elements.ptr->bank_affecting[battle_defender_bank].gastro_acided = true;
    return false;
}