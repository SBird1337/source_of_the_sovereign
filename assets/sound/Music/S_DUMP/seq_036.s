@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_036_grp, bank_000
	.equ	seq_036_pri, 4
	.equ	seq_036_rev, 178
	.equ	seq_036_mvl, 127
	.equ	seq_036_key, 0

	.section .rodata
	.global	seq_036
	.align	2

@*********************** Track 01 ***********************@

seq_036_0:
	.byte	KEYSH , seq_036_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 9
	.byte		VOL   , 100*seq_036_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N01   , Gn5 , v088
	.byte	W01
	.byte		N01
	.byte	W02
	.byte		        Cn6 , v072
	.byte	W03
	.byte		        Cn6 , v056
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_036_1:
	.byte	KEYSH , seq_036_key+0
	.byte		VOICE , 122
	.byte		VOL   , 100*seq_036_mvl/mxv
	.byte		N01   , Gn2 , v112
	.byte	W02
	.byte		VOICE , 123
	.byte	W01
	.byte		N01   , Gs4 , v096
	.byte	W03
	.byte		        Gs4 , v112
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_036:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_036_pri	@ Priority
	.byte	seq_036_rev	@ Reverb

	.word	seq_036_grp

	.word	seq_036_0
	.word	seq_036_1

	.end