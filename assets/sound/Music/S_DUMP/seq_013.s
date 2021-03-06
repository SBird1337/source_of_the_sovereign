@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_013_grp, bank_000
	.equ	seq_013_pri, 5
	.equ	seq_013_rev, 178
	.equ	seq_013_mvl, 127
	.equ	seq_013_key, 0

	.section .rodata
	.global	seq_013
	.align	2

@*********************** Track 01 ***********************@

seq_013_0:
	.byte	KEYSH , seq_013_key+0
	.byte	TEMPO , 90/2
	.byte		VOICE , 125
	.byte		VOL   , 110*seq_013_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , As2 , v100
	.byte	W03
	.byte		BEND  , c_v-33
	.byte		N36   , Ds3 
	.byte	W03
	.byte		BEND  , c_v+0
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_013_1:
	.byte	KEYSH , seq_013_key+0
	.byte		VOICE , 0
	.byte		VOL   , 110*seq_013_mvl/mxv
	.byte		N03   , Cn3 , v127
	.byte	W03
	.byte		N18
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_013:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_013_pri	@ Priority
	.byte	seq_013_rev	@ Reverb

	.word	seq_013_grp

	.word	seq_013_0
	.word	seq_013_1

	.end
