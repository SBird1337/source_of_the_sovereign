	.equ	GAME_BPED, 0
	.equ	GAME_BPRE, 1

	.equ	USED_GAME, GAME_BPRE

	.thumb
	.align	2

disableCryTableBlocks:		@  BPED =$080A35BC	; BPRE =$080720C8

MOV		R1, R0
MOV		R0, #0xC
MUL		R0, R1, R0
MOVS		R3, R9
CMP		R3, #0
BEQ		forward_cry

reverse_cry:

LDR		R1, reverse_table
B		calc_table_entry

forward_cry:

LDR		R1, forward_table

calc_table_entry:

ADD		R0, R0, R1
BL		call_cry_handler
LDR		R1, cry_variable
STR		R0, [R1]

ADD		SP, SP, #4
POP		{R3-R5}
MOV		R8, R3
MOV		R9, R4
MOV		R10, R5
POP		{R4-R7}
POP		{R0}
BX		R0

call_cry_handler:

LDR		R1, cry_handler
BX		R1

	.align	2

cry_variable:
.if USED_GAME == GAME_BPED
	.word	0x020383E8
.endif
.if USED_GAME == GAME_BPRE
	.word	0x02037ECC
.endif


forward_table:
.if USED_GAME == GAME_BPED
	.word	0x09756C60
.endif
.if USED_GAME == GAME_BPRE
	.word	0x09800000
.endif


reverse_table:
.if USED_GAME == GAME_BPED
	.word	0x097591E0
.endif
.if USED_GAME == GAME_BPRE
	.word	0x09802584
.endif


cry_handler:
.if USED_GAME == GAME_BPED
	.word	0x082F73B4+1
.endif
.if USED_GAME == GAME_BPRE
	.word	0x081DE638+1
.endif

@	.org	0xD8
@	BPED =$080A3694  ; BPRE =$080721A0
