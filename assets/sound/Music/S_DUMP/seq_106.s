@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_106_grp, bank_002
	.equ	seq_106_pri, 5
	.equ	seq_106_rev, 178
	.equ	seq_106_mvl, 127
	.equ	seq_106_key, 0

	.section .rodata
	.global	seq_106
	.align	2

@*********************** Track 01 ***********************@

seq_106_0:
	.byte	KEYSH , seq_106_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 21
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 120*seq_106_mvl/mxv
	.byte		BEND  , c_v+1
	.byte		N01   , Bn5 , v127
	.byte	W01
	.byte		        Cn5 , v100
	.byte	W01
	.byte		VOICE , 18
	.byte		N01   , Cn4 , v127
	.byte	W02
	.byte		VOICE , 36
	.byte		N19   , Cn6 , v040
	.byte	W02
	.byte		VOL   , 63*seq_106_mvl/mxv
	.byte		BEND  , c_v+5
	.byte	W01
	.byte		VOL   , 77*seq_106_mvl/mxv
	.byte		BEND  , c_v+13
	.byte	W01
	.byte		VOL   , 91*seq_106_mvl/mxv
	.byte		BEND  , c_v+21
	.byte	W01
	.byte		VOL   , 106*seq_106_mvl/mxv
	.byte		BEND  , c_v+33
	.byte	W01
	.byte		VOL   , 120*seq_106_mvl/mxv
	.byte	W05
	.byte		        109*seq_106_mvl/mxv
	.byte	W01
	.byte		        102*seq_106_mvl/mxv
	.byte	W02
	.byte		        84*seq_106_mvl/mxv
	.byte	W01
	.byte		        68*seq_106_mvl/mxv
	.byte	W01
	.byte		        56*seq_106_mvl/mxv
	.byte	W01
	.byte		        24*seq_106_mvl/mxv
	.byte	W01
	.byte		        10*seq_106_mvl/mxv
	.byte	W02
	.byte	FINE

@*********************** Track 02 ***********************@

seq_106_1:
	.byte	KEYSH , seq_106_key+0
	.byte		VOL   , 120*seq_106_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+1
	.byte	W07
	.byte		VOICE , 46
	.byte		N01   , Cn6 , v100
	.byte	W02
	.byte		BEND  , c_v+4
	.byte		N01   , Gn5 , v088
	.byte	W03
	.byte		BEND  , c_v+8
	.byte		N01   , Cn6 , v072
	.byte	W02
	.byte		BEND  , c_v+16
	.byte		N01   , Gn5 , v056
	.byte	W02
	.byte		BEND  , c_v+23
	.byte		N01   , Cn6 , v040
	.byte	W03
	.byte		BEND  , c_v+33
	.byte		N01   , Gn5 , v028
	.byte	W02
	.byte		BEND  , c_v+53
	.byte		N01   , Cn6 , v012
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_106:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_106_pri	@ Priority
	.byte	seq_106_rev	@ Reverb

	.word	seq_106_grp

	.word	seq_106_0
	.word	seq_106_1

	.end
