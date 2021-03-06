@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_175_grp, bank_002
	.equ	seq_175_pri, 4
	.equ	seq_175_rev, 178
	.equ	seq_175_mvl, 127
	.equ	seq_175_key, 0

	.section .rodata
	.global	seq_175
	.align	2

@*********************** Track 01 ***********************@

seq_175_0:
	.byte	KEYSH , seq_175_key+0
	.byte	TEMPO , 150/2
	.byte		VOICE , 9
	.byte		BENDR , 2
	.byte		PAN   , c_v+0
	.byte		VOL   , 24*seq_175_mvl/mxv
	.byte		BEND  , c_v-17
	.byte		N78   , Bn4 , v080
	.byte	W01
	.byte		VOL   , 32*seq_175_mvl/mxv
	.byte		PAN   , c_v+6
	.byte	W01
	.byte		VOL   , 38*seq_175_mvl/mxv
	.byte		PAN   , c_v-7
	.byte	W01
	.byte		VOL   , 48*seq_175_mvl/mxv
	.byte		PAN   , c_v+9
	.byte	W01
	.byte		VOL   , 66*seq_175_mvl/mxv
	.byte		PAN   , c_v-13
	.byte	W02
	.byte		VOL   , 78*seq_175_mvl/mxv
	.byte		PAN   , c_v+6
	.byte	W01
	.byte		VOL   , 94*seq_175_mvl/mxv
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		VOL   , 110*seq_175_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-7
	.byte	W02
	.byte		PAN   , c_v+9
	.byte	W01
	.byte		        c_v-13
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-6
	.byte	W01
	.byte		        c_v+0
	.byte	W02
	.byte	PEND
	.byte		PAN   , c_v+6
	.byte	W01
	.byte		        c_v-7
	.byte	W01
	.byte		        c_v+9
	.byte	W01
	.byte		        c_v-13
	.byte	W01
	.byte		        c_v+6
	.byte	W02
	.byte	PEND
	.byte		        c_v-6
	.byte	W01
	.byte		        c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-7
	.byte	W01
	.byte		        c_v+9
	.byte	W02
	.byte		        c_v-13
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-6
	.byte	W01
	.byte		        c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W02
	.byte		        c_v-7
	.byte	W01
	.byte		        c_v+9
	.byte	W01
	.byte		        c_v-13
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-6
	.byte	W02
	.byte		        c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-7
	.byte	W01
	.byte		        c_v+9
	.byte	W01
	.byte		        c_v-13
	.byte	W02
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-6
	.byte	W01
	.byte		        c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		        c_v-7
	.byte	W02
	.byte	PATT
	 .word	seq_175_0 + 0x39
	.byte	PATT
	 .word	seq_175_0 + 0x45
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		        c_v+0
	.byte	W01
	.byte		        c_v+6
	.byte	W01
	.byte		VOL   , 103*seq_175_mvl/mxv
	.byte		PAN   , c_v-7
	.byte	W01
	.byte		VOL   , 91*seq_175_mvl/mxv
	.byte		PAN   , c_v+9
	.byte	W02
	.byte		VOL   , 72*seq_175_mvl/mxv
	.byte		PAN   , c_v-13
	.byte	W01
	.byte		VOL   , 58*seq_175_mvl/mxv
	.byte		PAN   , c_v+6
	.byte	W01
	.byte		VOL   , 38*seq_175_mvl/mxv
	.byte		PAN   , c_v-6
	.byte	W01
	.byte		VOL   , 15*seq_175_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W01
	.byte		VOL   , 7*seq_175_mvl/mxv
	.byte		PAN   , c_v+6
	.byte	W02
	.byte	FINE

@******************************************************@

	.align	2

seq_175:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_175_pri	@ Priority
	.byte	seq_175_rev	@ Reverb

	.word	seq_175_grp

	.word	seq_175_0

	.end
