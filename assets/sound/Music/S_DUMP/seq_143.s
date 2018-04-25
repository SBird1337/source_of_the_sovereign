@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_143_grp, bank_002
	.equ	seq_143_pri, 4
	.equ	seq_143_rev, 178
	.equ	seq_143_mvl, 127
	.equ	seq_143_key, 0

	.section .rodata
	.global	seq_143
	.align	2

@*********************** Track 01 ***********************@

seq_143_0:
	.byte	KEYSH , seq_143_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 29
	.byte		BENDR , 12
	.byte		VOL   , 22*seq_143_mvl/mxv
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+0
	.byte		N96   , Gn3 , v127
	.byte	W01
	.byte		VOL   , 49*seq_143_mvl/mxv
	.byte	W01
	.byte		        71*seq_143_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		VOL   , 95*seq_143_mvl/mxv
	.byte		BEND  , c_v+8
	.byte	W01
	.byte		VOL   , 110*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v+16
	.byte	W03
	.byte		VOL   , 97*seq_143_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+7
	.byte	W03
	.byte		PAN   , c_v+5
	.byte		BEND  , c_v+0
	.byte	W01
	.byte		VOL   , 84*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-9
	.byte	W03
	.byte		VOL   , 76*seq_143_mvl/mxv
	.byte		PAN   , c_v-5
	.byte		BEND  , c_v-24
	.byte	W03
	.byte		PAN   , c_v-2
	.byte		BEND  , c_v-46
	.byte	W03
	.byte		VOL   , 84*seq_143_mvl/mxv
	.byte		PAN   , c_v+5
	.byte	W03
	.byte		        c_v+0
	.byte	W01
	.byte		VOL   , 92*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v-5
	.byte	W01
	.byte		BEND  , c_v-32
	.byte	W02
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		VOL   , 86*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+5
	.byte	W02
	.byte		BEND  , c_v-18
	.byte	W01
	.byte		VOL   , 78*seq_143_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W03
	.byte		        c_v-5
	.byte	W02
	.byte		VOL   , 71*seq_143_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v-2
	.byte	W03
	.byte		        c_v+5
	.byte	W03
	.byte		        c_v+0
	.byte		VOL   , 78*seq_143_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v-5
	.byte	W02
	.byte		VOL   , 86*seq_143_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte	W03
	.byte		        c_v+5
	.byte	W02
	.byte		VOL   , 90*seq_143_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte	W03
	.byte		        c_v-5
	.byte	W03
	.byte		        c_v-2
	.byte	W01
	.byte		VOL   , 80*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+5
	.byte	W03
	.byte		        c_v+0
	.byte	W01
	.byte		VOL   , 86*seq_143_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v-5
	.byte	W03
	.byte		        c_v+0
	.byte		VOL   , 83*seq_143_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v+5
	.byte		VOL   , 63*seq_143_mvl/mxv
	.byte	W03
	.byte		        37*seq_143_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W03
	.byte		        c_v-5
	.byte		VOL   , 13*seq_143_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v-2
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_143_1:
	.byte	KEYSH , seq_143_key+0
	.byte		VOICE , 27
	.byte		VOL   , 22*seq_143_mvl/mxv
	.byte		N96   , Gn2 , v032
	.byte	W01
	.byte		VOL   , 49*seq_143_mvl/mxv
	.byte	W01
	.byte		        71*seq_143_mvl/mxv
	.byte	W01
	.byte		        95*seq_143_mvl/mxv
	.byte	W01
	.byte		        110*seq_143_mvl/mxv
	.byte	W05
	.byte		        97*seq_143_mvl/mxv
	.byte	W15
	.byte	W24
	.byte	W24
	.byte	W09
	.byte		        83*seq_143_mvl/mxv
	.byte	W03
	.byte		        63*seq_143_mvl/mxv
	.byte	W03
	.byte		        37*seq_143_mvl/mxv
	.byte	W03
	.byte		        13*seq_143_mvl/mxv
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_143:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_143_pri	@ Priority
	.byte	seq_143_rev	@ Reverb

	.word	seq_143_grp

	.word	seq_143_0
	.word	seq_143_1

	.end
