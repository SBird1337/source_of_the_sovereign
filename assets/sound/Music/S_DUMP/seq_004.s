@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_004_grp, bank_000
	.equ	seq_004_pri, 5
	.equ	seq_004_rev, 178
	.equ	seq_004_mvl, 127
	.equ	seq_004_key, 0

	.section .rodata
	.global	seq_004
	.align	2

@*********************** Track 01 ***********************@

seq_004_0:
	.byte	KEYSH , seq_004_key+0
	.byte	TEMPO , 144/2
	.byte		VOICE , 4
	.byte		XCMD  , xIECV , 10
	.byte		        xIECL , 8
	.byte		VOL   , 100*seq_004_mvl/mxv
	.byte		BEND  , c_v-11
	.byte		N12   , Cn6 , v112
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte		N04   , Cn5 , v080
	.byte	W03
	.byte	W01
	.byte		        Cn4 
	.byte	W02
	.byte	W02
	.byte		        Gn4 
	.byte	W01
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte	W01
	.byte		        Cn5 
	.byte	W02
	.byte	W02
	.byte		        Cn4 
	.byte	W01
	.byte	W03
	.byte		        Cn6 , v100
	.byte	W03
	.byte	W01
	.byte		        Cn4 , v080
	.byte	W02
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_004:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_004_pri	@ Priority
	.byte	seq_004_rev	@ Reverb

	.word	seq_004_grp

	.word	seq_004_0

	.end
