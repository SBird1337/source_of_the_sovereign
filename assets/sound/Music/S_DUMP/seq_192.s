@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_192_grp, bank_002
	.equ	seq_192_pri, 4
	.equ	seq_192_rev, 178
	.equ	seq_192_mvl, 127
	.equ	seq_192_key, 0

	.section .rodata
	.global	seq_192
	.align	2

@*********************** Track 01 ***********************@

seq_192_0:
	.byte	KEYSH , seq_192_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 36
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_192_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N03   , Gn2 , v127
	.byte	W02
	.byte		PAN   , c_v+3
	.byte		BEND  , c_v+2
	.byte	W01
	.byte		VOICE , 23
	.byte		N02   , Cn3 , v104
	.byte	W01
	.byte		PAN   , c_v-3
	.byte		BEND  , c_v+5
	.byte	W02
	.byte		VOICE , 36
	.byte		N02   , Cn2 , v127
	.byte	W01
	.byte		PAN   , c_v+7
	.byte	W01
	.byte		VOICE , 23
	.byte		BEND  , c_v+4
	.byte		N06   , Cn3 , v104
	.byte	W01
	.byte		PAN   , c_v-6
	.byte		BEND  , c_v+0
	.byte	W01
	.byte		        c_v-5
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-12
	.byte	W01
	.byte		        c_v-23
	.byte	W01
	.byte		VOICE , 36
	.byte		BEND  , c_v+0
	.byte		N03   , An2 , v100
	.byte	W04
	.byte		PAN   , c_v+5
	.byte		N03   , Bn2 , v076
	.byte	W03
	.byte		PAN   , c_v-6
	.byte		N02   , Cs3 , v040
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_192:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_192_pri	@ Priority
	.byte	seq_192_rev	@ Reverb

	.word	seq_192_grp

	.word	seq_192_0

	.end
