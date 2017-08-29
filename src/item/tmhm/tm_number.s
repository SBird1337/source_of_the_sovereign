.text
.align 2
.thumb
.global new_tm_number_name

new_tm_number_name:
mov r0, #0xBB @=176/2 which is the new first tm index - 1
lsl r0, r0, #0x1
cmp r6, r0
bhi new_tm

mov r0, #0xA9
lsl r0, r0, #0x1
cmp r6, r0
bls old_tm

ldr r1, temp
ldr r0, return1
bx r0

new_tm:
ldr r1, =string_no
mov r0, r5
bl refresh

ldr r4, ram
ldr r0, value
ldr r0, return3
bx r0

old_tm:
ldr r1, return2
bx r1

refresh:
ldr r2, routine
bx r2

.align 2
routine: .word 0x08008DA5
temp: .word 0x08463178
return1: .word 0x08131D65
return2: .word 0x08131DA5
ram: .word 0x02021CD0
value: .word 0xFFFFFEBC
return3: .word 0x08131DAF

string_no:
	.byte 0xF9, 0x08, 0xFC, 0x11, 0x01, 0xFF