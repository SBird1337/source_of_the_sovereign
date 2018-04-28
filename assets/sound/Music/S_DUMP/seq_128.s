@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_128_grp, bank_002
	.equ	seq_128_pri, 4
	.equ	seq_128_rev, 178
	.equ	seq_128_mvl, 127
	.equ	seq_128_key, 0

	.section .rodata
	.global	seq_128
	.align	2

@*********************** Track 01 ***********************@

seq_128_0:
	.byte	KEYSH , seq_128_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 22
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_128_mvl/mxv
	.byte		BEND  , c_v-18
	.byte		N19   , Dn3 , v108
	.byte	W02
	.byte		BEND  , c_v-7
	.byte	W01
	.byte		VOL   , 101*seq_128_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v-9
	.byte		BEND  , c_v+8
	.byte	W02
	.byte		VOL   , 84*seq_128_mvl/mxv
	.byte		BEND  , c_v+4
	.byte	W02
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		VOL   , 64*seq_128_mvl/mxv
	.byte		BEND  , c_v-13
	.byte	W01
	.byte		PAN   , c_v+8
	.byte	W02
	.byte		VOL   , 45*seq_128_mvl/mxv
	.byte		BEND  , c_v-31
	.byte	W02
	.byte		VOL   , 32*seq_128_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		VOICE , 2
	.byte	W01
	.byte		VOL   , 13*seq_128_mvl/mxv
	.byte		BEND  , c_v-52
	.byte	W08
	.byte	FINE

@******************************************************@

	.align	2

seq_128:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_128_pri	@ Priority
	.byte	seq_128_rev	@ Reverb

	.word	seq_128_grp

	.word	seq_128_0

	.end