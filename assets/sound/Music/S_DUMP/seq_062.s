@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_062_grp, bank_002
	.equ	seq_062_pri, 4
	.equ	seq_062_rev, 178
	.equ	seq_062_mvl, 127
	.equ	seq_062_key, 0

	.section .rodata
	.global	seq_062
	.align	2

@*********************** Track 01 ***********************@

seq_062_0:
	.byte	KEYSH , seq_062_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 48
	.byte		VOL   , 110*seq_062_mvl/mxv
	.byte		BEND  , c_v-7
	.byte		N12   , Cn6 , v112
	.byte	W06
	.byte	W06
	.byte		N06   , Cn6 , v040
	.byte	W06
	.byte	FINE

@*********************** Track 02 ***********************@

seq_062_1:
	.byte	KEYSH , seq_062_key+0
	.byte		VOICE , 17
	.byte		VOL   , 110*seq_062_mvl/mxv
	.byte		BEND  , c_v-7
	.byte		N12   , Gn6 , v060
	.byte	W06
	.byte	W06
	.byte		N06   , Gn6 , v032
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_062:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_062_pri	@ Priority
	.byte	seq_062_rev	@ Reverb

	.word	seq_062_grp

	.word	seq_062_0
	.word	seq_062_1

	.end