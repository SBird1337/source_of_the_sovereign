@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_077_grp, bank_002
	.equ	seq_077_pri, 2
	.equ	seq_077_rev, 178
	.equ	seq_077_mvl, 127
	.equ	seq_077_key, 0

	.section .rodata
	.global	seq_077
	.align	2

@*********************** Track 01 ***********************@

seq_077_0:
	.byte	KEYSH , seq_077_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*seq_077_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N24   , Cn3 , v060
	.byte	W03
	.byte		VOL   , 96*seq_077_mvl/mxv
	.byte	W03
	.byte		        93*seq_077_mvl/mxv
	.byte	W03
	.byte		        90*seq_077_mvl/mxv
	.byte	W03
	.byte		        85*seq_077_mvl/mxv
	.byte	W03
	.byte		        81*seq_077_mvl/mxv
	.byte	W03
	.byte		        73*seq_077_mvl/mxv
	.byte	W03
	.byte		        62*seq_077_mvl/mxv
	.byte	W03
	.byte		        55*seq_077_mvl/mxv
	.byte		N24
	.byte	W03
	.byte		VOL   , 48*seq_077_mvl/mxv
	.byte	W03
	.byte		        42*seq_077_mvl/mxv
	.byte	W03
	.byte		        33*seq_077_mvl/mxv
	.byte	W03
	.byte		        25*seq_077_mvl/mxv
	.byte	W03
	.byte		        18*seq_077_mvl/mxv
	.byte	W03
	.byte		        12*seq_077_mvl/mxv
	.byte	W03
	.byte		        7*seq_077_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_077:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_077_pri	@ Priority
	.byte	seq_077_rev	@ Reverb

	.word	seq_077_grp

	.word	seq_077_0

	.end
