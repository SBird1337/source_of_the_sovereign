@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_084_grp, bank_002
	.equ	seq_084_pri, 5
	.equ	seq_084_rev, 178
	.equ	seq_084_mvl, 127
	.equ	seq_084_key, 0

	.section .rodata
	.global	seq_084
	.align	2

@*********************** Track 01 ***********************@

seq_084_0:
	.byte	KEYSH , seq_084_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 46
	.byte		VOL   , 94*seq_084_mvl/mxv
	.byte		BENDR , 2
	.byte		LFOS  , 40
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+15
	.byte		N06   , An5 , v112
	.byte	W01
	.byte		N15   , En6 , v104
	.byte	W02
	.byte	W01
	.byte		MOD   , 5
	.byte	W02
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W01
	.byte		        0
	.byte	W02
	.byte	FINE

@*********************** Track 02 ***********************@

seq_084_1:
	.byte	KEYSH , seq_084_key+0
	.byte		VOICE , 53
	.byte		BENDR , 2
	.byte		VOL   , 43*seq_084_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+15
	.byte		N06   , An4 , v108
	.byte	W01
	.byte		N12   , Cs6 , v104
	.byte	W02
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_084:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_084_pri	@ Priority
	.byte	seq_084_rev	@ Reverb

	.word	seq_084_grp

	.word	seq_084_0
	.word	seq_084_1

	.end