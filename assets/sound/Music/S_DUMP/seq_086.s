@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_086_grp, bank_002
	.equ	seq_086_pri, 2
	.equ	seq_086_rev, 178
	.equ	seq_086_mvl, 127
	.equ	seq_086_key, 0

	.section .rodata
	.global	seq_086
	.align	2

@*********************** Track 01 ***********************@

seq_086_0:
	.byte	KEYSH , seq_086_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 63
	.byte		BENDR , 6
	.byte		VOL   , 110*seq_086_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N72   , Dn3 , v127
	.byte	W06
	.byte		VOL   , 107*seq_086_mvl/mxv
	.byte		BEND  , c_v-3
	.byte	W06
	.byte		VOL   , 106*seq_086_mvl/mxv
	.byte		BEND  , c_v-5
	.byte	W06
	.byte		VOL   , 104*seq_086_mvl/mxv
	.byte		BEND  , c_v-7
	.byte	W06
	.byte		VOL   , 102*seq_086_mvl/mxv
	.byte		BEND  , c_v-10
	.byte	W06
	.byte		VOL   , 97*seq_086_mvl/mxv
	.byte		BEND  , c_v-12
	.byte	W06
	.byte		VOL   , 90*seq_086_mvl/mxv
	.byte		BEND  , c_v-14
	.byte	W06
	.byte		VOL   , 73*seq_086_mvl/mxv
	.byte		BEND  , c_v-19
	.byte	W06
	.byte		VOL   , 58*seq_086_mvl/mxv
	.byte		BEND  , c_v-24
	.byte	W06
	.byte		VOL   , 40*seq_086_mvl/mxv
	.byte		BEND  , c_v-29
	.byte	W06
	.byte		VOL   , 25*seq_086_mvl/mxv
	.byte		BEND  , c_v-35
	.byte	W06
	.byte		VOL   , 12*seq_086_mvl/mxv
	.byte		BEND  , c_v-46
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_086:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_086_pri	@ Priority
	.byte	seq_086_rev	@ Reverb

	.word	seq_086_grp

	.word	seq_086_0

	.end