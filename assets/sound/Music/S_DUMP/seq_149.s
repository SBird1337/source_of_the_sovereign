@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_149_grp, bank_002
	.equ	seq_149_pri, 4
	.equ	seq_149_rev, 178
	.equ	seq_149_mvl, 127
	.equ	seq_149_key, 0

	.section .rodata
	.global	seq_149
	.align	2

@*********************** Track 01 ***********************@

seq_149_0:
	.byte	KEYSH , seq_149_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 18
	.byte		BENDR , 12
	.byte		PAN   , c_v+4
	.byte		VOL   , 42*seq_149_mvl/mxv
	.byte		BEND  , c_v+39
	.byte		N06   , Cn5 , v084
	.byte	W01
	.byte		VOL   , 55*seq_149_mvl/mxv
	.byte		BEND  , c_v+18
	.byte	W01
	.byte		VOL   , 71*seq_149_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		VOL   , 86*seq_149_mvl/mxv
	.byte		BEND  , c_v-18
	.byte	W01
	.byte		VOL   , 110*seq_149_mvl/mxv
	.byte		BEND  , c_v-50
	.byte	W02
	.byte		PAN   , c_v+0
	.byte	W04
	.byte		VOICE , 8
	.byte		PAN   , c_v-11
	.byte		BEND  , c_v+0
	.byte		N06   , Gn4 , v120
	.byte	W02
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v-13
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-26
	.byte	W01
	.byte		PAN   , c_v-12
	.byte		BEND  , c_v-46
	.byte	W01
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v-54
	.byte	W09
	.byte	FINE

@*********************** Track 02 ***********************@

seq_149_1:
	.byte	KEYSH , seq_149_key+0
	.byte		VOICE , 27
	.byte		VOL   , 110*seq_149_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N06   , Cn2 , v040
	.byte	W10
	.byte		N02   , Gn2 
	.byte	W14
	.byte	FINE

@******************************************************@

	.align	2

seq_149:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_149_pri	@ Priority
	.byte	seq_149_rev	@ Reverb

	.word	seq_149_grp

	.word	seq_149_0
	.word	seq_149_1

	.end
