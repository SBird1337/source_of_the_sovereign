@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_039_grp, bank_000
	.equ	seq_039_pri, 4
	.equ	seq_039_rev, 178
	.equ	seq_039_mvl, 127
	.equ	seq_039_key, 0

	.section .rodata
	.global	seq_039
	.align	2

@*********************** Track 01 ***********************@

seq_039_0:
	.byte	KEYSH , seq_039_key+0
	.byte	TEMPO , 110/2
	.byte		VOICE , 90
	.byte		VOL   , 90*seq_039_mvl/mxv
	.byte		N06   , En4 , v127
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v112
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v088
	.byte	W03
	.byte	W03
	.byte		N03   , En4 , v016
	.byte	W03
	.byte		N06   , En4 , v064
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_039:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_039_pri	@ Priority
	.byte	seq_039_rev	@ Reverb

	.word	seq_039_grp

	.word	seq_039_0

	.end
