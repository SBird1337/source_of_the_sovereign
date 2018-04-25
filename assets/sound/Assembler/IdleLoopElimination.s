	.thumb
	.align	2

main:	@ EMERALD: $080008C0
	@ FIRERED: $080008B4

CMP	R0, #0
BNE	skip_wait

MOVS	R3, #1

idle_loop:

SWI	#0x2
LDRH	R1, [R2, #0x1C]
MOVS	R0, R3
AND	R0, R1
CMP	R0, #0
BEQ	idle_loop

skip_wait:

POP	{PC}
