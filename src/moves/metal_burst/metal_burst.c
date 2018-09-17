#include <battle_locations.h>
#include <types.h>

u8 metal_burst_dmg_reduction()
{
    battle_damage_store = battle_damage_store - (battle_damage_store >> 2);
    return false;
}