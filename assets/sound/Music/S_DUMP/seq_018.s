@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_018_grp, bank_002
	.equ	seq_018_pri, 4
	.equ	seq_018_rev, 178
	.equ	seq_018_mvl, 127
	.equ	seq_018_key, 0

	.section .rodata
	.global	seq_018
	.align	2

@*********************** Track 01 ***********************@

seq_018_0:
	.byte	KEYSH , seq_018_key+0
	.byte	TEMPO , 120/2
	.byte		VOICE , 1
	.byte		VOL   , 95*seq_018_mvl/mxv
	.byte		N12   , Cn2 , v127
	.byte	W12
	.byte		VOL   , 0*seq_018_mvl/mxv
	.byte	FINE

@******************************************************@

	.align	2

seq_018:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_018_pri	@ Priority
	.byte	seq_018_rev	@ Reverb

	.word	seq_018_grp

	.word	seq_018_0

	.end
