@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_185_grp, bank_002
	.equ	seq_185_pri, 4
	.equ	seq_185_rev, 178
	.equ	seq_185_mvl, 127
	.equ	seq_185_key, 0

	.section .rodata
	.global	seq_185
	.align	2

@*********************** Track 01 ***********************@

seq_185_0:
	.byte	KEYSH , seq_185_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 18
	.byte		VOL   , 110*seq_185_mvl/mxv
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		BEND  , c_v+0
	.byte		N02   , En3 , v124
	.byte	W02
	.byte		        As3 
	.byte	W04
	.byte	W01
	.byte		N03   , En3 , v092
	.byte	W05
	.byte	W04
	.byte		PAN   , c_v-6
	.byte		N02   , En3 , v076
	.byte	W02
	.byte	W01
	.byte		PAN   , c_v+6
	.byte		N02   , As3 
	.byte	W05
	.byte		PAN   , c_v+0
	.byte		N03   , En3 , v052
	.byte	W06
	.byte	W03
	.byte		PAN   , c_v-12
	.byte		N02   , En3 , v056
	.byte	W03
	.byte		PAN   , c_v+10
	.byte		N02   , As3 
	.byte	W04
	.byte		PAN   , c_v+0
	.byte		N03   , En3 , v032
	.byte	W02
	.byte	W06
	.byte	W01
	.byte		PAN   , c_v-16
	.byte		N02   , En3 , v044
	.byte	W02
	.byte		PAN   , c_v+16
	.byte		N02   , As3 
	.byte	W03
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		N03   , En3 , v020
	.byte	W04
	.byte	FINE

@*********************** Track 02 ***********************@

seq_185_1:
	.byte	KEYSH , seq_185_key+0
	.byte		VOICE , 5
	.byte		VOL   , 110*seq_185_mvl/mxv
	.byte		N01   , Cn3 , v040
	.byte	W03
	.byte		        En3 
	.byte	W03
	.byte	W01
	.byte		        Gn3 
	.byte	W05
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	W06
	.byte	FINE

@******************************************************@

	.align	2

seq_185:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_185_pri	@ Priority
	.byte	seq_185_rev	@ Reverb

	.word	seq_185_grp

	.word	seq_185_0
	.word	seq_185_1

	.end
