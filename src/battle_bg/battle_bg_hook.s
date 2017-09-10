#include <config.h>
.align 2
.thumb
.text

.global battle_bg_hook
battle_bg_hook:
	ldr r0, =npc_states
	ldrb r0, [r0, #0x1E]
	cmp r0, #0x10
	beq sea_type_bg
	cmp r0, #0x11
	beq sea_type_bg
	cmp r0, #0x12
	beq sea_type_bg
	cmp r0, #0x15
	beq sea_type_bg
normal_type_bg:
	ldrh r0, =NORMAL_VAR
	b custom_load_attempt
sea_type_bg:
	ldrh r0, =SEA_VAR
custom_load_attempt:
	ldr r1, =var_access
	bl bxr1
	ldrh r0, [r0]
	cmp r0, #0
	beq normal_end
	sub r0, #1
	b end

	ldr r1, =var_access
	bl bxr1
	ldrh r0, [r0]
	
normal_end:
	ldr r0, =get_bs_elem_env_index
	bl bxr0
	lsl r0, #0x18
	lsr r0, #0x18
	end:
	ldr r1, =load_battle_screen_elements_1
	bl bxr1
	pop {r0}
	bx r0
bxr1:
	bx r1
bxr0:
	bx r0
