@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_191_grp, bank_002
	.equ	seq_191_pri, 4
	.equ	seq_191_rev, 178
	.equ	seq_191_mvl, 127
	.equ	seq_191_key, 0

	.section .rodata
	.global	seq_191
	.align	2

@*********************** Track 01 ***********************@

seq_191_0:
	.byte	KEYSH , seq_191_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 41
	.byte		VOL   , 110*seq_191_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N01   , Cn4 , v127
	.byte	W01
	.byte		N03   , Cn5 
	.byte	W01
	.byte		PAN   , c_v+5
	.byte	W01
	.byte		        c_v-6
	.byte	W01
	.byte		VOICE , 3
	.byte		PAN   , c_v+0
	.byte		N01   , Gs4 , v112
	.byte	W02
	.byte	W03
	.byte		PAN   , c_v+7
	.byte		N01   , Dn5 , v096
	.byte	W03
	.byte	W02
	.byte		PAN   , c_v+0
	.byte		N01   , Gs4 , v084
	.byte	W04
	.byte	W01
	.byte		PAN   , c_v-8
	.byte		N01   , Dn5 , v068
	.byte	W05
	.byte		PAN   , c_v+7
	.byte		N01   , Gs4 , v052
	.byte	W04
	.byte		PAN   , c_v-8
	.byte		N01   , Dn5 , v032
	.byte	W02
	.byte	W06
	.byte	FINE

@*********************** Track 02 ***********************@

seq_191_1:
	.byte	KEYSH , seq_191_key+0
	.byte		VOICE , 4
	.byte		VOL   , 110*seq_191_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N01   , Cn3 , v064
	.byte	W01
	.byte		N03   , Gn3 
	.byte	W05
	.byte	W01
	.byte		N02   , En4 , v040
	.byte	W05
	.byte		        Gn3 
	.byte	W04
	.byte		        En4 , v032
	.byte	W02
	.byte	W03
	.byte		        Gn3 
	.byte	W03
	.byte	W02
	.byte		        En4 , v020
	.byte	W04
	.byte	W01
	.byte		        Gn3 
	.byte	W05
	.byte	FINE

@******************************************************@

	.align	2

seq_191:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_191_pri	@ Priority
	.byte	seq_191_rev	@ Reverb

	.word	seq_191_grp

	.word	seq_191_0
	.word	seq_191_1

	.end
