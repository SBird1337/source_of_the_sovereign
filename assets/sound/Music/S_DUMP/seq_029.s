@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_029_grp, bank_000
	.equ	seq_029_pri, 4
	.equ	seq_029_rev, 178
	.equ	seq_029_mvl, 127
	.equ	seq_029_key, 0

	.section .rodata
	.global	seq_029
	.align	2

@*********************** Track 01 ***********************@

seq_029_0:
	.byte	KEYSH , seq_029_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 122
	.byte		VOL   , 100*seq_029_mvl/mxv
	.byte		N01   , Ds3 , v127
	.byte	W02
	.byte		VOICE , 126
	.byte		N01   , Gs4 
	.byte	W01
	.byte	W03
	.byte	W01
	.byte		        Gs4 , v088
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_029:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_029_pri	@ Priority
	.byte	seq_029_rev	@ Reverb

	.word	seq_029_grp

	.word	seq_029_0

	.end