@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_262_grp, bank_005
	.equ	seq_262_pri, 5
	.equ	seq_262_rev, 178
	.equ	seq_262_mvl, 127
	.equ	seq_262_key, 0

	.section .rodata
	.global	seq_262
	.align	2

@*********************** Track 01 ***********************@

seq_262_0:
	.byte	KEYSH , seq_262_key+0
	.byte	W12
	.byte	TEMPO , 140/2
	.byte		VOICE , 13
	.byte		PAN   , c_v-10
	.byte		VOL   , 90*seq_262_mvl/mxv
	.byte		N04   , Fn4 , v092
	.byte	W04
	.byte		        Fn4 , v080
	.byte	W04
	.byte		N04
	.byte	W04
	.byte		        Cn4 , v092
	.byte	W04
	.byte		        Cn4 , v080
	.byte	W04
	.byte		N04
	.byte	W04
	.byte		        Cn5 , v092
	.byte	W08
	.byte		        Dn5 
	.byte	W08
	.byte		        Cn5 
	.byte	W08
	.byte		        Fn5 
	.byte	W04
	.byte		        Fn5 , v080
	.byte	W04
	.byte		N04
	.byte	W04
	.byte		N04
	.byte	W36
	.byte	FINE

@*********************** Track 02 ***********************@

seq_262_1:
	.byte	KEYSH , seq_262_key+0
	.byte	W12
	.byte		VOICE , 13
	.byte		PAN   , c_v+31
	.byte		VOL   , 90*seq_262_mvl/mxv
	.byte	W24
	.byte		N04   , Gn4 , v092
	.byte	W08
	.byte		        As4 
	.byte	W08
	.byte		        Gn4 
	.byte	W08
	.byte		N16   , An4 
	.byte	W48
	.byte	FINE

@*********************** Track 03 ***********************@

seq_262_2:
	.byte	KEYSH , seq_262_key+0
	.byte	W12
	.byte		VOICE , 1
	.byte		VOL   , 90*seq_262_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N24   , Fn3 , v080
	.byte	W24
	.byte		N04   , Gn3 
	.byte	W08
	.byte		N04
	.byte	W08
	.byte		N04
	.byte	W08
	.byte		N16   , Fn3 
	.byte	W48
	.byte	FINE

@*********************** Track 04 ***********************@

seq_262_3:
	.byte	KEYSH , seq_262_key+0
	.byte	W12
	.byte		VOICE , 1
	.byte		VOL   , 90*seq_262_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N24   , An2 , v080
	.byte	W24
	.byte		N04   , As2 
	.byte	W08
	.byte		N04
	.byte	W08
	.byte		N04
	.byte	W08
	.byte		N16   , An2 
	.byte	W48
	.byte	FINE

@*********************** Track 05 ***********************@

seq_262_4:
	.byte	KEYSH , seq_262_key+0
	.byte	W12
	.byte		VOICE , 100
	.byte		VOL   , 90*seq_262_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N04   , Cn5 , v060
	.byte	W08
	.byte		PAN   , c_v-49
	.byte		N04   , Cn5 , v020
	.byte	W16
	.byte		VOICE , 101
	.byte		PAN   , c_v-1
	.byte		N04   , As3 , v060
	.byte	W08
	.byte		        Gn3 
	.byte	W08
	.byte		PAN   , c_v+50
	.byte		N04   , Gn3 , v020
	.byte	W08
	.byte		VOICE , 100
	.byte		PAN   , c_v+0
	.byte		N04   , An3 , v060
	.byte	W08
	.byte		PAN   , c_v-48
	.byte		N04   , An3 , v020
	.byte	W16
	.byte		VOICE , 101
	.byte		PAN   , c_v+0
	.byte		N04   , An3 , v060
	.byte	W08
	.byte		PAN   , c_v+50
	.byte		N04   , An3 , v020
	.byte	W16
	.byte	FINE

@******************************************************@

	.align	2

seq_262:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_262_pri	@ Priority
	.byte	seq_262_rev	@ Reverb

	.word	seq_262_grp

	.word	seq_262_0
	.word	seq_262_1
	.word	seq_262_2
	.word	seq_262_3
	.word	seq_262_4

	.end
