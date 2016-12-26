#include <battle_locations.h>
#include <battle_structs.h>
#include <types.h>

extern void* bs_cc_lower_def;
extern void* bs_cc_lower_sdef;
extern void* bs_cc_lower_both;

u8 close_combat_choose_script() {
    if (battle_participants[battle_attacker_bank].def_buff == 0) {
        if (battle_participants[battle_attacker_bank].sp_def_buff == 0)
        {
            battlescript_cursor = (void*) (0x081D694E);
            return true;
        }
        else
        {
            battlescript_cursor = bs_cc_lower_sdef;
            return true;
        }
    } else if (battle_participants[battle_attacker_bank].sp_def_buff == 0) {
        battlescript_cursor = bs_cc_lower_def;
        return true;
    } else {
        battlescript_cursor = bs_cc_lower_both;
        return true;
    }
    return false;
}