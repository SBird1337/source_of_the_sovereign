@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_248_grp, bank_003
	.equ	seq_248_pri, 5
	.equ	seq_248_rev, 178
	.equ	seq_248_mvl, 127
	.equ	seq_248_key, 0

	.section .rodata
	.global	seq_248
	.align	2

@*********************** Track 01 ***********************@

seq_248_0:
	.byte	KEYSH , seq_248_key+0
	.byte	TEMPO , 124/2
	.byte		VOICE , 8
	.byte		VOL   , 80*seq_248_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N30   , Cn3 , v120
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_248:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_248_pri	@ Priority
	.byte	seq_248_rev	@ Reverb

	.word	seq_248_grp

	.word	seq_248_0

	.end
