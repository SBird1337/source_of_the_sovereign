@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_144_grp, bank_002
	.equ	seq_144_pri, 4
	.equ	seq_144_rev, 178
	.equ	seq_144_mvl, 127
	.equ	seq_144_key, 0

	.section .rodata
	.global	seq_144
	.align	2

@*********************** Track 01 ***********************@

seq_144_0:
	.byte	KEYSH , seq_144_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 29
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 61*seq_144_mvl/mxv
	.byte		BEND  , c_v+8
	.byte		N10   , Gn3 , v127
	.byte	W01
	.byte		VOL   , 84*seq_144_mvl/mxv
	.byte	W01
	.byte		        97*seq_144_mvl/mxv
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		VOL   , 110*seq_144_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v+7
	.byte	W02
	.byte		        c_v-12
	.byte	W01
	.byte		VOL   , 89*seq_144_mvl/mxv
	.byte	W01
	.byte		        64*seq_144_mvl/mxv
	.byte		BEND  , c_v-42
	.byte	W01
	.byte		VOL   , 34*seq_144_mvl/mxv
	.byte	W15
	.byte	FINE

@******************************************************@

	.align	2

seq_144:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_144_pri	@ Priority
	.byte	seq_144_rev	@ Reverb

	.word	seq_144_grp

	.word	seq_144_0

	.end