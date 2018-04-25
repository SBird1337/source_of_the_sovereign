	.thumb
	.align	2

injector:
PUSH	{R4-R7, LR}
LDR	R3, musicOverrideRoutine
BL	call_r3
B	continueRoutine

call_r3:
BX	R3

	.align	2

musicOverrideRoutine:
	.word	0x0

continueRoutine:
