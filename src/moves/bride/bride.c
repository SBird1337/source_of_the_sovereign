#include <battle.h>

u8 bride_has_multiplier()
{
    if(battle_participants[battle_defender_bank].current_hp <= battle_participants[battle_defender_bank].max_hp >> 1)
        battle_damage_multiplier *=2;
    return 0;
}