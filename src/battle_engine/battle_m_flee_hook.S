.text
.align 2
.thumb

.global battle_m_flee_hook
battle_m_flee_hook:

ldr r0, =battle_type_flags
ldr r0, [r0]
mov r1, #0xA
and r0, r1
cmp r0, #8
bne no_trainer
ldr r0, =battle_buffer_b
ldr r4, =battle_active_side
ldrb r1, [r4]
lsl r1, #9
add r0, #1
add r1, r1, r0
ldrb r0, [r1]
cmp r0, #3
bne no_flee
ldr r0, =0x080146CB
bx r0
no_trainer:
/* here we have a wild battle (hopefully) and want to intercept on flag */
@for testing: intercept everything!

@only intercept the flee command though...
ldr r0, =battle_buffer_b
ldr r4, =battle_active_side
ldrb r1, [r4]
lsl r1, #9
add r0, #1
add r1, r1, r0
ldrb r0, [r1]
cmp r0, #3
bne no_flee

ldr r0, =0x081D8924 @some move script change later
bl call_battle_call_move_something
ldr r1, =battle_preparation_phase
ldrb r0, [r4]
add r0, r0, r1
ldr r1, =0x08014927
bx r1
no_flee:
ldr r0, =0x080146ED
bx r0

.align 2
call_battle_call_move_something:
ldr r1, =battle_call_bc_move_exec
bx r1