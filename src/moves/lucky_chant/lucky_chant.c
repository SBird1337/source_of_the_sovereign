#include <battle_locations.h>
#include <battle_common.h>
#include <battle_custom_structs.h>
#include <battle_structs.h>

u8 lucky_chant_set()
{
    u8 attacker_side = get_side_from_bank(battle_attacker_bank);
    if(custom_battle_elements.ptr->side_affecting[attacker_side].lucky_chant)
    {
        battlescript_cursor = (void*)(0x081D7DF0);
        return true;
    }
    custom_battle_elements.ptr->side_affecting[attacker_side].lucky_chant = 5;
    custom_battle_elements.ptr->side_affecting[attacker_side].lucky_chant_bank = battle_attacker_bank;
    return false; 
}