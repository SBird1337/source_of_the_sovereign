@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_224_grp, bank_002
	.equ	seq_224_pri, 4
	.equ	seq_224_rev, 178
	.equ	seq_224_mvl, 127
	.equ	seq_224_key, 0

	.section .rodata
	.global	seq_224
	.align	2

@*********************** Track 01 ***********************@

seq_224_0:
	.byte	KEYSH , seq_224_key+0
	.byte	TEMPO , 100/2
	.byte		VOICE , 64
	.byte		BENDR , 2
	.byte		LFOS  , 40
	.byte		PAN   , c_v+0
	.byte		VOL   , 70*seq_224_mvl/mxv
	.byte		BEND  , c_v-16
	.byte		N21   , Gn5 , v112
	.byte	W03
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		        c_v+0
	.byte	W03
	.byte		MOD   , 10
	.byte	W03
	.byte	W09
	.byte		        0
	.byte	W03
	.byte		N09   , An5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		BEND  , c_v-14
	.byte		N66   , Gn5 
	.byte	W06
	.byte		BEND  , c_v-8
	.byte	W06
	.byte		        c_v-4
	.byte	W06
	.byte		        c_v+0
	.byte	W06
	.byte		MOD   , 10
	.byte	W12
	.byte	W12
	.byte	W06
	.byte		VOL   , 61*seq_224_mvl/mxv
	.byte	W06
	.byte		        51*seq_224_mvl/mxv
	.byte	W06
	.byte		        36*seq_224_mvl/mxv
	.byte	W06
	.byte		        18*seq_224_mvl/mxv
	.byte	W12
	.byte	FINE

@*********************** Track 02 ***********************@

seq_224_1:
	.byte	KEYSH , seq_224_key+0
	.byte		VOICE , 64
	.byte		BENDR , 2
	.byte		LFOS  , 40
	.byte		VOL   , 70*seq_224_mvl/mxv
	.byte	W12
	.byte		PAN   , c_v+12
	.byte		BEND  , c_v-16
	.byte		N21   , Gn5 , v072
	.byte	W03
	.byte		BEND  , c_v-8
	.byte	W03
	.byte		        c_v+0
	.byte	W03
	.byte		MOD   , 10
	.byte	W03
	.byte	W09
	.byte		        0
	.byte	W03
	.byte		PAN   , c_v-12
	.byte		N09   , An5 
	.byte	W12
	.byte		PAN   , c_v+14
	.byte		N09   , En5 
	.byte	W12
	.byte		PAN   , c_v-15
	.byte		BEND  , c_v-14
	.byte		N66   , Gn5 
	.byte	W06
	.byte		BEND  , c_v-8
	.byte	W06
	.byte		        c_v-4
	.byte	W06
	.byte		        c_v+0
	.byte	W06
	.byte		MOD   , 10
	.byte	W12
	.byte	W06
	.byte		VOL   , 61*seq_224_mvl/mxv
	.byte	W06
	.byte		        51*seq_224_mvl/mxv
	.byte	W06
	.byte		        36*seq_224_mvl/mxv
	.byte	W06
	.byte		        18*seq_224_mvl/mxv
	.byte	W12
	.byte	FINE

@******************************************************@

	.align	2

seq_224:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_224_pri	@ Priority
	.byte	seq_224_rev	@ Reverb

	.word	seq_224_grp

	.word	seq_224_0
	.word	seq_224_1

	.end
