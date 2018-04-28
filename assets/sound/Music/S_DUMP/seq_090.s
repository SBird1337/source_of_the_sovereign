@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_090_grp, bank_002
	.equ	seq_090_pri, 5
	.equ	seq_090_rev, 178
	.equ	seq_090_mvl, 127
	.equ	seq_090_key, 0

	.section .rodata
	.global	seq_090
	.align	2

@*********************** Track 01 ***********************@

seq_090_0:
	.byte	KEYSH , seq_090_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 25
	.byte		VOL   , 12*seq_090_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N12   , Gs4 , v060
	.byte	W01
	.byte		VOL   , 22*seq_090_mvl/mxv
	.byte	W01
	.byte		        33*seq_090_mvl/mxv
	.byte	W01
	.byte		        46*seq_090_mvl/mxv
	.byte	W01
	.byte		        58*seq_090_mvl/mxv
	.byte	W02
	.byte		        70*seq_090_mvl/mxv
	.byte	W02
	.byte		        60*seq_090_mvl/mxv
	.byte	W01
	.byte		        42*seq_090_mvl/mxv
	.byte	W01
	.byte		        22*seq_090_mvl/mxv
	.byte	W02
	.byte	FINE

@*********************** Track 02 ***********************@

seq_090_1:
	.byte	KEYSH , seq_090_key+0
	.byte		VOICE , 15
	.byte		VOL   , 12*seq_090_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N12   , Fn3 , v100
	.byte	W01
	.byte		VOL   , 22*seq_090_mvl/mxv
	.byte		BEND  , c_v+3
	.byte	W01
	.byte		VOL   , 33*seq_090_mvl/mxv
	.byte		BEND  , c_v+6
	.byte	W01
	.byte		VOL   , 46*seq_090_mvl/mxv
	.byte		BEND  , c_v+9
	.byte	W01
	.byte		VOL   , 58*seq_090_mvl/mxv
	.byte		BEND  , c_v+12
	.byte	W02
	.byte		VOL   , 70*seq_090_mvl/mxv
	.byte		BEND  , c_v+17
	.byte	W01
	.byte		        c_v+20
	.byte	W01
	.byte		VOL   , 60*seq_090_mvl/mxv
	.byte		BEND  , c_v+25
	.byte	W01
	.byte		VOL   , 42*seq_090_mvl/mxv
	.byte		BEND  , c_v+32
	.byte	W01
	.byte		VOL   , 22*seq_090_mvl/mxv
	.byte		BEND  , c_v+38
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_090:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_090_pri	@ Priority
	.byte	seq_090_rev	@ Reverb

	.word	seq_090_grp

	.word	seq_090_0
	.word	seq_090_1

	.end