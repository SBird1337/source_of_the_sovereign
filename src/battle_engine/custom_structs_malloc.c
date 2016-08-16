#include <bpre.h>
#include <battle.h>
#include "custom_structs.h"
#include "custom_structs_malloc.h"

void malloc_battle_structs()
{
	custom_battle_elements.ptr=(struct custom_battle_struct*)malloc(sizeof(struct custom_battle_struct));
}

void free_battle_structs()
{
	free(custom_battle_elements.ptr);
	custom_battle_elements.ptr=0;
}

//hijack switch in command, clean up battle structs and carry over baton pass
void battle_switch_in()
{
    struct bank_affecting* current_bank_affecting = &custom_battle_elements.ptr->bank_affecting[battle_active_bank];
    //copy of the old structure to carry over baton pass effects
    struct bank_affecting prev_bank_affecting = custom_battle_elements.ptr->bank_affecting[battle_active_bank];
    memset(current_bank_affecting, 0, sizeof(struct bank_affecting));
    //handle type 3 if needed
    current_bank_affecting->just_switched_in = 1;
    current_bank_affecting->wish_hp = prev_bank_affecting.wish_hp;
    if(battle_executed_move == MOVE_BATON_PASS)
    {
        current_bank_affecting->aqua_ring = prev_bank_affecting.aqua_ring;
        current_bank_affecting->embargo = prev_bank_affecting.embargo;
        current_bank_affecting->powertrick = prev_bank_affecting.powertrick;
        current_bank_affecting->gastro_acided = prev_bank_affecting.gastro_acided;
        current_bank_affecting->heal_block = prev_bank_affecting.heal_block;
        
        if(prev_bank_affecting.powertrick)
        {
            //carry over switched stats of power trick
            u16 *atk = &battle_participants[battle_active_bank].atk;
            u16 *def = &battle_participants[battle_active_bank].def;
            u16 switch_var = *atk;
            *atk = *def;
            *def = switch_var;
        }
    }
    struct side_affecting* active_side = &custom_battle_elements.ptr->side_affecting[get_side_from_bank(battle_active_bank)];
    active_side->stealth_rock_done = 0;
    active_side->sticky_web_done = 0;
    active_side->toxic_spikes_done = 0;
    active_side->lunardance_done = 0;
    
    return;
}