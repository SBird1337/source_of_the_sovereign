@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_242_grp, bank_003
	.equ	seq_242_pri, 5
	.equ	seq_242_rev, 178
	.equ	seq_242_mvl, 127
	.equ	seq_242_key, 0

	.section .rodata
	.global	seq_242
	.align	2

@*********************** Track 01 ***********************@

seq_242_0:
	.byte	KEYSH , seq_242_key+0
	.byte	TEMPO , 182/2
	.byte		VOICE , 125
	.byte		XCMD  , xIECV , 8
	.byte		        xIECL , 8
	.byte		PAN   , c_v+0
	.byte		VOL   , 127*seq_242_mvl/mxv
	.byte		BEND  , c_v+2
	.byte		N01   , Cn4 , v127
	.byte	W03
	.byte		VOICE , 124
	.byte		N01   , Cn5 , v064
	.byte	W21
	.byte	W24
	.byte	FINE

@******************************************************@

	.align	2

seq_242:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_242_pri	@ Priority
	.byte	seq_242_rev	@ Reverb

	.word	seq_242_grp

	.word	seq_242_0

	.end
