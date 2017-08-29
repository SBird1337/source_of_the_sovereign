.text
.align 2
.thumb
.global tm_compat

tm_compat:
mov r3, r1
cmp r4, #0x56 @number between last hm and first new tm plus 0x3a
bge newtm

check:
cmp r4, #0x1f
bls first_32
cmp r4, #0x3f
bls first_64
cmp r4, #0x5f
bls first_96

after_96:
mov r0, r4
sub r0, #0x60
mov r2, #0x1
lsl r2, r0
ldr r0, =tm_hm_comp_table
lsl r1, r1, #0x4
add r0, #0xC

get_offset:
add r1, r1, r0
ldr r0, [r1]
and r0, r2
b exit

newtm:
sub r4, #0x1C @number between last hm and first new tm
b check

first_64:
mov r0, r4
sub r0, #0x20
mov r2, #0x1
lsl r2, r0
ldr r0, =tm_hm_comp_table
lsl r1, r1, #0x4
add r0, #0x4
b get_offset

first_96:
mov r0, r4
sub r0, #0x40
mov r2, #0x1
lsl r2, r0
ldr r0, =tm_hm_comp_table
lsl r1, r1, #0x4
add r0, #0x8
b get_offset

first_32:
mov r1, #0x1
lsl r1, r5
ldr r2, =tm_hm_comp_table
lsl r0, r3, #0x4
add r0, r0, r2
ldr r0, [r0]
and r0, r1

exit:
pop {r4-r5}
pop {r1}
bx r1