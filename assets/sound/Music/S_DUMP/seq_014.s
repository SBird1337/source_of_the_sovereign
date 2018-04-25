@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_014_grp, bank_000
	.equ	seq_014_pri, 5
	.equ	seq_014_rev, 178
	.equ	seq_014_mvl, 127
	.equ	seq_014_key, 0

	.section .rodata
	.global	seq_014
	.align	2

@*********************** Track 01 ***********************@

seq_014_0:
	.byte	KEYSH , seq_014_key+0
	.byte	TEMPO , 90/2
	.byte		VOICE , 125
	.byte		VOL   , 110*seq_014_mvl/mxv
	.byte		N03   , Cn3 , v100
	.byte	W03
	.byte		        An2 
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		N06   , Gn3 , v072
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v052
	.byte	W03
	.byte		N06   , Gn3 , v048
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v028
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v012
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte	FINE

@*********************** Track 02 ***********************@

seq_014_1:
	.byte	KEYSH , seq_014_key+0
	.byte		VOICE , 0
	.byte		VOL   , 110*seq_014_mvl/mxv
	.byte		N03   , Cn4 , v127
	.byte	W03
	.byte		        Cn3 
	.byte	W03
	.byte		        Cn4 
	.byte	W03
	.byte		N06   , Gn3 , v088
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v064
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v044
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v028
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte		N03   , Cn3 , v012
	.byte	W03
	.byte		N06   , Gn3 
	.byte	W03
	.byte	W03
	.byte	FINE

@******************************************************@

	.align	2

seq_014:
	.byte	2	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_014_pri	@ Priority
	.byte	seq_014_rev	@ Reverb

	.word	seq_014_grp

	.word	seq_014_0
	.word	seq_014_1

	.end
