@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_181_grp, bank_002
	.equ	seq_181_pri, 4
	.equ	seq_181_rev, 178
	.equ	seq_181_mvl, 127
	.equ	seq_181_key, 0

	.section .rodata
	.global	seq_181
	.align	2

@*********************** Track 01 ***********************@

seq_181_0:
	.byte	KEYSH , seq_181_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 31
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_181_mvl/mxv
	.byte		BEND  , c_v-5
	.byte		N32   , Cn3 , v127
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v-9
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-13
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		BEND  , c_v-20
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-25
	.byte	W02
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v-39
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-6
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		BEND  , c_v-3
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+6
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v+3
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+9
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		BEND  , c_v+6
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+12
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		BEND  , c_v+8
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+16
	.byte	W02
	.byte		PAN   , c_v-4
	.byte		VOL   , 102*seq_181_mvl/mxv
	.byte		BEND  , c_v+12
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		VOL   , 97*seq_181_mvl/mxv
	.byte		BEND  , c_v+18
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+14
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		VOL   , 92*seq_181_mvl/mxv
	.byte		BEND  , c_v+18
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+20
	.byte	W01
	.byte		PAN   , c_v+4
	.byte		VOL   , 88*seq_181_mvl/mxv
	.byte		BEND  , c_v+17
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+12
	.byte	W01
	.byte		PAN   , c_v-4
	.byte		VOL   , 81*seq_181_mvl/mxv
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		VOL   , 64*seq_181_mvl/mxv
	.byte		BEND  , c_v+12
	.byte	W02
	.byte		PAN   , c_v+4
	.byte		VOL   , 49*seq_181_mvl/mxv
	.byte		BEND  , c_v+14
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		VOL   , 25*seq_181_mvl/mxv
	.byte		BEND  , c_v+11
	.byte	W05
	.byte	FINE

@******************************************************@

	.align	2

seq_181:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_181_pri	@ Priority
	.byte	seq_181_rev	@ Reverb

	.word	seq_181_grp

	.word	seq_181_0

	.end