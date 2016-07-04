.gba
cry_variable equ 0x02037ECC
cry_handler equ 0x081DE638 + 1

disableCryTableBlocks:		//  BPED =$080A35BC	; BPRE =$080720C8

MOV		R1, R0
MOV		R0, #0xC
MUL		R0, R1
MOV		R3, R9
CMP		R3, #0
BEQ		forward_cry

reverse_cry:

LDR		R1,=_reverse_crytable
B		calc_table_entry

forward_cry:

LDR		R1,=_forward_crytable

calc_table_entry:

ADD		R0, R0, R1
BL		call_cry_handler
LDR		R1,=cry_variable
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

LDR		R1,=cry_handler
BX		R1
.pool
