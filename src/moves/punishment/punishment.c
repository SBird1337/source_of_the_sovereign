#include <battle.h>

u8 punishment_damage_mod() {
    struct battle_participant* defender = &battle_participants[battle_defender_bank];
    u8 status_count =
            (defender->hp_buff > 6 ? defender->hp_buff - 6 : 0) +
            (defender->atk_buff > 6 ? defender->atk_buff - 6 : 0) +
            (defender->def_buff > 6 ? defender->def_buff - 6 : 0) +
            (defender->sp_atk_buff > 6 ? defender->sp_atk_buff - 6 : 0) +
            (defender->sp_def_buff > 6 ? defender->sp_def_buff - 6 : 0) +
            (defender->spd_buff > 6 ? defender->spd_buff - 6 : 0) +
            (defender->evasion_buff > 6 ? defender->evasion_buff - 6 : 0);

    battle_base_power = 60 + (status_count * 20);
    if (battle_base_power > 200)
        battle_base_power = 200;
    return false;
}