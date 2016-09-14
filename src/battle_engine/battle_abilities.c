#include <battle_abilities.h>
#include <custom_structs.h>

#include "battle_structs.h"

u8 has_ability_effect(u8 bank, u8 mold_breaker, u8 gastro)
{
    if(gastro && custom_battle_elements.ptr->bank_affecting[bank].gastro_acided)
        return false;
    return true;
    //TODO: MOLD BREAKER
}

u8 weather_abilities_effect()
{
    //TODO: AIR LOCK AND CLOUD NINE
    return true;
}
u8 has_ability(u8 bank, u8 ability)
{
    return (has_ability_effect(bank,0,1) && battle_participants[bank].ability_id == ability);
}