@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_122_grp, bank_002
	.equ	seq_122_pri, 4
	.equ	seq_122_rev, 178
	.equ	seq_122_mvl, 127
	.equ	seq_122_key, 0

	.section .rodata
	.global	seq_122
	.align	2

@*********************** Track 01 ***********************@

seq_122_0:
	.byte	KEYSH , seq_122_key+0
	.byte	TEMPO , 250/2
	.byte		VOICE , 22
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_122_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N48   , Fn4 , v108
	.byte	W03
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+6
	.byte	W03
	.byte		PAN   , c_v+15
	.byte		BEND  , c_v+12
	.byte	W03
	.byte		PAN   , c_v+6
	.byte		BEND  , c_v+21
	.byte	W02
	.byte		        c_v+8
	.byte	W01
	.byte		PAN   , c_v-1
	.byte	W03
	.byte		        c_v-9
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		PAN   , c_v-15
	.byte		BEND  , c_v-14
	.byte	W03
	.byte		PAN   , c_v-9
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte	W06
	.byte		VOL   , 90*seq_122_mvl/mxv
	.byte	W03
	.byte		        71*seq_122_mvl/mxv
	.byte	W03
	.byte		        58*seq_122_mvl/mxv
	.byte	W03
	.byte		        41*seq_122_mvl/mxv
	.byte	W03
	.byte		        27*seq_122_mvl/mxv
	.byte	W03
	.byte		        7*seq_122_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_122:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_122_pri	@ Priority
	.byte	seq_122_rev	@ Reverb

	.word	seq_122_grp

	.word	seq_122_0

	.end
