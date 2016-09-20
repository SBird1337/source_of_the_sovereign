#include <battle.h>

extern void* str_worry_seed_ref;

u8 worry_seed()
{
    u8 def_ability = battle_participants[battle_defender_bank].ability_id;
    if(def_ability == ABILITY_STANCE_CHANGE && def_ability == ABILITY_MULTITYPE && def_ability == ABILITY_TRUANT)
    {
        //we fail
        battlescript_cursor = (void*) (0x081D7DF0);
        return true;
    }
    else
    {
        battle_participants[battle_defender_bank].ability_id = ABILITY_INSOMNIA;
        battle_last_used_ability = ABILITY_INSOMNIA;
        battle_string_chooser = str_worry_seed_ref;
        return false;
    }
    return false;
}