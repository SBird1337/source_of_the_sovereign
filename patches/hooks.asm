_call_via_r0 equ 0x081E3BA8
_call_via_r1 equ 0x081E3BAC

// disable help menu
// see: https://www.pokecommunity.com/showthread.php?t=364909
.org 0x0813B8C2
    .halfword 0xE01D

// idle loop eliminiation
.org 0x080008A4
    cmp r0, #0
    bne ile_end_wait
    mov r3, #1
ile_idle_loop:
    swi #2
    ldrh r1, [r2, #0x1c]
    mov r0, r3
    and r0, r1
    beq ile_idle_loop
ile_end_wait:
    pop {r0}
    bx r0

//--------------
// IRAM hacks
//--------------

// decrease amount of valid file handles from 20 to 12 to free up some IRAM
NUM_FILE_HANDLES equ 12
.org 0x081E9948
    cmp r1, #(NUM_FILE_HANDLES - 1)
.org 0x081E99E4
    add r0, #((NUM_FILE_HANDLES - 1) * 8)
.org 0x081E9AA4
    cmp r6, #NUM_FILE_HANDLES
.org 0x081E9ADE
    cmp r6, #NUM_FILE_HANDLES
.org 0x081E9B1C
    cmp r6, #NUM_FILE_HANDLES
    bge 0x081E9B2E
.org 0x081E9BA6
    cmp r7, #NUM_FILE_HANDLES
    bge 0x081E9BB8
.org 0x081E9BDA
    cmp r0, #NUM_FILE_HANDLES
    blo 0x081E9BE2
.org 0x081E9C84
    cmp r1, #NUM_FILE_HANDLES
    bge 0x081E9C94

//----------------
// S-Bird stuff
//----------------

//Don't know what thats all about... leaving it commented for now
//.org 0x0800f268
//    .halfword 0xE000


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

.org 0x0806E568
    ldr r3, =var_get_hack|1
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

.org 0x0804C034
    ldr r0, =clear_sav1|1
    bx r0
    .pool

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
