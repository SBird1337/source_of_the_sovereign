@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_112_grp, bank_002
	.equ	seq_112_pri, 4
	.equ	seq_112_rev, 178
	.equ	seq_112_mvl, 127
	.equ	seq_112_key, 0

	.section .rodata
	.global	seq_112
	.align	2

@*********************** Track 01 ***********************@

seq_112_0:
	.byte	KEYSH , seq_112_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 18
	.byte		VOL   , 100*seq_112_mvl/mxv
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N03   , Cn4 , v088
	.byte	W06
	.byte		PAN   , c_v-9
	.byte		N03   , Cn4 , v080
	.byte	W06
	.byte		PAN   , c_v+9
	.byte		N03   , Cn4 , v072
	.byte	W06
	.byte		PAN   , c_v-16
	.byte		N03   , Cn4 , v064
	.byte	W06
	.byte		PAN   , c_v+16
	.byte		N03   , Cn4 , v060
	.byte	W06
	.byte		PAN   , c_v-16
	.byte		N03   , Cn4 , v052
	.byte	W18
	.byte	FINE

@*********************** Track 02 ***********************@

seq_112_1:
	.byte	KEYSH , seq_112_key+0
	.byte		VOICE , 5
	.byte		VOL   , 100*seq_112_mvl/mxv
	.byte		PAN   , c_v+9
	.byte		N02   , Gn3 , v072
	.byte	W06
	.byte		PAN   , c_v-7
	.byte		N02   , Gn3 , v068
	.byte	W06
	.byte		PAN   , c_v+9
	.byte		N02   , Gn3 , v064
	.byte	W06
	.byte		PAN   , c_v-7
	.byte		N02   , Gn3 , v060
	.byte	W06
	.byte		PAN   , c_v+9
	.byte		N02   , Gn3 , v056
	.byte	W06
	.byte		PAN   , c_v-7
	.byte		N02   , Gn3 , v048
	.byte	W18
	.byte	FINE

@******************************************************@

	.align	2

seq_112:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_112_pri	@ Priority
	.byte	seq_112_rev	@ Reverb

	.word	seq_112_grp

	.word	seq_112_0
	.word	seq_112_1

	.end
