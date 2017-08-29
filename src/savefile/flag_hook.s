.text
.align 2
.thumb
.global flag_hook
flag_hook:
	mov r0, #0x9
	lsl r0, r0, #0x8
	cmp r4, r0
	blt normal
	mov r0, #0x19
	lsl r0, r0, #0x8
	cmp r4, r0
	bge noget
	mov r0, #0x9
	lsl r0, r0, #0x8
	sub r4, r4, r0
	add r6, r4, #0x0
	str r4, [sp, #0x0]
	ldr r0, memoryblock
	lsr r1, r6, #0x3
	add r0, r0, r1
exit:	pop {r4-r6}
	pop {r1}
	bx r1
normal:	
	ldr r0, normalmemoryblock
	ldr r0, [r0, #0x0]
	
there:	lsr r1, r6, #0x3
	mov r3, #0xEE
	lsl r3, r3, #0x4
	add r1, r1, r3
	add r0, r0, r1
	b exit
noget:	add r0, r4, #0x0
	b there

.align 2
memoryblock:	.word 0x0203C900
normalmemoryblock:	.word 0x03005008
