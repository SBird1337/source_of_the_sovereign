#include <battle.h>

u8 assurance_damage_modifier()
{
    if((battle_protect[battle_defender_bank].physical_damage + battle_protect[battle_defender_bank].special_damage) > 0)
        battle_damage_multiplier *=2;
}