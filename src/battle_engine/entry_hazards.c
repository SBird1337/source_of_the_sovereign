#include "battle_help.h"
#include <bpre.h>

extern void* bs_stealth_rock;

u8 execute_entry_hazards()
{
	u8 active_side = get_side_from_bank(battle_active_bank);
	u8 has_effect = 0;
	struct side_affecting* active_side_affecting = &custom_battle_struct.ptr->side_affecting[active_side];
	//Debug
	//side_affecting_halfword[active_side].spikes_on=1;
	//battle_side_timers[active_side].spikes_amount=4;
	active_side_affecting->stealth_rock=1;
	//side_affecting_halfword[active_side].spikes_damage_done=0;
	
	if(side_affecting_halfword[active_side].spikes_on && !(side_affecting_halfword[active_side].spikes_damage_done))
	{
		//spikes lay down, deal spiky damage
		u32 damage = (battle_participants[battle_active_bank].max_hp) / ((5 - battle_side_timers[active_side].spikes_amount) * 2);
        if (damage == 0)
            damage = 1;
        battle_damage_store = damage;
		
		side_affecting_halfword[active_side].spikes_damage_done = 1;
		battle_script_push();
		battlescript_cursor = (void*)(0x081D8CBE);
		has_effect = 1;
	}
	else if(active_side_affecting->stealth_rock && !(active_side_affecting->stealth_rock_done))
	{
		active_side_affecting->stealth_rock_done=1;
		//check for magic guard here
		u32 damage = battle_participants[battle_active_bank].max_hp;
		switch (type_effectiveness_calc(MOVE_STEALTH_ROCK, TYPE_ROCK, battle_active_bank^1, battle_active_bank, 0) >> 4)
		{
			case 1:
				damage = damage >> 5;
				break;
			case 2:
				damage = damage >> 4;
				break;
			case 4:
				damage = damage >> 3;
				break;
			case 8:
				damage = damage >> 2;
				break;
			case 16:
				damage = damage >> 1;
				break;
		}
		if(damage == 0)
			damage = 1;
		battle_damage_store = damage;
		
		battle_script_push();
		//spikes for now
		battlescript_cursor = bs_stealth_rock;
		has_effect = 1;
	}
	
	if (has_effect)
    {
       custom_battle_struct.ptr->various.var1 = battle_active_bank;
       battle_participants[battle_active_bank].status2.destinny_bond = 0;
       battle_hitmarker &= 0xFFFFFFBF;
    }
	return has_effect;
}