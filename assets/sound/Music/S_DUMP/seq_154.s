@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_154_grp, bank_002
	.equ	seq_154_pri, 4
	.equ	seq_154_rev, 178
	.equ	seq_154_mvl, 127
	.equ	seq_154_key, 0

	.section .rodata
	.global	seq_154
	.align	2

@*********************** Track 01 ***********************@

seq_154_0:
	.byte	KEYSH , seq_154_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 26
	.byte		BENDR , 12
	.byte		PAN   , c_v+6
	.byte		VOL   , 110*seq_154_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N02   , Gn3 , v112
	.byte	W02
	.byte		        Gs3 
	.byte	W01
	.byte		PAN   , c_v-7
	.byte	W01
	.byte		N02   , An3 
	.byte	W02
	.byte		PAN   , c_v+7
	.byte	W02
	.byte		        c_v-8
	.byte	W02
	.byte		VOICE , 21
	.byte		PAN   , c_v+0
	.byte		N01   , Cn5 , v116
	.byte	W02
	.byte		PAN   , c_v+10
	.byte		N01   , Cn4 , v108
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		N01   , Gn4 , v104
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		N01   , Gn3 , v096
	.byte	W01
	.byte		PAN   , c_v+10
	.byte		N01   , Cn4 , v088
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		N01   , Cn3 , v080
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		N01   , Gn3 , v072
	.byte	W01
	.byte		PAN   , c_v+10
	.byte		N01   , Gn2 , v064
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		N01   , Cn3 , v056
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		N01   , Gn2 , v048
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_154_1:
	.byte	KEYSH , seq_154_key+0
	.byte		VOICE , 27
	.byte		VOL   , 110*seq_154_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte	W10
	.byte		N01   , Gn2 , v040
	.byte	W08
	.byte		N01
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_154:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_154_pri	@ Priority
	.byte	seq_154_rev	@ Reverb

	.word	seq_154_grp

	.word	seq_154_0
	.word	seq_154_1

	.end
