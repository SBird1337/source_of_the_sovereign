@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_081_grp, bank_002
	.equ	seq_081_pri, 3
	.equ	seq_081_rev, 178
	.equ	seq_081_mvl, 127
	.equ	seq_081_key, 0

	.section .rodata
	.global	seq_081
	.align	2

@*********************** Track 01 ***********************@

seq_081_0:
	.byte	KEYSH , seq_081_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 18
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_081_mvl/mxv
	.byte		BEND  , c_v+35
	.byte		TIE   , Dn2 , v112
	.byte	W03
	.byte		BEND  , c_v+11
	.byte	W03
	.byte		        c_v+0
	.byte	W03
	.byte		        c_v+6
	.byte	W06
	.byte		        c_v+0
	.byte	W09
	.byte	W15
	.byte		        c_v+0
	.byte	W06
	.byte		        c_v-4
	.byte	W03
	.byte	W06
	.byte		        c_v-13
	.byte	W09
	.byte		        c_v-18
	.byte	W09
	.byte		VOL   , 102*seq_081_mvl/mxv
	.byte		BEND  , c_v-25
	.byte	W09
	.byte		VOL   , 97*seq_081_mvl/mxv
	.byte		BEND  , c_v-38
	.byte	W09
	.byte		VOL   , 92*seq_081_mvl/mxv
	.byte		BEND  , c_v-45
	.byte	W06
	.byte	W03
	.byte		VOL   , 83*seq_081_mvl/mxv
	.byte	W06
	.byte		BEND  , c_v-52
	.byte	W03
	.byte		VOL   , 64*seq_081_mvl/mxv
	.byte	W06
	.byte		        47*seq_081_mvl/mxv
	.byte	W06
	.byte		EOT
	.byte	FINE

@******************************************************@

	.align	2

seq_081:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_081_pri	@ Priority
	.byte	seq_081_rev	@ Reverb

	.word	seq_081_grp

	.word	seq_081_0

	.end
