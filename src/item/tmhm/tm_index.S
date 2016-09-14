.text
.align 2
.thumb

.global new_tm_index

new_tm_index:
mov r1, #0xBB @=176/2 which is the new first tm index - 1
lsl r1, r1, #0x1
cmp r0, r1
bhi newtm

mov r1, #0x90
lsl r1, r1, #0x1
add r1, r1, #0x1
sub r0, r0 ,r1
lsl r0, r0, #0x1
b exit

newtm:
add r1, r1, #0x1
sub r0, r0, r1
lsl r0, r0, #0x1
add r0, r0, #0x74

exit:
ldr r1, =tm_hm_move_table
add r0, r0, r1
ldrh r0, [r0]
bx lr