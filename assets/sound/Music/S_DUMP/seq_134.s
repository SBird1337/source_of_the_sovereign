@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_134_grp, bank_002
	.equ	seq_134_pri, 4
	.equ	seq_134_rev, 178
	.equ	seq_134_mvl, 127
	.equ	seq_134_key, 0

	.section .rodata
	.global	seq_134
	.align	2

@*********************** Track 01 ***********************@

seq_134_0:
	.byte	KEYSH , seq_134_key+0
	.byte	TEMPO , 220/2
	.byte		VOICE , 6
	.byte		VOL   , 110*seq_134_mvl/mxv
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N04   , En3 , v127
	.byte	W01
	.byte		BEND  , c_v-13
	.byte	W01
	.byte		PAN   , c_v+10
	.byte		BEND  , c_v-38
	.byte	W01
	.byte		PAN   , c_v-9
	.byte		BEND  , c_v-64
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N03   , An2 
	.byte	W01
	.byte		PAN   , c_v+7
	.byte		BEND  , c_v-28
	.byte	W01
	.byte		        c_v-64
	.byte	W01
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N03   , Cn3 , v060
	.byte	W01
	.byte		PAN   , c_v-6
	.byte		BEND  , c_v-28
	.byte	W02
	.byte		        c_v-64
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N10   , Gn2 , v127
	.byte	W01
	.byte		BEND  , c_v-8
	.byte	W01
	.byte		VOL   , 101*seq_134_mvl/mxv
	.byte		PAN   , c_v-6
	.byte		BEND  , c_v-15
	.byte	W02
	.byte		        c_v-20
	.byte	W01
	.byte		VOL   , 83*seq_134_mvl/mxv
	.byte		PAN   , c_v+6
	.byte		BEND  , c_v-24
	.byte	W01
	.byte		        c_v-30
	.byte	W01
	.byte		VOL   , 58*seq_134_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v-39
	.byte	W01
	.byte		        c_v-53
	.byte	W02
	.byte		VOL   , 25*seq_134_mvl/mxv
	.byte		BEND  , c_v-64
	.byte	W24
	.byte	FINE

@*********************** Track 02 ***********************@

seq_134_1:
	.byte	KEYSH , seq_134_key+0
	.byte		VOICE , 5
	.byte		XCMD  , xIECV , 10
	.byte		        xIECL , 8
	.byte		VOL   , 110*seq_134_mvl/mxv
	.byte		PAN   , c_v+9
	.byte		N03   , Gs2 , v092
	.byte	W06
	.byte		PAN   , c_v-7
	.byte		N03   , Gs2 , v052
	.byte	W03
	.byte		N03
	.byte	W05
	.byte		VOICE , 27
	.byte		PAN   , c_v+0
	.byte		N13
	.byte	W04
	.byte		VOL   , 101*seq_134_mvl/mxv
	.byte	W02
	.byte		        83*seq_134_mvl/mxv
	.byte	W02
	.byte		        58*seq_134_mvl/mxv
	.byte	W02
	.byte	W01
	.byte		        25*seq_134_mvl/mxv
	.byte	W23
	.byte	FINE

@******************************************************@

	.align	2

seq_134:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_134_pri	@ Priority
	.byte	seq_134_rev	@ Reverb

	.word	seq_134_grp

	.word	seq_134_0
	.word	seq_134_1

	.end
