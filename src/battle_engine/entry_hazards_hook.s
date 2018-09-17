.text
.align 2
.thumb

.global entry_hazards_hook
entry_hazards_hook:

	bl execute_entry_hazards
	cmp r0, #0
	beq return
	ldr r0, =0x80250C6|1
	bx r0
return:
	
	ldr r0, =0x8024F88|1
	bx r0

