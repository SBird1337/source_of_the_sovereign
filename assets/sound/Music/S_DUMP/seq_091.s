@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_091_grp, bank_002
	.equ	seq_091_pri, 5
	.equ	seq_091_rev, 178
	.equ	seq_091_mvl, 127
	.equ	seq_091_key, 0

	.section .rodata
	.global	seq_091
	.align	2

@*********************** Track 01 ***********************@

seq_091_0:
	.byte	KEYSH , seq_091_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 25
	.byte		VOL   , 12*seq_091_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N12   , Gs4 , v060
	.byte	W01
	.byte		VOL   , 22*seq_091_mvl/mxv
	.byte	W01
	.byte		        33*seq_091_mvl/mxv
	.byte	W01
	.byte		        46*seq_091_mvl/mxv
	.byte	W01
	.byte		        58*seq_091_mvl/mxv
	.byte	W02
	.byte		        70*seq_091_mvl/mxv
	.byte	W02
	.byte		        60*seq_091_mvl/mxv
	.byte	W01
	.byte		        42*seq_091_mvl/mxv
	.byte	W01
	.byte		        22*seq_091_mvl/mxv
	.byte	W02
	.byte	FINE

@*********************** Track 02 ***********************@

seq_091_1:
	.byte	KEYSH , seq_091_key+0
	.byte		VOICE , 15
	.byte		VOL   , 12*seq_091_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N12   , Fn3 , v100
	.byte	W01
	.byte		VOL   , 22*seq_091_mvl/mxv
	.byte		BEND  , c_v-4
	.byte	W01
	.byte		VOL   , 33*seq_091_mvl/mxv
	.byte		BEND  , c_v-7
	.byte	W01
	.byte		VOL   , 46*seq_091_mvl/mxv
	.byte		BEND  , c_v-10
	.byte	W01
	.byte		VOL   , 58*seq_091_mvl/mxv
	.byte		BEND  , c_v-15
	.byte	W02
	.byte		VOL   , 70*seq_091_mvl/mxv
	.byte		BEND  , c_v-23
	.byte	W01
	.byte		        c_v-31
	.byte	W01
	.byte		VOL   , 60*seq_091_mvl/mxv
	.byte		BEND  , c_v-39
	.byte	W01
	.byte		VOL   , 42*seq_091_mvl/mxv
	.byte		BEND  , c_v-48
	.byte	W01
	.byte		VOL   , 22*seq_091_mvl/mxv
	.byte		BEND  , c_v-55
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_091:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_091_pri	@ Priority
	.byte	seq_091_rev	@ Reverb

	.word	seq_091_grp

	.word	seq_091_0
	.word	seq_091_1

	.end
