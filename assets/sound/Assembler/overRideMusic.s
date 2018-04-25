	.thumb
	.align	2

overRideMusic:
	PUSH	{LR}
	BL	main

	MOV	R7, R8
	POP	R3
	PUSH	R7
	MOVS	R5, R0
	MOVS	R7, R1
	LDR	R1
	BX	R3
main: