@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_246_grp, bank_003
	.equ	seq_246_pri, 5
	.equ	seq_246_rev, 178
	.equ	seq_246_mvl, 127
	.equ	seq_246_key, 0

	.section .rodata
	.global	seq_246
	.align	2

@*********************** Track 01 ***********************@

seq_246_0:
	.byte	KEYSH , seq_246_key+0
	.byte	TEMPO , 422/2
	.byte		VOICE , 80
	.byte		VOL   , 64*seq_246_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N02   , Dn4 , v084
	.byte	W02
	.byte		BEND  , c_v+17
	.byte		N03   , Fs4 , v080
	.byte	W01
	.byte		BEND  , c_v-40
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_246_1:
	.byte	KEYSH , seq_246_key+0
	.byte		VOICE , 2
	.byte		XCMD  , xIECV , 8
	.byte		        xIECL , 8
	.byte		VOL   , 127*seq_246_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N04   , En3 , v127
	.byte	W03
	.byte	W01
	.byte		VOICE , 2
	.byte		N02   , Bn3 
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_246:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_246_pri	@ Priority
	.byte	seq_246_rev	@ Reverb

	.word	seq_246_grp

	.word	seq_246_0
	.word	seq_246_1

	.end
