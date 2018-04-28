@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_132_grp, bank_002
	.equ	seq_132_pri, 4
	.equ	seq_132_rev, 178
	.equ	seq_132_mvl, 127
	.equ	seq_132_key, 0

	.section .rodata
	.global	seq_132
	.align	2

@*********************** Track 01 ***********************@

seq_132_0:
	.byte	KEYSH , seq_132_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 6
	.byte		VOL   , 120*seq_132_mvl/mxv
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N03   , Cn3 , v127
	.byte	W01
	.byte		PAN   , c_v-10
	.byte		BEND  , c_v-27
	.byte	W01
	.byte		PAN   , c_v+8
	.byte		BEND  , c_v-47
	.byte	W01
	.byte		        c_v-64
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+1
	.byte		N02   , Dn3 , v084
	.byte	W02
	.byte		BEND  , c_v-32
	.byte	W18
	.byte	FINE

@*********************** Track 02 ***********************@

seq_132_1:
	.byte	KEYSH , seq_132_key+0
	.byte		VOICE , 5
	.byte		XCMD  , xIECV , 10
	.byte		        xIECL , 8
	.byte		VOL   , 120*seq_132_mvl/mxv
	.byte		PAN   , c_v+9
	.byte		N03   , An2 , v052
	.byte	W04
	.byte		N02
	.byte	W02
	.byte		PAN   , c_v-8
	.byte	W18
	.byte	FINE

@******************************************************@

	.align	2

seq_132:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_132_pri	@ Priority
	.byte	seq_132_rev	@ Reverb

	.word	seq_132_grp

	.word	seq_132_0
	.word	seq_132_1

	.end