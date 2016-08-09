.text
.align 2
.thumb
.global tm_save_slot

tm_save_slot:
ldr r0, tm_save
str r0, [r1, #0x18]
mov r0, #0x6C		@108
strb r0, [r1, #0x1c]
ldr r0, return
bx r0

.align
tm_save: .word 0x0203cB10
return: .word 0x08099e74+1