.text
.align 2
.thumb
.global set_textbox
set_textbox:
	push {lr}
	
	ldr r0, pointer_bank
	ldr r0, [r0]
	bl setup_textwindow
	
	pop {r0}
	bx r0
	
setup_textwindow:
	ldr r1, rbox_8003B24
	bx r1	

.align 2
rbox_8003B24:
	.word 0x08003B24 | 1
	
pointer_bank:
	.word 0x03000F14

	
