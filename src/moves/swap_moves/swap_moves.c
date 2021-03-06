#include <battle_common.h>
#include <constants/moves.h>
#include <battle_structs.h>
#include <battle_locations.h>

extern char str_power_swap[];
extern char str_guard_swap[];
extern char str_heart_swap[];

u8 set_swap_moves() {
    struct battle_participant* attacker = &battle_participants[battle_attacker_bank];
    struct battle_participant* defender = &battle_participants[battle_defender_bank];
    u8 swap;
    switch (battle_executed_move) {
        case MOVE_POWER_SWAP:
            swap = attacker->atk_buff;
            attacker->atk_buff = defender->atk_buff;
            defender->atk_buff = swap;
            swap = attacker->sp_atk_buff;
            attacker->sp_atk_buff = defender->sp_atk_buff;
            defender->sp_atk_buff = swap;
            battle_string_chooser = str_power_swap;
            break;
        case MOVE_GUARD_SWAP:
            swap = attacker->def_buff;
            attacker->def_buff = defender->def_buff;
            defender->def_buff = swap;
            swap = attacker->sp_def_buff;
            attacker->sp_def_buff = defender->sp_def_buff;
            defender->sp_def_buff = swap;
            battle_string_chooser = str_guard_swap;
            break;
        case MOVE_HEART_SWAP:
            swap = attacker->hp_buff;
            attacker->hp_buff = defender->hp_buff;
            defender->hp_buff = swap;

            swap = attacker->spd_buff;
            attacker->spd_buff = defender->spd_buff;
            defender->spd_buff = swap;

            swap = attacker->evasion_buff;
            attacker->evasion_buff = defender->evasion_buff;
            defender->evasion_buff = swap;

            swap = attacker->atk_buff;
            attacker->atk_buff = defender->atk_buff;
            defender->atk_buff = swap;

            swap = attacker->sp_atk_buff;
            attacker->sp_atk_buff = defender->sp_atk_buff;
            defender->sp_atk_buff = swap;

            swap = attacker->atk_buff;
            attacker->atk_buff = defender->atk_buff;
            defender->atk_buff = swap;

            swap = attacker->sp_atk_buff;
            attacker->sp_atk_buff = defender->sp_atk_buff;
            defender->sp_atk_buff = swap;
            battle_string_chooser = str_heart_swap;
            
            swap = attacker->acc_buff;
            attacker->acc_buff = defender->acc_buff;
            defender->acc_buff = swap;
            break;
    }
    return false;
}