@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_124_grp, bank_002
	.equ	seq_124_pri, 4
	.equ	seq_124_rev, 178
	.equ	seq_124_mvl, 127
	.equ	seq_124_key, 0

	.section .rodata
	.global	seq_124
	.align	2

@*********************** Track 01 ***********************@

seq_124_0:
	.byte	KEYSH , seq_124_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 26
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 105*seq_124_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N06   , En3 , v127
	.byte	W03
	.byte		PAN   , c_v-8
	.byte		BEND  , c_v-34
	.byte	W03
	.byte		PAN   , c_v+7
	.byte		N03   , Gn3 , v100
	.byte	W03
	.byte		PAN   , c_v-15
	.byte		BEND  , c_v+4
	.byte		N06   , En3 , v127
	.byte	W03
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v-13
	.byte	W03
	.byte		PAN   , c_v-1
	.byte		BEND  , c_v+0
	.byte		N06   , Cn3 , v084
	.byte	W06
	.byte		BEND  , c_v-20
	.byte		N06   , En3 , v068
	.byte	W03
	.byte		BEND  , c_v-41
	.byte	W24
	.byte	FINE

@******************************************************@

	.align	2

seq_124:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_124_pri	@ Priority
	.byte	seq_124_rev	@ Reverb

	.word	seq_124_grp

	.word	seq_124_0

	.end
