@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_047_grp, bank_002
	.equ	seq_047_pri, 4
	.equ	seq_047_rev, 178
	.equ	seq_047_mvl, 127
	.equ	seq_047_key, 0

	.section .rodata
	.global	seq_047
	.align	2

@*********************** Track 01 ***********************@

seq_047_0:
	.byte	KEYSH , seq_047_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 15
	.byte		VOL   , 90*seq_047_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		TIE   , Gn2 , v100
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		EOT
	.byte	GOTO
	 .word	seq_047_0 + 0x2
	.byte	FINE

@******************************************************@

	.align	2

seq_047:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_047_pri	@ Priority
	.byte	seq_047_rev	@ Reverb

	.word	seq_047_grp

	.word	seq_047_0

	.end