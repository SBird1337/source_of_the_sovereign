#include "battle_help.h"

//from kds emerald battle engine upgrade

u8 type_effectiveness_table[TYPE_FAIRY-0x4][TYPE_FAIRY-0x4] = {
    {10,10,10,10,10,05,10,00,05,10,10,10,10,10,10,10,10,10,10}, //normal
    {20,10,05,05,10,20,05,00,20,10,10,10,10,10,05,20,10,20,05}, //fight
    {10,20,10,10,10,05,20,10,05,10,10,10,20,05,10,10,10,10,10}, //flying
    {10,10,10,05,05,05,10,05,00,10,10,10,20,10,10,10,10,10,20}, //poison
    {10,10,00,20,10,20,05,10,20,10,20,10,05,20,10,10,10,10,10}, //ground
    {10,05,20,10,05,10,20,10,05,10,20,10,10,10,10,20,10,10,10}, //rock
    {10,05,05,05,10,10,10,05,05,10,05,10,20,10,20,10,10,20,05}, //bug
    {00,10,10,10,10,10,10,20,10,10,10,10,10,10,20,10,10,05,10}, //ghost
    {10,10,10,10,10,20,10,10,05,10,05,05,10,05,10,20,10,10,20}, //steel
    {10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10}, //egg
    {10,10,10,10,10,05,20,10,20,10,05,05,20,10,10,20,05,10,10}, //fire
    {10,10,10,10,20,20,10,10,10,10,20,05,05,10,10,10,05,10,10}, //water
    {10,10,05,05,20,20,05,10,05,10,05,20,05,10,10,10,05,10,10}, //grass
    {10,10,20,10,00,10,10,10,10,10,10,20,05,05,10,10,05,10,10}, //electric
    {10,20,10,20,10,10,10,10,05,10,10,10,10,10,05,10,10,00,10}, //psychic
    {10,10,20,10,20,10,10,10,05,10,05,05,20,10,10,05,20,10,10}, //ice
    {10,10,10,10,10,10,10,10,05,10,10,10,10,10,10,10,20,10,00}, //dragon
    {10,05,10,10,10,10,10,20,10,10,10,10,10,10,20,10,10,05,05}, //dark
    {10,20,10,05,10,10,10,10,05,10,05,10,10,10,10,10,20,20,10}  //fairy
};

u16 damage_type_effectiveness_update(u8 attacking_type, u8 defending_type, u8 atk_bank, u8 def_bank, u16 chained_effect, u8 airstatus)
{
	u8 effect,atype=attacking_type,dtype=defending_type;
    if(!chained_effect || atype==TYPE_EGG || dtype==TYPE_EGG)
        return chained_effect;

    if(atype>=TYPE_FAIRY)
        atype=atype-5;

    if(dtype>=TYPE_FAIRY)
        dtype=dtype-5;
	effect=type_effectiveness_table[atype][dtype];
	
	if (custom_battle_struct.ptr->various.inverse_battle)
    {
        if (effect == 20)
        {
            effect = 5;
        }
        else if (effect == 5 || effect == 0)
        {
            effect = 20;
        }
    }
	//handle normal / fighting on ghost
	if ((((attacking_type == TYPE_NORMAL || attacking_type == TYPE_FIGHTING) && defending_type == TYPE_GHOST && ((battle_participants[def_bank].status2.foresight))) || battle_participants[atk_bank].ability_id == ABILITY_SCRAPPY) && effect == 0)
    {
        effect = 10;
    }
	//handle other effectiveness changers here
	
	switch(effect)
    {
        case 0:
            chained_effect = 0;
            break;
        case 5:
            chained_effect = chained_effect>>1;
            break;
        case 20:
            chained_effect = chained_effect<<1;
            break;
    }
	return chained_effect;
	
}

u16 apply_type_effectiveness(u16 chained_effect, u8 move_type, u8 target_bank, u8 atk_bank, u8 airstatus)
{
    u8 defender_type1 = battle_participants[target_bank].type1;
    u8 defender_type2 = battle_participants[target_bank].type2;
    //set different types
    if (defender_type2 == defender_type1)
        defender_type2 = TYPE_EGG;
    chained_effect = damage_type_effectiveness_update(move_type, defender_type1, atk_bank, target_bank, chained_effect, airstatus);
    chained_effect = damage_type_effectiveness_update(move_type, defender_type2, atk_bank, target_bank, chained_effect, airstatus);
    return chained_effect;
}

u16 type_effectiveness_calc(u16 move, u8 move_type, u8 atk_bank, u8 def_bank, u8 effects_handling_and_recording)
{
	u16 chained_effect = 64;
	//TODO: double_type moves
	//TODO: get air status
	chained_effect = apply_type_effectiveness(chained_effect, move_type, def_bank, atk_bank, 2);
	//TODO: save into structs
	//TODO: effect_handling_and_recoring
	return chained_effect;
}