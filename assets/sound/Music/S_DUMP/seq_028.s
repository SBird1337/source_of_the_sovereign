@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_028_grp, bank_000
	.equ	seq_028_pri, 4
	.equ	seq_028_rev, 178
	.equ	seq_028_mvl, 127
	.equ	seq_028_key, 0

	.section .rodata
	.global	seq_028
	.align	2

@*********************** Track 01 ***********************@

seq_028_0:
	.byte	KEYSH , seq_028_key+0
	.byte	TEMPO , 180/2
	.byte		VOICE , 85
	.byte		VOL   , 90*seq_028_mvl/mxv
	.byte		BEND  , c_v-6
	.byte		N02   , Cn3 , v080
	.byte	W02
	.byte		VOICE , 86
	.byte		N03   , Cn4 , v127
	.byte	W01
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_028:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_028_pri	@ Priority
	.byte	seq_028_rev	@ Reverb

	.word	seq_028_grp

	.word	seq_028_0

	.end
