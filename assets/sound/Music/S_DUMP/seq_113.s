@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_113_grp, bank_002
	.equ	seq_113_pri, 4
	.equ	seq_113_rev, 178
	.equ	seq_113_mvl, 127
	.equ	seq_113_key, 0

	.section .rodata
	.global	seq_113
	.align	2

@*********************** Track 01 ***********************@

seq_113_0:
	.byte	KEYSH , seq_113_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 28
	.byte		VOL   , 100*seq_113_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+16
	.byte		N03   , Gs3 , v080
	.byte	W01
	.byte		BEND  , c_v+38
	.byte	W01
	.byte		        c_v+62
	.byte	W02
	.byte		N17   , Gs4 , v096
	.byte	W03
	.byte		PAN   , c_v+6
	.byte	W02
	.byte		        c_v+0
	.byte	W03
	.byte		        c_v-8
	.byte	W02
	.byte		        c_v+0
	.byte	W02
	.byte		        c_v+6
	.byte	W03
	.byte		        c_v+0
	.byte	W05
	.byte	FINE

@*********************** Track 02 ***********************@

seq_113_1:
	.byte	KEYSH , seq_113_key+0
	.byte		VOICE , 4
	.byte		VOL   , 100*seq_113_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N01   , En4 , v060
	.byte	W04
	.byte		N17   , Gs4 , v096
	.byte	W20
	.byte	FINE

@******************************************************@

	.align	2

seq_113:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_113_pri	@ Priority
	.byte	seq_113_rev	@ Reverb

	.word	seq_113_grp

	.word	seq_113_0
	.word	seq_113_1

	.end