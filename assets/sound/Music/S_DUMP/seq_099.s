@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_099_grp, bank_002
	.equ	seq_099_pri, 4
	.equ	seq_099_rev, 178
	.equ	seq_099_mvl, 127
	.equ	seq_099_key, 0

	.section .rodata
	.global	seq_099
	.align	2

@*********************** Track 01 ***********************@

seq_099_0:
	.byte	KEYSH , seq_099_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 8
	.byte		VOL   , 110*seq_099_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N01   , Cn4 , v092
	.byte	W03
	.byte		        Cn5 
	.byte	W03
	.byte	W03
	.byte		N02   , En3 , v127
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_099:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_099_pri	@ Priority
	.byte	seq_099_rev	@ Reverb

	.word	seq_099_grp

	.word	seq_099_0

	.end
