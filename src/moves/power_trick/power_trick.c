#include <battle_structs.h>
#include <battle_locations.h>
#include <battle_custom_structs.h>

u8 power_trick_swap() 
{
    custom_battle_elements.ptr->bank_affecting[battle_active_bank].powertrick = 1;
    u16 *atk = &battle_participants[battle_active_bank].atk;
    u16 *def = &battle_participants[battle_active_bank].def;
    u16 switch_var = *atk;
    *atk = *def;
    *def = switch_var;
    return 0;
}