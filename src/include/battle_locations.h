#ifndef BATTLE_LOC_H_
#define BATTLE_LOC_H_

u8 battle_active_bank;
u8 battle_stat_changer;
u16 battle_executed_move;
u8 battle_attacker_bank;
u8 battle_defender_bank;
u8 battle_damage_multiplier;
u16 battle_damage_store;
u32 battle_hitmarker;
void* battlescript_cursor;
u8 battle_menu_chosen_item[4];

#endif