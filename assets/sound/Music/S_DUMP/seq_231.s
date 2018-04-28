@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_231_grp, bank_002
	.equ	seq_231_pri, 4
	.equ	seq_231_rev, 178
	.equ	seq_231_mvl, 127
	.equ	seq_231_key, 0

	.section .rodata
	.global	seq_231
	.align	2

@*********************** Track 01 ***********************@

seq_231_0:
	.byte	KEYSH , seq_231_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 41
	.byte		VOL   , 110*seq_231_mvl/mxv
	.byte		BENDR , 12
	.byte		PAN   , c_v+6
	.byte		BEND  , c_v+0
	.byte		N02   , Cn4 , v127
	.byte	W03
	.byte		VOL   , 104*seq_231_mvl/mxv
	.byte	W03
	.byte		        93*seq_231_mvl/mxv
	.byte		PAN   , c_v-6
	.byte		N02   , Cn5 
	.byte	W03
	.byte		VOL   , 110*seq_231_mvl/mxv
	.byte	W01
	.byte		VOICE , 22
	.byte		PAN   , c_v+0
	.byte		N24   , Cn4 , v060
	.byte	W02
	.byte	W02
	.byte		BEND  , c_v+0
	.byte	W04
	.byte		        c_v+1
	.byte	W03
	.byte		        c_v+1
	.byte	W01
	.byte		VOL   , 105*seq_231_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v+0
	.byte	W01
	.byte		VOL   , 103*seq_231_mvl/mxv
	.byte	W02
	.byte		        91*seq_231_mvl/mxv
	.byte		BEND  , c_v+0
	.byte	W03
	.byte		VOL   , 77*seq_231_mvl/mxv
	.byte		BEND  , c_v-1
	.byte	W02
	.byte		VOL   , 61*seq_231_mvl/mxv
	.byte		BEND  , c_v-2
	.byte	W01
	.byte		VOL   , 38*seq_231_mvl/mxv
	.byte	W01
	.byte		        15*seq_231_mvl/mxv
	.byte		BEND  , c_v-3
	.byte	W02
	.byte	FINE

@*********************** Track 02 ***********************@

seq_231_1:
	.byte	KEYSH , seq_231_key+0
	.byte		VOICE , 4
	.byte		VOL   , 110*seq_231_mvl/mxv
	.byte		N02   , Cn3 , v060
	.byte	W03
	.byte		        Gn2 
	.byte	W03
	.byte		        Gs4 
	.byte	W04
	.byte		        Gs4 , v020
	.byte	W02
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_231:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_231_pri	@ Priority
	.byte	seq_231_rev	@ Reverb

	.word	seq_231_grp

	.word	seq_231_0
	.word	seq_231_1

	.end