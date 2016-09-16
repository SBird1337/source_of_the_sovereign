#include <battle.h>

u8 pay_back_damage_modifier()
{
    if(battle_turn_order[battle_attacker_bank] > battle_turn_order[battle_defender_bank])
        battle_damage_multiplier *=2;
    return false;
}