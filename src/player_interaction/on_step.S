#include <config.h>

.text
.align 2
.thumb
.global on_step
on_step:
	push {r5}
	bl safari_step
	lsl r0, #0x18
	lsr r0, #0x18
	cmp r0, #1
	beq return_true
	
	ldrh r0, =FLAG_WALK_SCRIPT
	bl read_flag
	cmp r0, #0
	beq check_walking_script
	sub SP, #4
	mov r0, sp
	mov r1, sp
	add r1, #2
	bl get_player_to
	mov r0, sp
	mov r1, sp
	add r1, #2
	ldrh r0, [r0]
	ldrh r1, [r1]
	add sp, #4
	lsl r0, #0x10
	asr r4, r0, #0x10
	lsl r1, #0x10
	asr r5, r1, #0x10
	mov r0, r4
	mov r1, r5
	bl check_block_role
	lsl r0, #0x18
	lsr r0, #0x18
	ldr r1, =behavior_walk_table
	lsl r0, #2
	add r0, r1
	ldr r0, [r0]
	mov r2, #0
	cmp r0, r2
	beq check_walking_script
	
	bl execute_script
	b return_false

check_walking_script:
	
	ldrh r0, =WALK_SCRIPT_VAR
	bl read_var
	ldrh r0, [r0]
	cmp r0, #0
	beq return_false
	sub r0, #1
	ldr r1, =script_walk_table
	lsl r0, #2
	add r0, r1
	ldr r0, [r0]
	mov r2, #0
	sub r2, #1
	cmp r0, r2
	beq return_false
	@@@EXECUTE WALKING SCRIPT HERE
	bl execute_script

return_false:
	mov r0, #0
	b end

return_true:
	mov r0, #1
end:
	pop {r5}
	pop {r4}
	pop {r1}
	bx r1

safari_step:
	ldr r3, =0x080A0F0C|1
	bx r3

get_player_to:
	ldr r3, =0x0805C538|1
	bx r3

check_block_role:
	ldr r3, =0x08058F78|1
	bx r3

read_var:
	ldr r3, =var_access
	bx r3

read_flag:
	ldr r3, =flag_decrypt_func
	bx r3
	
execute_script:
	ldr r3, =0x08069AE4|1
	bx r3