#include <battle_locations.h>
#include <battle_structs.h>

u8 venoshock_has_multiplier()
{
    if(battle_participants[battle_defender_bank].status.flags.poison || battle_participants[battle_defender_bank].status.flags.toxic_poison)
        battle_damage_multiplier *= 2;
    return false;
}