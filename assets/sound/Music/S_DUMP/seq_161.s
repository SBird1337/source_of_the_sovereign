@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_161_grp, bank_002
	.equ	seq_161_pri, 4
	.equ	seq_161_rev, 178
	.equ	seq_161_mvl, 127
	.equ	seq_161_key, 0

	.section .rodata
	.global	seq_161
	.align	2

@*********************** Track 01 ***********************@

seq_161_0:
	.byte	KEYSH , seq_161_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 7*seq_161_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N18   , Cn5 , v052
	.byte	W01
	.byte		VOL   , 20*seq_161_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v-8
	.byte	W01
	.byte		VOL   , 41*seq_161_mvl/mxv
	.byte		PAN   , c_v-14
	.byte		BEND  , c_v-16
	.byte	W01
	.byte		VOL   , 70*seq_161_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v-8
	.byte	W01
	.byte		VOL   , 93*seq_161_mvl/mxv
	.byte		PAN   , c_v-14
	.byte		BEND  , c_v+0
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_161_mvl/mxv
	.byte		BEND  , c_v+8
	.byte	W01
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		PAN   , c_v-14
	.byte	W01
	.byte		VOL   , 98*seq_161_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v+10
	.byte	W01
	.byte		VOL   , 85*seq_161_mvl/mxv
	.byte		PAN   , c_v-14
	.byte		BEND  , c_v+4
	.byte	W02
	.byte		VOL   , 69*seq_161_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-7
	.byte	W01
	.byte		VOL   , 51*seq_161_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		BEND  , c_v-22
	.byte	W01
	.byte		PAN   , c_v-14
	.byte		VOL   , 38*seq_161_mvl/mxv
	.byte		BEND  , c_v-28
	.byte	W01
	.byte		VOL   , 17*seq_161_mvl/mxv
	.byte		BEND  , c_v-32
	.byte	W01
	.byte		VOL   , 4*seq_161_mvl/mxv
	.byte		BEND  , c_v-38
	.byte	W08
	.byte	FINE

@******************************************************@

	.align	2

seq_161:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_161_pri	@ Priority
	.byte	seq_161_rev	@ Reverb

	.word	seq_161_grp

	.word	seq_161_0

	.end
