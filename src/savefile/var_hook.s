.text
.align 2
.thumb
.thumb_func
.global var_hook

var_hook:
	mov r2, #0x40
	lsl r2, r2, #0x8
	cmp r4, r2
	blt exit
        mov r2, #0x41
	lsl r2, r2, #0x8
	cmp r4, r2
	blt normal
	mov r2, #0x50
	lsl r2, r2, #0x8
	cmp r4, r2
	blt exit
        lsl r2, r4, #0x10
        cmp r2, #0x0
        blt alt
	mov r2, #0x52
	lsl r2, r2, #0x8
	cmp r4, r2
	bge exit
	ldr r0, memoryblock
	mov r2, #0x50
	lsl r2, r2, #0x8
	sub r4, r4, r2
	lsl r4, r4, #0x1
	add r0, r0, r4
exit2:	pop {r4-r6}
	pop {r1}
	bx r1
exit:	mov r0, #0x0
	b exit2
normal:	ldr r0, return
	bx r0
alt:	ldr r0, return2
	bx r0
.align
memoryblock:	.word 0x0203C300
return:	.word 0x0806E473
return2:	.word 0x0806E50D
