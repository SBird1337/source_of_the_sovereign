@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_089_grp, bank_002
	.equ	seq_089_pri, 5
	.equ	seq_089_rev, 178
	.equ	seq_089_mvl, 127
	.equ	seq_089_key, 0

	.section .rodata
	.global	seq_089
	.align	2

@*********************** Track 01 ***********************@

seq_089_0:
	.byte	KEYSH , seq_089_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 14
	.byte		VOL   , 90*seq_089_mvl/mxv
	.byte		BEND  , c_v-7
	.byte		N02   , Cn5 , v112
	.byte	W02
	.byte		N09   , Gn4 
	.byte	W04
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_089:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_089_pri	@ Priority
	.byte	seq_089_rev	@ Reverb

	.word	seq_089_grp

	.word	seq_089_0

	.end
