.text
.align 2
.thumb
.global jump_behavior

jump_behavior:
lsl r0, r3, #0x10
asr r0, r0, #0x10
lsl r1, r1, #0x10
asr r1, r1, #0x10

cmp r4, #0
bne check_up

@Looking down

add r3, r1, #1
push {r0-r2}
mov r1, r3
bl check_block_role
mov r3, r0
pop {r0-r2}
cmp r3, #0x3D
beq return_false
b check_for_jump_bytes

check_up:
cmp r4, #1
bne check_left

@Looking Up
sub r3, r1, #1
push {r0-r2}
mov r1, r3
bl check_block_role
mov r3, r0
pop {r0-r2}
cmp r3, #0x3D
beq return_false
b check_for_jump_bytes

check_left:
cmp r4, #2
bne right

@Looking left

sub r3, r0, #1
push {r0-r2}
mov r0, r3
bl check_block_role
mov r3, r0
pop {r0-r2}
cmp r3, #0x3D
beq return_false
b check_for_jump_bytes

right:
@Looking right
add r3, r0, #1
push {r0-r2}
mov r0, r3
bl check_block_role
mov r3, r0
pop {r0-r2}
cmp r3, #0x3D
beq return_false
b check_for_jump_bytes

return_false:
mov r0, #0
pop {r4}
pop {r1}
bx r1

check_for_jump_bytes:

bl check_block_role
lsl r0, r0, #0x18
lsr r0, r0, #0x18
cmp r0, #0x3C
bne normal_return

ldr r0, =0x08068148|1 @"return true"
bx r0
normal_return:
ldr r3, =0x08068126|1 @"check others"
bx r3

check_block_role:
ldr r3, block_role_at
bx r3

.align 2
block_role_at:
.word 0x08058F78|1