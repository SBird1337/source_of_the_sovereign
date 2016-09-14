#include <battle_structs.h>
#include <battle.h>

u8 roost_change_type()
{
    if(battle_participants[battle_attacker_bank].type1 == TYPE_FLYING)
    {
        battle_participants[battle_attacker_bank].type1 = TYPE_EGG;
    }
    if(battle_participants[battle_attacker_bank].type2 == TYPE_FLYING)
    {
        battle_participants[battle_attacker_bank].type2 = TYPE_EGG;
    }
    return 0;
}