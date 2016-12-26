#include <battle_structs.h>
#include <battle_locations.h>

u8 hp_damage_mod()
{
    battle_base_power = battle_participants[battle_defender_bank].current_hp * 120;
    battle_base_power /= battle_participants[battle_defender_bank].max_hp;
    battle_base_power++;
    return false;
}