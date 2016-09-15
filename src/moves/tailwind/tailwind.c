#include <battle.h>

extern void* bs_tailwind_failed_ptr;

u8 set_tailwind()
{
    struct side_affecting* current_side = &custom_battle_elements.ptr->side_affecting[get_side_from_bank(battle_attacker_bank)];
    if(!current_side->tailwind)
    {
        current_side->tailwind = 5;
        current_side->tailwind_bank = battle_attacker_bank;
        return false;
    }
    battlescript_cursor = (void*)(0x081D7DF0);
    return true;
}