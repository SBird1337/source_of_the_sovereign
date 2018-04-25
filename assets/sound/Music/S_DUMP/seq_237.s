@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_237_grp, bank_002
	.equ	seq_237_pri, 4
	.equ	seq_237_rev, 178
	.equ	seq_237_mvl, 127
	.equ	seq_237_key, 0

	.section .rodata
	.global	seq_237
	.align	2

@*********************** Track 01 ***********************@

seq_237_0:
	.byte	KEYSH , seq_237_key+0
	.byte	TEMPO , 170/2
	.byte		VOICE , 37
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 110*seq_237_mvl/mxv
	.byte		BEND  , c_v-4
	.byte		N03   , Gn4 , v100
	.byte	W06
	.byte		PAN   , c_v+16
	.byte		N03   , Gn4 , v056
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		N03   , An5 , v100
	.byte	W03
	.byte	W03
	.byte		PAN   , c_v-15
	.byte		N03   , An5 , v056
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		N03   , Cn6 , v100
	.byte	W06
	.byte		PAN   , c_v+16
	.byte		N03   , Cn6 , v056
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		N03   , Gn4 , v072
	.byte	W03
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N03   , Gn4 , v028
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		N03   , An5 , v072
	.byte	W06
	.byte		PAN   , c_v+16
	.byte		N03   , An5 , v028
	.byte	W03
	.byte		PAN   , c_v+0
	.byte		N03   , Cn6 , v072
	.byte	W03
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N03   , Cn6 , v028
	.byte	W03
	.byte	W06
	.byte	FINE

@*********************** Track 02 ***********************@

seq_237_1:
	.byte	KEYSH , seq_237_key+0
	.byte		VOICE , 47
	.byte		XCMD  , xIECV , 10
	.byte		        xIECL , 8
	.byte		MOD   , 20
	.byte		VOL   , 44*seq_237_mvl/mxv
	.byte		BEND  , c_v-2
	.byte	W03
	.byte		N03   , Gn3 , v112
	.byte	W03
	.byte	W03
	.byte		        Gn3 , v068
	.byte	W03
	.byte		        An4 , v112
	.byte	W06
	.byte		        An4 , v068
	.byte	W03
	.byte		        Cn5 , v112
	.byte	W03
	.byte	W03
	.byte		        Cn5 , v068
	.byte	W03
	.byte		        Gn3 , v080
	.byte	W06
	.byte		        Gn3 , v036
	.byte	W03
	.byte		        An4 , v080
	.byte	W03
	.byte	W03
	.byte		        An4 , v036
	.byte	W03
	.byte		        Cn5 , v080
	.byte	W06
	.byte		        Cn5 , v036
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_237:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_237_pri	@ Priority
	.byte	seq_237_rev	@ Reverb

	.word	seq_237_grp

	.word	seq_237_0
	.word	seq_237_1

	.end
