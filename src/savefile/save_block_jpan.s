.align 2
.thumb


/*cc left in first block
70 +70+70+108 = 258 in people block
8*70 + 820 = BA0 from box block
grand total of EC4 wasted space (9/10 of block wasted)
saved c000 to c0cc at first block (0x0)
saved c0cc to c324 at fifth block (0x4)
saved c324 to cec4 at 14th block (0xd)*/


/*at 080D9EDC, in the save routine, place a branch to this (in r0)*/
/*in pre-patched Fire Red, d9ef0*/
.global load_hijack
load_hijack:	ldr r1, [r4]
		mov r3, #0xff 
		lsl r3, r3, #0x4
		add r3, r3, r1
		ldrh r0, [r3, #0x4]
		cmp r0, #0x0
		beq first_cc_load
		cmp r0, #0x4
		beq middle_load
		cmp r0, #0xd
		beq last_load


load_ender:	cmp r5, #0xd
		ble next_loop_iter
		
		mov r0, #0x1
		pop {r3}
		mov r8, r3
		pop {r4-r7}	
		pop {r1}
		bx r1	

first_cc_load:	mov r1, #0xcc
		ldr r2, c0c8_addr
		b load_loop	
	
middle_load:	mov r1, #0x96
		lsl r1, r1, #0x2
		ldr r2, c320_addr
		b load_loop

last_load:	mov r1, #0xba
		lsl r1, r1, #0x4
		ldr r2, cec0_addr
				

load_loop:	sub r3, #0x4
		ldr r0, [r3]
		str r0, [r2]
		sub r2, #0x4	
		sub r1, #0x4
		cmp r1, #0x0
		bne load_loop
		b load_ender
.hword 0x0000
c0c8_addr:	.word 0x0203c0c8
c320_addr:	.word 0x0203c320
cec0_addr:	.word 0x0203cec0

next_loop_iter:	ldr r0, game_load_ret_addr
		bx r0
game_load_ret_addr:	.word 0x080D9E71
/*d9e85 for pre-patched*/


.word 0xffffffff
/*for the Save routine, we hijack before the save on Flash routine
that is located at 080d991e. Change there for bx r7, and at 80D995C
place pointer to this*/
/*in pre-patched version is d9932 and d9970*/
.global store_hijack
store_hijack:	mov r7, #0xff
		lsl r7, r7, #0x4
		add r7, r1, r7
		strh r0, [r7,#0x6]
		ldrh r6, [r7, #0x4]
		cmp r6, #0x0
		beq first_store
		cmp r6, #0x4
		beq middle_store
		cmp r6, #0xd
		beq last_store

.hword 0x0000
store_ender:	ldr r0, game_store_ret_addr
		bx r0
game_store_ret_addr:	.word 0x080D9923
/*in pre-patched return is d9937*/


first_store:	mov r3, #0xcc
		ldr r2, c0c8_addr_2
		b store_loop	
	
middle_store:	mov r3, #0x96
		lsl r3, r3, #0x2
		ldr r2, c320_addr_2
		b store_loop

last_store:	mov r3, #0xba
		lsl r3, r3, #0x4
		ldr r2, cec0_addr_2

store_loop:	sub r7, #0x4
		ldr r0, [r2]
		str r0, [r7]
		sub r2, #0x4
		sub r3, #0x4
		cmp r3, #0x0
		bne store_loop
		b store_ender

c0c8_addr_2:	.word 0x0203c0c8
c320_addr_2:	.word 0x0203c320
cec0_addr_2:	.word 0x0203cec0
