@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_169_grp, bank_002
	.equ	seq_169_pri, 4
	.equ	seq_169_rev, 178
	.equ	seq_169_mvl, 127
	.equ	seq_169_key, 0

	.section .rodata
	.global	seq_169
	.align	2

@*********************** Track 01 ***********************@

seq_169_0:
	.byte	KEYSH , seq_169_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 19
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 5*seq_169_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N07   , Bn5 , v080
	.byte	W01
	.byte		VOL   , 55*seq_169_mvl/mxv
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v+3
	.byte	W01
	.byte		VOL   , 67*seq_169_mvl/mxv
	.byte		PAN   , c_v+22
	.byte		BEND  , c_v+0
	.byte	W01
	.byte		VOL   , 90*seq_169_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-6
	.byte	W01
	.byte		PAN   , c_v-12
	.byte		BEND  , c_v-14
	.byte	W02
	.byte		VOL   , 4*seq_169_mvl/mxv
	.byte		PAN   , c_v-22
	.byte		BEND  , c_v-23
	.byte	W01
	.byte		PAN   , c_v-13
	.byte		BEND  , c_v+0
	.byte		N04   , Cn6 
	.byte	W01
	.byte		VOL   , 66*seq_169_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+1
	.byte	W01
	.byte		VOL   , 90*seq_169_mvl/mxv
	.byte		PAN   , c_v+11
	.byte		BEND  , c_v+3
	.byte	W01
	.byte		VOL   , 4*seq_169_mvl/mxv
	.byte		PAN   , c_v+21
	.byte		BEND  , c_v+5
	.byte	W14
	.byte		VOL   , 90*seq_169_mvl/mxv
	.byte	FINE

@******************************************************@

	.align	2

seq_169:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_169_pri	@ Priority
	.byte	seq_169_rev	@ Reverb

	.word	seq_169_grp

	.word	seq_169_0

	.end
