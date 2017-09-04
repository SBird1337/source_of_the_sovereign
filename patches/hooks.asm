_call_via_r0 equ 0x081E3BA8
_call_via_r1 equ 0x081E3BAC

//Ipatix sound stuff
.org 0x080007B4
    .word  0x0203E000   // new PCM work area
.org 0x081DD0B4
    .word  main_mixer   // new mixer ROM location
    .word  0x03005F50   // new mixer RAM location (used for loading)
    .halfword mixer_size
    .halfword 0x400        // CpuSet, copy code by 32 bit units
    .word  0x0203E000   // new PCM work area
.org 0x081DD0C8
     // set correct sound driver operation mode
     // 12 channels at 26758 Hz samplerate
    .byte  0x00, 0xCC, 0x98, 0x00
.org 0x081DC094
    .word  0x03005F50+1 // new mixer RAM location (used for branch)

   // repoint correctly to the new cry tables
.org 0x080720C8
    .include "patches/disable_cry_table_blocks.s"

   // cry-ID = poke-ID
.org 0x08043304
    LSL R0, R0, #0x10
    LSR R0, R0, #0x10
    BX  LR

   // music overrides

.org 0x0808064C // encounter music ([!] Box) song hook
    LDR R1, =mhk_intro_music_id_to_song|1
    BL  _call_via_r1
    B   0x080806BA
    .pool

.org 0x08044090
    LDR R1, =mhk_current_map_music_set_default_for_battle|1
    BX  R1
    .pool

.org 0x080156FE // trainer victory music hook
    LDR R0, =mhk_trainer_battle_play_defeat|1
    BL  _call_via_r0
    B   0x0801576E
    .pool

.org 0x08021D46  // wild poke defeated
    BL  _call_via_r0
.org 0x08021D94
    .word   mhk_wild_poke_def_music|1

.org 0x0807F9F8
    LDR R1, =0x0807FA3E
    BL  _call_via_r1
    MOV R1, R0
    B   0x0807FA3E
    .pool

.org 0x080159D0
    LDR R0, =mhk_fadeout|1
    BL  _call_via_r0
    B   0x080159DC
    .pool


//End of sound stuff

//Don't know what thats all about... leaving it commented for now
//.org 0x0800f268
//    .halfword 0xE000

//Battle bg use new table
.org 0x0800F2A0
    .word battle_bg_table

.org 0x0800F2E0
    .word battle_bg_table

.org 0x0800F320
    .word battle_bg_table

.org 0x0800F40E
    ldr r0, =battle_bg_hook|1
    bx r0
    lsl r0, #0
	.pool

.org 0x0800FD5C
    .word battle_bg_table

.org 0x0800FD88
    .word battle_bg_table
//end of battle bg table

//flag routine
.org 0x0806E5D6
	ldr r0, =flag_hook|1
	bx r0
	lsl r0, #0
	.pool

.org 0x0806E584
    ldr r3, =var_set_hack|1
    bx r3
    .pool

.org 0x0806E680
    ldr r1, =flag_set_hack|1
    bx r1
    .pool
//end of flag routine

//var routine
.org 0x0806E45C
    ldr r0,=var_hook+1
    bx r0
	.pool

.org 0x0806A390
    ldr r3, =var_set_script_hack|1
    bx r3
    .pool

//end of var routine

//trainer Flag stuff
.org 0x08080378
	ldr r1, =trainerflag_read_fix+1
	bx r1
    .pool

.org 0x080800B8
    ldr r2, =trainerflag_opponent_fix+1
    bx r2
    .pool

.org 0x08080424
    ldr r1, =trainerflag_check_fix+1
    bx r1
    .pool

.org 0x0808043c
    ldr r1, =trainerflag_set_fix+1
    bx r1
    .pool

.org 0x08080450
    ldr r1, =trainerflag_clear_fix+1
    bx r1
    .pool
//end of trainer flag stuff

//New behavior bytes for jumping

.org 0x0806811A
	ldr r0,=jump_behavior|1
	bx r0
	.pool

//behavior walk stuff
.org 0x0806D720
	ldr r0,=on_step|1
	bx r0
	.pool

//end of new behavior bytes for jumping

//transparent textboxes and mugshots
.org 0x08069410
    bx r0

.org 0x0806941C
    .word trans_activate|1

.org 0x08069504
    bx r1

.org 0x0806950C
    .word trans_deactivate|1

.org 0x08150000
    ldr r0, =pal_load_hook_2|1
    bx r0
	.pool

.org 0x0815044A
    bx r1

.org 0x08150450
    .word pal_load_hook|1

.org 0x0809CEB2
    ldr r0, =trans_mug_close_fix+1
    bx r0
    lsl r0, #0
	.pool

//end of transparent textboxes and mugshots

//saveblock routine start

.org 0x080D9EDC
    ldr r0, =load_hijack|1
    bx r0
    .pool

.org 0x080d991E
    bx r7
.org 0x080d995C
    .word store_hijack|1

.org 0x083FEC94
.include "patches/save_table/save_table.s"

//end of saveblock routine
//new battle script commands
	//replace tables
.org 0x08014C1C
	.word bs_command_table
.org 0x08015A28
	.word bs_command_table
.org 0x08015C6C
	.word bs_command_table
.org 0x08015C98
	.word bs_command_table
.org 0x0801D054
	.word bs_command_table

//end of new battle script commands

//move effect table

.org 0x08016364
	.word m_effect_table
.org 0x08023328
	.word m_effect_table
.org 0x08025CF8
	.word m_effect_table
.org 0x08027464
	.word m_effect_table
.org 0x080297F0
	.word m_effect_table
.org 0x0802BE80
	.word m_effect_table

//end of move effect table

//move limits

.org 0x080D75FC
	.byte 0,0,0,0,0,0

//end of move limits

//print string mod

.org 0x080D77C0
	bx r1

.org 0x080D77CC
	.word custom_print_string|1

//end of print string mod

//new move animation table
.org 0x080725d0
    .word m_animation_table
//end of new move animation table
