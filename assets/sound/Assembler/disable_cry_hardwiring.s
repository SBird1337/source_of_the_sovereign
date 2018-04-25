	.thumb
	.align	2

disableCryHardwiring:		@ BPED =$0806D514  ; BPRE =$08043304

LSL		R0, R0, #0x10
LSR		R0, R0, #0x10
BX		LR

@		BPED =$0806D548  ; BPRE =$08043338
@	.org	0x34
