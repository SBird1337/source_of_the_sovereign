@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_069_grp, bank_002
	.equ	seq_069_pri, 4
	.equ	seq_069_rev, 178
	.equ	seq_069_mvl, 127
	.equ	seq_069_key, 0

	.section .rodata
	.global	seq_069
	.align	2

@*********************** Track 01 ***********************@

seq_069_0:
	.byte	KEYSH , seq_069_key+0
	.byte	TEMPO , 240/2
	.byte		VOICE , 2
	.byte		BENDR , 12
	.byte		VOL   , 105*seq_069_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N02   , Fn3 , v127
	.byte	W02
	.byte		N01   , Cn4 , v112
	.byte	W02
	.byte		N03   , Fn3 , v052
	.byte	W02
	.byte	W02
	.byte		VOICE , 23
	.byte		N01   , En4 , v092
	.byte	W01
	.byte		        Cn5 
	.byte	W03
	.byte		        Gn3 
	.byte	W01
	.byte		        En4 
	.byte	W02
	.byte		        En3 , v048
	.byte	W01
	.byte		        Bn3 
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_069:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_069_pri	@ Priority
	.byte	seq_069_rev	@ Reverb

	.word	seq_069_grp

	.word	seq_069_0

	.end
