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

struct protect_struct{
    u8 flag0_protect : 1;
    u8 flag0_endure : 1;
    u8 flag0_onlystruggle : 1;
    u8 flag0_helpinghand : 1;
    u8 flag0_bouncemove : 1;
    u8 flag0_stealmove : 1;
    u8 flag0_unknown: 1;
    u8 flag0_prlz_immobility: 1;
    u8 flag1_confusion_self_damage: 1;
    u8 flag1_noteffective: 1;
    u8 flag1_chargingturn: 1; //dive, dig etc.
    u8 flag1_smokeballflee: 1;
    u8 flag1_runaway_flee: 1;
    u8 flag1_used_imprisoned_move: 1;
    u8 flag1_love_immobility: 1;
    u8 flag1_used_disabled_move: 1;
    u8 flag2_used_taunted_move: 1;
    u8 flag2_unknown: 1;
    u8 flag2_flinch_immobility : 1;
    u8 flag2_notfirststrike : 1;
    u8 flag2_free: 4;
    u8 field3;
    u32 physical_damage;
    u32 special_damage;
    u8 counter_target;
    u8 mirrorcoat_target;
    u16 fieldE;
};

extern struct protect_struct battle_protect[4];

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

struct in_battle_weather{
    u32 rain : 1;
    u32 downpour : 1;
    u32 permament_rain : 1;
    u32 sandstorm : 1;
    u32 permament_sandstorm : 1;
    u32 sun : 1;
    u32 permament_sun : 1;
    u32 hail : 1;
    //custom flags
    u32 permament_hail : 1;
    u32 fog : 1;
    u32 permament_fog : 1;
    u32 harsh_sun : 1;
    u32 heavy_rain : 1;
    u32 air_current : 1;
};

struct status_3{
    u32 leech_seed_hp_receiver : 2; // 2 bits
    u32 leech_seed : 1; //4
    u32 always_hits : 2; //x8 | x10
    u32 perish_song : 1; //x20
    u32 on_air : 1; //x40
    u32 underground : 1;//80
    u32 minimized : 1; //x100
    u32 charged_up : 1; //x200
    u32 rooted : 1; //x400
    u32 yawn : 2; //x800 || x1000
    u32 imprision : 1; //x2000
    u32 grudge : 1; //x4000
    u32 unkown_no_crit : 1; //x8000
    u32 mud_sport : 1; //x10 000
    u32 watersport : 1; //x20 000
    u32 underwater : 1; //x40 000
    u32 switchinlock : 1; //x80 000
    u32 unburden : 1; //x100 000 (previously trace)
    u32 phantomforce : 1; //x200 000
};

extern struct status_3 battle_status_3[4];

union battle_weather{
    u32 int_bw;
    struct in_battle_weather flags;
};

extern union battle_weather battle_weather;

struct mirror_move_set_per_bank
{
    u16 moves_per_target[4];
};

struct battle_stuff{
    u8 end_turn_statetracker1; //0x0
    u8 end_turn_checked_bank; //0x1
    u8 field_2; //0x2
    u8 end_turn_statetracker2; //0x3
    u16 trapped_move[4]; //0x4 - 0xB
    u8 move_target[4]; //0xC - 0xF
    u8 field_10; //0x10
    u8 field_11; //0x11
    u8 field_12; //0x12
    u8 dynamic_move_type; //0x13
    u8 trapper[4];//0x14-0x17
    u8 field_18[48]; //0x18-0x47
    u8 pre_attacks_bank_counter; //0x48
    u8 field_49; //0x49
    u8 money_multiplier; //0x4A
    u8 field_4B; //0x4B
    u8 switch_in_ability_bank_counter; //0x4C
    u8 field_4D[7]; //0x4D-0x53
    u8 field_54; //0x54
    u8 field_55; //0x55
    u8 field_56; //0x56
    u8 field_57; //0x57
    u8 field_58[4];
    u8 field_5C[35];
    u8 castform_switch_form; //0x7F
    u8 chosen_move_position[4]; //0x80
    u8 field_84[13]; //0x84-0x90
    u8 absent_bank_flags_prev_turn; //0x91
    u8 field_92[6]; //0x92-0x97
    u16 mirror_moves_pbs[4]; //0x98-0x9F
    u8 field_A0[18]; //0xA0-0xB1
    u8 synchronize_effect_chooser; //0xB2
    u8 field_B3[5];
    u16 used_held_items[4]; //0xB8-0xBF
    u8 field_C0[8]; //0xC0-0xC7
    u16 choiced_move[4]; //0xC8-0xCF (checked in cmd49)
    u16 changed_held_items[4]; //0xD0-0xD8 (later written to battlestruct in cmd49)
    u8 intimidate_user; //0xD8
    u8 switch_in_item_bank_counter; //0xD9
    u8 field_DA; //0xDA
    u8 field_DB; //0xDB
    u8 field_DC; //0xDC
    u8 field_DD; //0xDD
    u8 field_DE; //0xDE
    u8 field_DF; //0xDF
    struct mirror_move_set_per_bank mirror_move_set_pbs[4]; //0xE0-0xFF
    u8 field_100[162]; //0x100-0x1A1
    u8 battle_load_weather_from_map_flag; //0x1A2
    u8 atk_canceller_state_tracker; //0x1A3
    u8 field_1A4[240]; //0x1A4-0x293
    u8 switchout_index[4]; //0x294-0x297
    u8 field_298[11];
    u8 field_2A3;
};

struct battle_stuff_struct{
    struct battle_stuff *ptr;
};

extern struct battle_stuff_struct battle_stuff_ptr;

struct prop_flags{
    u8 makes_contact : 1;//1
    u8 affected_by_protect : 1;//2
    u8 affected_by_magic_coat : 1;//4
    u8 affected_by_snatch : 1;//8
    u8 affected_by_mirrormove :1;//x10
    u8 affected_by_kingsrock :1;//x20
    u8 raised_crit_ratio :1;//x40
    u8 unused_bit : 1;//x80
};

union move_flags{
    u8 int_flag;
    struct prop_flags flags;
};

struct move_info{
    u8 script_id;
    u8 base_power;
    u8 type;
    u8 accuracy;
    u8 pp;
    u8 effect_chance;
    u8 target;
    s8 priority;
    union move_flags move_flags;
    u8 arg1;
    u8 split;
    u8 arg2;
};

struct b_enigma_berry{
    u8 field0[7];
    u8 battle_effect_x12;
    u8 field8[18];
    u8 quality;
    u8 field1B;
};

extern struct b_enigma_berry battle_enigma_berry[4];

#endif