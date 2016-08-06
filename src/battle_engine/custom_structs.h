#ifndef B_NEW_STRUCT
#define B_NEW_STRUCT

#include <types.h>

struct bank_affecting {
	u8 embargo : 3;
    u8 electrify : 1;
    u8 telekinesis: 3;
    u8 magnet_rise : 3;
    u8 heal_block : 3;
    u8 aqua_ring : 1;
    u8 powder : 1;
    u8 smacked_down : 1;
    u8 quashed : 1;
    u8 just_switched_in : 1;
    u8 ally_fainted_last_turn : 1;
    u8 miracle_eyed : 1;
    u8 spiky_shield : 1;
    u8 kings_shield : 1;
    u8 life_orbed : 1;
    u8 sheerforce_bonus : 1;
    u8 eaten_berry : 1;
    u8 sunshine_form : 1;
    u8 cherrim_transformed : 1;
    u8 gastro_acided : 1;
    u8 sky_drop_attacker : 1;
    u8 sky_drop_target : 1;
    u8 gem_boost : 1;
    u8 me_first : 1;
    u8 weakness2 : 1;
    u8 ate_bonus : 1;
    u8 entry_message : 1;
    u8 powertrick : 1;
    u8 kingsshield_damage : 1;
    u8 spikyshield_damage : 1;
    u8 grassyterrain_heal : 1;
    u8 item_used : 1;
    u8 slowstart_duration : 3;
    u8 aegislash_form : 2; //0 = not aegi, 1 = defensive, 2 = attacking
    u8 killer_bank : 2;
    u8 same_move_used : 3;
    u8 wrap_bank : 2;
    u8 move_failed : 1;
    u8 type3 : 5;
    u8 stat_lowered : 1;
    u8 roost : 3;
    u8 bugbite : 1;
    s8 stockpile_def_changes;
    s8 stockpile_sp_def_changes;
    u8 autonomize_uses;
    u16 wish_hp;
};

struct side_affecting {
	u8 sticky_web : 1;
    u8 sticky_web_done : 1;
    u8 toxic_spikes_psn : 1;
    u8 toxic_spikes_badpsn : 1;
    u8 toxic_spikes_done : 1;
    u8 stealthrock : 1;
    u8 stealthrock_done : 1;
    u8 lucky_chant : 3;
    u8 lucky_chant_bank : 2;
    u8 tailwind : 3;
    u8 tailwind_bank : 2;
    u8 wide_guard : 1;
    u8 quick_guard : 1;
    u8 crafty_shield : 1;
    u8 combo_waterpledge : 1;
    u8 combo_firepledge : 1;
    u8 combo_grasspledge : 1;
    u8 swamp_spd_halving : 3;
    u8 sea_of_fire : 3;
    u8 rainbow : 3;
    u8 mat_block : 1;
    u8 lunardance : 1;
    u8 lunardance_done : 1;
    u8 echo_voice_counter : 3;
    u8 mega_evo_state : 2; //0 = neither mega evolved nor triggered, 1 = triggered to mega evolve(if set, should reset next turn in case poke didn't mega evolve), 2 = mega evolved
};

struct field_affecting {
	u8 trick_room : 3;
    u8 wonder_room : 3;
    u8 magic_room : 3;
    u8 grassy_terrain : 3;
    u8 electic_terrain : 3;
    u8 misty_terrain : 3;
    u8 ion_deluge : 3;
    u8 gravity : 3;
    u8 round_chosen : 1;
    u8 fairy_lock : 1;
};

struct various {
	u8 eaten_berry_player : 6;
    u8 eaten_berry_opponent : 6;
    u8 active_bank : 2;
    u8 inverse_battle : 1;
    u8 magicbounce : 1;
    u8 stormdrain : 1;
    u16 var1;
    u16 var2;
    u16 recently_used_item;
    u16 previous_move;
};

struct custom_battle_struct{
    struct bank_affecting bank_affecting[4];
    struct side_affecting side_affecting[2];
    struct field_affecting field_affecting;
    struct various various;
};

struct custom_battle_struct_ptr{
    struct custom_battle_struct *ptr;
};

extern struct custom_battle_struct_ptr custom_battle_struct;

#endif