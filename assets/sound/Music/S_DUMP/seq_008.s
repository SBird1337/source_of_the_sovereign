@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_008_grp, bank_000
	.equ	seq_008_pri, 5
	.equ	seq_008_rev, 178
	.equ	seq_008_mvl, 127
	.equ	seq_008_key, 0

	.section .rodata
	.global	seq_008
	.align	2

@*********************** Track 01 ***********************@

seq_008_0:
	.byte	KEYSH , seq_008_key+0
	.byte	TEMPO , 110/2
	.byte		VOICE , 127
	.byte		VOL   , 80*seq_008_mvl/mxv
	.byte		N03   , Dn3 , v127
	.byte	W06
	.byte		N12   , Fs3 
	.byte	W18
	.byte	FINE

@******************************************************@

	.align	2

seq_008:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_008_pri	@ Priority
	.byte	seq_008_rev	@ Reverb

	.word	seq_008_grp

	.word	seq_008_0

	.end
