@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_182_grp, bank_002
	.equ	seq_182_pri, 4
	.equ	seq_182_rev, 178
	.equ	seq_182_mvl, 127
	.equ	seq_182_key, 0

	.section .rodata
	.global	seq_182
	.align	2

@*********************** Track 01 ***********************@

seq_182_0:
	.byte	KEYSH , seq_182_key+0
	.byte	TEMPO , 190/2
	.byte		VOICE , 45
	.byte		BENDR , 8
	.byte		PAN   , c_v+0
	.byte		VOL   , 38*seq_182_mvl/mxv
	.byte		MOD   , 30
	.byte		BEND  , c_v+1
	.byte		N42   , As2 , v120
	.byte	W01
	.byte		PAN   , c_v+3
	.byte	W01
	.byte		        c_v+5
	.byte		VOL   , 57*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+9
	.byte	W01
	.byte		VOL   , 71*seq_182_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v+5
	.byte	W01
	.byte		        c_v+1
	.byte		VOL   , 82*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		        c_v-3
	.byte		VOL   , 94*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v-6
	.byte	W02
	.byte		        c_v-10
	.byte		VOL   , 110*seq_182_mvl/mxv
	.byte	W02
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		        c_v-3
	.byte	W01
	.byte		        c_v+0
	.byte	W02
	.byte	W06
	.byte		        c_v+3
	.byte	W01
	.byte		        c_v+5
	.byte	W01
	.byte		        c_v+9
	.byte	W02
	.byte		        c_v+5
	.byte	W02
	.byte		        c_v+1
	.byte		VOL   , 95*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		        c_v-3
	.byte		VOL   , 83*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		        c_v-10
	.byte		VOL   , 71*seq_182_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		PAN   , c_v-6
	.byte		VOL   , 56*seq_182_mvl/mxv
	.byte	W01
	.byte		PAN   , c_v-3
	.byte	W01
	.byte		VOL   , 38*seq_182_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v+0
	.byte	FINE

@*********************** Track 02 ***********************@

seq_182_1:
	.byte	KEYSH , seq_182_key+0
	.byte		VOICE , 47
	.byte		BENDR , 8
	.byte		PAN   , c_v+0
	.byte		VOL   , 38*seq_182_mvl/mxv
	.byte		MOD   , 30
	.byte		BEND  , c_v+1
	.byte		N42   , As1 , v040
	.byte	W02
	.byte		VOL   , 57*seq_182_mvl/mxv
	.byte	W02
	.byte		        71*seq_182_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        82*seq_182_mvl/mxv
	.byte	W02
	.byte		        94*seq_182_mvl/mxv
	.byte	W03
	.byte		        110*seq_182_mvl/mxv
	.byte	W06
	.byte	W06
	.byte	W06
	.byte		        95*seq_182_mvl/mxv
	.byte	W02
	.byte		        83*seq_182_mvl/mxv
	.byte	W02
	.byte		        71*seq_182_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        56*seq_182_mvl/mxv
	.byte	W02
	.byte		        38*seq_182_mvl/mxv
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_182:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_182_pri	@ Priority
	.byte	seq_182_rev	@ Reverb

	.word	seq_182_grp

	.word	seq_182_0
	.word	seq_182_1

	.end
