@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_125_grp, bank_002
	.equ	seq_125_pri, 4
	.equ	seq_125_rev, 178
	.equ	seq_125_mvl, 127
	.equ	seq_125_key, 0

	.section .rodata
	.global	seq_125
	.align	2

@*********************** Track 01 ***********************@

seq_125_0:
	.byte	KEYSH , seq_125_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 22
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 64*seq_125_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Cn3 , v108
	.byte	W03
	.byte		VOL   , 79*seq_125_mvl/mxv
	.byte		BEND  , c_v+22
	.byte	W02
	.byte		        c_v+8
	.byte	W01
	.byte		VOL   , 84*seq_125_mvl/mxv
	.byte		PAN   , c_v-4
	.byte	W03
	.byte		VOL   , 91*seq_125_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W03
	.byte		VOL   , 100*seq_125_mvl/mxv
	.byte		PAN   , c_v-8
	.byte	W03
	.byte		VOL   , 110*seq_125_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v-12
	.byte	W06
	.byte		PAN   , c_v-17
	.byte		BEND  , c_v+0
	.byte		N48   , Cn3 , v108
	.byte	W03
	.byte		BEND  , c_v-7
	.byte	W03
	.byte		PAN   , c_v-9
	.byte		BEND  , c_v-12
	.byte	W03
	.byte		        c_v-20
	.byte	W03
	.byte		PAN   , c_v-3
	.byte	W03
	.byte		        c_v+6
	.byte		BEND  , c_v-13
	.byte	W03
	.byte		PAN   , c_v+10
	.byte	W03
	.byte		BEND  , c_v-6
	.byte	W03
	.byte		PAN   , c_v+16
	.byte	W03
	.byte		BEND  , c_v+6
	.byte	W03
	.byte		PAN   , c_v+13
	.byte		BEND  , c_v+11
	.byte	W03
	.byte		        c_v+20
	.byte	W03
	.byte		PAN   , c_v+8
	.byte	W03
	.byte		        c_v+0
	.byte		BEND  , c_v+12
	.byte	W03
	.byte		PAN   , c_v-8
	.byte		BEND  , c_v+7
	.byte	W03
	.byte		PAN   , c_v-11
	.byte	W03
	.byte	GOTO
	 .word	seq_125_0 + 0x2E
	.byte	FINE

@******************************************************@

	.align	2

seq_125:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_125_pri	@ Priority
	.byte	seq_125_rev	@ Reverb

	.word	seq_125_grp

	.word	seq_125_0

	.end