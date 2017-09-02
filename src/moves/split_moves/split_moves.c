#include <battle_locations.h>
#include <battle_structs.h>
#include <moves.h>

extern void* str_guard_split_ref;
extern void* str_power_split_ref;

u8 split_status() {
    if (battle_executed_move == MOVE_GUARD_SPLIT) {
        u16 defense = (battle_participants[battle_attacker_bank].def + battle_participants[battle_defender_bank].def) >> 1;
        u16 sdefense = (battle_participants[battle_attacker_bank].sp_def + battle_participants[battle_defender_bank].sp_def) >> 1;

        battle_participants[battle_attacker_bank].def = defense;
        battle_participants[battle_attacker_bank].sp_def = sdefense;
        battle_participants[battle_defender_bank].def = defense;
        battle_participants[battle_defender_bank].sp_def = sdefense;
        battle_string_chooser = str_guard_split_ref;
    }
    else if (battle_executed_move == MOVE_POWER_SPLIT) {
        u16 attack = (battle_participants[battle_attacker_bank].atk + battle_participants[battle_defender_bank].atk) >> 1;
        u16 sattack = (battle_participants[battle_attacker_bank].sp_atk + battle_participants[battle_defender_bank].sp_atk) >> 1;

        battle_participants[battle_attacker_bank].atk = attack;
        battle_participants[battle_attacker_bank].sp_atk = sattack;
        battle_participants[battle_defender_bank].atk = attack;
        battle_participants[battle_defender_bank].sp_atk = sattack;
        battle_string_chooser = str_power_split_ref;
    }
    return false;
}