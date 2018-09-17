#include <battle_structs.h>
#include <battle_locations.h>
#include <battle_custom_structs.h>
#include <battle_common.h>

extern void* bs_feint_no_break_ptr;

u8 break_shields() {
    u8 effect = false;
    struct bank_affecting* defender_bank = &custom_battle_elements.ptr->bank_affecting[battle_defender_bank];
    struct side_affecting* defender_side = &custom_battle_elements.ptr->side_affecting[get_side_from_bank(battle_defender_bank)];
    if (battle_protect[battle_defender_bank].flag0_protect) {
        effect = true;
        battle_protect[battle_defender_bank].flag0_protect = false;
    }
    if (defender_bank->kings_shield) {
        effect = true;
        defender_bank->kings_shield = false;
    }
    if (defender_bank->spiky_shield) {
        effect = true;
        defender_bank->spiky_shield = false;
    }
    if (defender_side->mat_block) {
        effect = true;
        defender_side->mat_block = false;
    }
    if (defender_side->quick_guard) {
        effect = true;
        defender_side->quick_guard = false;
    }
    if (defender_side->wide_guard) {
        effect = true;
        defender_side->wide_guard = false;
    }
    if (defender_side->crafty_shield) {
        effect = true;
        defender_side->crafty_shield = false;
    }
    if(effect)
        return false;
    battlescript_cursor = bs_feint_no_break_ptr;
    return true;
}