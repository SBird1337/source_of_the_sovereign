@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_065_grp, bank_000
	.equ	seq_065_pri, 5
	.equ	seq_065_rev, 178
	.equ	seq_065_mvl, 127
	.equ	seq_065_key, 0

	.section .rodata
	.global	seq_065
	.align	2

@*********************** Track 01 ***********************@

seq_065_0:
	.byte	KEYSH , seq_065_key+0
	.byte	TEMPO , 128/2
	.byte		VOICE , 89
	.byte		BENDR , 12
	.byte		VOL   , 90*seq_065_mvl/mxv
	.byte		BEND  , c_v-1
	.byte		N03   , Fs2 , v127
	.byte	W03
	.byte		N01   , Ds3 
	.byte	W03
	.byte		VOICE , 6
	.byte		N03   , Gs3 , v100
	.byte	W03
	.byte	W01
	.byte		N18   , Fn5 , v072
	.byte	W02
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_065_1:
	.byte	KEYSH , seq_065_key+0
	.byte		VOICE , 14
	.byte		VOL   , 90*seq_065_mvl/mxv
	.byte		BEND  , c_v-8
	.byte		N03   , Gs3 , v100
	.byte	W03
	.byte	W03
	.byte		        Gs3 , v060
	.byte	W03
	.byte	W01
	.byte		N18   , Fn5 
	.byte	W02
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_065:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_065_pri	@ Priority
	.byte	seq_065_rev	@ Reverb

	.word	seq_065_grp

	.word	seq_065_0
	.word	seq_065_1

	.end
