@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_079_grp, bank_002
	.equ	seq_079_pri, 2
	.equ	seq_079_rev, 178
	.equ	seq_079_mvl, 127
	.equ	seq_079_key, 0

	.section .rodata
	.global	seq_079
	.align	2

@*********************** Track 01 ***********************@

seq_079_0:
	.byte	KEYSH , seq_079_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 80*seq_079_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Bn3 , v052
	.byte	W03
	.byte		VOL   , 76*seq_079_mvl/mxv
	.byte	W03
	.byte		        74*seq_079_mvl/mxv
	.byte	W03
	.byte		        72*seq_079_mvl/mxv
	.byte	W03
	.byte		        68*seq_079_mvl/mxv
	.byte	W03
	.byte		        64*seq_079_mvl/mxv
	.byte	W03
	.byte		        58*seq_079_mvl/mxv
	.byte	W03
	.byte		        50*seq_079_mvl/mxv
	.byte	W03
	.byte		        44*seq_079_mvl/mxv
	.byte		N24
	.byte	W03
	.byte		VOL   , 38*seq_079_mvl/mxv
	.byte	W03
	.byte		        34*seq_079_mvl/mxv
	.byte	W03
	.byte		        27*seq_079_mvl/mxv
	.byte	W03
	.byte		        20*seq_079_mvl/mxv
	.byte	W03
	.byte		        15*seq_079_mvl/mxv
	.byte	W03
	.byte		        10*seq_079_mvl/mxv
	.byte	W03
	.byte		        6*seq_079_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_079:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_079_pri	@ Priority
	.byte	seq_079_rev	@ Reverb

	.word	seq_079_grp

	.word	seq_079_0

	.end
