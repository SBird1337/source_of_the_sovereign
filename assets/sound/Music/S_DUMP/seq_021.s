@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_021_grp, bank_000
	.equ	seq_021_pri, 4
	.equ	seq_021_rev, 178
	.equ	seq_021_mvl, 127
	.equ	seq_021_key, 0

	.section .rodata
	.global	seq_021
	.align	2

@*********************** Track 01 ***********************@

seq_021_0:
	.byte	KEYSH , seq_021_key+0
	.byte	TEMPO , 100/2
	.byte		VOICE , 5
	.byte		BENDR , 12
	.byte		VOL   , 60*seq_021_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , Gn5 , v127
	.byte	W03
	.byte		        Gn6 , v112
	.byte	W03
	.byte		        Gn6 , v024
	.byte	W03
	.byte		        Gn6 , v068
	.byte	W03
	.byte		        Gn6 , v024
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_021:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_021_pri	@ Priority
	.byte	seq_021_rev	@ Reverb

	.word	seq_021_grp

	.word	seq_021_0

	.end