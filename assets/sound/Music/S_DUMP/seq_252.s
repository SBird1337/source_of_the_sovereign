@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_252_grp, bank_003
	.equ	seq_252_pri, 5
	.equ	seq_252_rev, 178
	.equ	seq_252_mvl, 127
	.equ	seq_252_key, 0

	.section .rodata
	.global	seq_252
	.align	2

@*********************** Track 01 ***********************@

seq_252_0:
	.byte	KEYSH , seq_252_key+0
	.byte	TEMPO , 420/2
	.byte		VOICE , 24
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 96*seq_252_mvl/mxv
	.byte		N04   , Dn4 , v120
	.byte	W06
	.byte		PAN   , c_v-64
	.byte		N04   , Dn4 , v032
	.byte	W06
	.byte		PAN   , c_v-1
	.byte		N04   , Fs4 , v096
	.byte	W06
	.byte		PAN   , c_v+63
	.byte		N04   , Fs4 , v032
	.byte	W06
	.byte		VOICE , 92
	.byte		PAN   , c_v+0
	.byte		VOL   , 125*seq_252_mvl/mxv
	.byte		N04   , An1 , v112
	.byte	W10
	.byte		MOD   , 8
	.byte	W02
	.byte		N06   , An1 , v088
	.byte	W06
	.byte		        An1 , v024
	.byte	W06
	.byte		MOD   , 0
	.byte	FINE

@******************************************************@

	.align	2

seq_252:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_252_pri	@ Priority
	.byte	seq_252_rev	@ Reverb

	.word	seq_252_grp

	.word	seq_252_0

	.end
