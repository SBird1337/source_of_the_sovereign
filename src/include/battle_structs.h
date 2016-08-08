#ifndef BATTLE_STRUCT_H_
#define BATTLE_STRUCT_H_

#include <types.h>

struct side_affecting_hword{
    u16 reflect_on : 1;
    u16 light_screen_on : 1;
    u16 unkown1 : 2;
    u16 spikes_on : 1;
    u16 safeguard_on : 1;
    u16 unkown2 : 2;
    u16 mist_on : 1;
    u16 spikes_damage_done : 1;
};

extern struct side_affecting_hword side_affecting_halfword[2];

struct status_main{
    u32 sleep : 3;
    u32 poison : 1;
    u32 burn : 1;
    u32 freeze : 1;
    u32 paralysis: 1;
    u32 toxic_poison : 1;
    u32 poison_counter : 4;
};

union main_status{
    u32 int_status;
    struct status_main flags;
};

#define STATUS_SLEEP 0x7
#define STATUS_POISON 0x8
#define STATUS_BURN 0x10
#define STATUS_FREEZE 0x20
#define STATUS_PARALYSIS 0x40
#define STATUS_TOXIC_POISON 0x80

struct flags2{
    u32 confusion : 3;
    u32 flinched : 1;
    u32 uproar : 3;
    u32 flag_x80 : 1;
    u32 bide : 2;
    u32 locked_and_confuse : 2;
    u32 multiple_turn_move : 1;
    u32 trapped_in_wrap : 3;
    u32 in_love : 4;
    u32 focus_energy : 1;
    u32 transformed : 1;
    u32 recharge : 1;
    u32 raged : 1;
    u32 substitute : 1;
    u32 destinny_bond : 1;
    u32 cant_escape : 1;
    u32 nightmare : 1;
    u32 cursed : 1;
    u32 foresight : 1;
    u32 defense_curled : 1;
    u32 tormented : 1;
};

struct iv_set
{
    u32 iv_hp: 5;
    u32 iv_atk: 5;
    u32 iv_def: 5;
    u32 iv_spd: 5;
    u32 iv_sp_atk: 5;
    u32 iv_sp_def: 5;
};

struct battle_participant {
    u16 poke_species;
    u16 atk;
    u16 def;
    u16 spd;
    u16 sp_atk;
    u16 sp_def;
    u16 moves[4];
    struct iv_set ivs;
    u8 hp_buff;
    u8 atk_buff;
    u8 def_buff;
    u8 spd_buff;
    u8 sp_atk_buff;
    u8 sp_def_buff;
    u8 acc_buff;
    u8 evasion_buff;
    u8 ability_id;
    u8 type1;
    u8 type2;
    u8 padd;
    u8 current_pp[4];
    u16 current_hp;
    u8 level;
    u8 happiness;
    u16 max_hp;
    u16 held_item;
    u8 poke_name[12];
    u8 trainer_name[8];
    u32 padd2;
    u32 pid;
    union main_status status;
    struct flags2 status2;
    u32 otid;
};

extern struct battle_participant battle_participants[4];

struct side_timer{
    u8 reflect_timer;
    u8 reflect_bank;
    u8 lightscreen_timer;
    u8 lightscreen_bank;
    u8 mist_timer;
    u8 mist_bank;
    u8 safeguard_timer;
    u8 safeguard_bank;
    u8 followme_timer;
    u8 followme_target;
    u8 spikes_amount;
    u8 fieldB;
};

extern struct side_timer battle_side_timers[2];

#endif