@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_137_grp, bank_002
	.equ	seq_137_pri, 4
	.equ	seq_137_rev, 178
	.equ	seq_137_mvl, 127
	.equ	seq_137_key, 0

	.section .rodata
	.global	seq_137
	.align	2

@*********************** Track 01 ***********************@

seq_137_0:
	.byte	KEYSH , seq_137_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 29
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 22*seq_137_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N30   , Dn4 , v127
	.byte	W01
	.byte		VOL   , 49*seq_137_mvl/mxv
	.byte	W01
	.byte		        71*seq_137_mvl/mxv
	.byte	W01
	.byte		        95*seq_137_mvl/mxv
	.byte		BEND  , c_v+8
	.byte	W01
	.byte		VOL   , 110*seq_137_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+16
	.byte	W01
	.byte		VOL   , 95*seq_137_mvl/mxv
	.byte	W02
	.byte		        88*seq_137_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+7
	.byte	W01
	.byte		VOL   , 93*seq_137_mvl/mxv
	.byte	W02
	.byte		        110*seq_137_mvl/mxv
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v+0
	.byte	W02
	.byte		VOL   , 86*seq_137_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-9
	.byte	W01
	.byte		VOL   , 63*seq_137_mvl/mxv
	.byte	W02
	.byte		        37*seq_137_mvl/mxv
	.byte		BEND  , c_v-24
	.byte	W03
	.byte		VOL   , 13*seq_137_mvl/mxv
	.byte		BEND  , c_v-46
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_137_1:
	.byte	KEYSH , seq_137_key+0
	.byte		VOICE , 27
	.byte		PAN   , c_v+0
	.byte		VOL   , 22*seq_137_mvl/mxv
	.byte		N30   , Gn2 , v032
	.byte	W01
	.byte		VOL   , 49*seq_137_mvl/mxv
	.byte	W01
	.byte		        71*seq_137_mvl/mxv
	.byte	W01
	.byte		        95*seq_137_mvl/mxv
	.byte	W01
	.byte		        110*seq_137_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        95*seq_137_mvl/mxv
	.byte	W02
	.byte		        88*seq_137_mvl/mxv
	.byte	W01
	.byte		        93*seq_137_mvl/mxv
	.byte	W02
	.byte		        110*seq_137_mvl/mxv
	.byte	W02
	.byte		        86*seq_137_mvl/mxv
	.byte	W01
	.byte	W01
	.byte		        63*seq_137_mvl/mxv
	.byte	W02
	.byte		        37*seq_137_mvl/mxv
	.byte	W03
	.byte		        13*seq_137_mvl/mxv
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_137:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_137_pri	@ Priority
	.byte	seq_137_rev	@ Reverb

	.word	seq_137_grp

	.word	seq_137_0
	.word	seq_137_1

	.end