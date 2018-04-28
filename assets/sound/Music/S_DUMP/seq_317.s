@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_317_grp, bank_057
	.equ	seq_317_pri, 5
	.equ	seq_317_rev, 178
	.equ	seq_317_mvl, 127
	.equ	seq_317_key, 0

	.section .rodata
	.global	seq_317
	.align	2

@*********************** Track 01 ***********************@

seq_317_0:
	.byte	KEYSH , seq_317_key+0
	.byte	TEMPO , 64/2
	.byte		VOICE , 80
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 50*seq_317_mvl/mxv
	.byte	W12
	.byte	TEMPO , 74/2
	.byte		N02   , An3 , v127
	.byte	W02
	.byte		        An3 , v064
	.byte	W03
	.byte		        An3 , v127
	.byte	W02
	.byte		        An3 , v068
	.byte	W03
	.byte		        Gn3 , v127
	.byte	W02
	.byte		        Gn3 , v064
	.byte	W03
	.byte		        Gn3 , v127
	.byte	W02
	.byte		        Gn3 , v064
	.byte	W03
	.byte		        Fn3 , v127
	.byte	W02
	.byte		        Fn3 , v064
	.byte	W02
	.byte	W01
	.byte		        En3 , v127
	.byte	W02
	.byte		        En3 , v064
	.byte	W03
	.byte		        Fn3 , v127
	.byte	W02
	.byte		        Fn3 , v064
	.byte	W03
	.byte		        An3 , v127
	.byte	W01
	.byte	W01
	.byte		        An3 , v064
	.byte	W03
	.byte		N05   , Cn4 , v127
	.byte	W05
	.byte		N04   , Cn4 , v064
	.byte	W03
	.byte	W02
	.byte		N05   , En4 , v127
	.byte	W05
	.byte		N04   , En4 , v064
	.byte	W05
	.byte		        Fn3 , v127
	.byte	W05
	.byte		        Fn3 , v064
	.byte	W04
	.byte		N02   , Fn3 , v044
	.byte	W03
	.byte	W12
	.byte	FINE

@*********************** Track 02 ***********************@

seq_317_1:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 81
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 40*seq_317_mvl/mxv
	.byte		PAN   , c_v-64
	.byte		BEND  , c_v+1
	.byte	W09
	.byte		PAN   , c_v+62
	.byte	W03
	.byte		N05   , Fn5 , v080
	.byte	W04
	.byte		PAN   , c_v-64
	.byte	W01
	.byte		N02   , En5 
	.byte	W05
	.byte		N05   , Dn5 
	.byte	W02
	.byte	W03
	.byte		N02   , Cn5 
	.byte	W05
	.byte		N05   , As4 
	.byte	W04
	.byte	W01
	.byte		        Cn5 
	.byte	W01
	.byte		PAN   , c_v+63
	.byte	W04
	.byte		N05   , Dn5 
	.byte	W05
	.byte		        En5 
	.byte	W01
	.byte		PAN   , c_v-64
	.byte	W04
	.byte		N10   , Fn5 
	.byte	W08
	.byte		PAN   , c_v+63
	.byte	W02
	.byte		N10   , Gn5 
	.byte	W10
	.byte		N09   , Fn5 , v064
	.byte	W09
	.byte		N02   , Fn5 , v028
	.byte	W03
	.byte	W12
	.byte	FINE

@*********************** Track 03 ***********************@

seq_317_2:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 87
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v+0
	.byte		VOL   , 44*seq_317_mvl/mxv
	.byte	W12
	.byte		N02   , Cn5 , v127
	.byte	W05
	.byte		N05   , Fn4 
	.byte	W05
	.byte		N02   , Cn5 
	.byte	W02
	.byte	W03
	.byte		        As4 
	.byte	W05
	.byte		        An4 
	.byte	W04
	.byte	W01
	.byte		        Gn4 
	.byte	W05
	.byte		        Fn4 
	.byte	W05
	.byte		        En4 
	.byte	W01
	.byte	W12
	.byte	W02
	.byte		        Cn5 
	.byte	W10
	.byte		N05   , Fn4 
	.byte	W12
	.byte	W12
	.byte	FINE

@*********************** Track 04 ***********************@

seq_317_3:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 13
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		PAN   , c_v-32
	.byte		VOL   , 51*seq_317_mvl/mxv
	.byte	W03
	.byte		PAN   , c_v+32
	.byte	W05
	.byte		        c_v-32
	.byte	W04
	.byte		N02   , Cn5 , v120
	.byte	W01
	.byte		PAN   , c_v+32
	.byte	W04
	.byte		N02   , Fn5 
	.byte	W02
	.byte		PAN   , c_v-32
	.byte	W03
	.byte		N02   , An4 
	.byte	W02
	.byte		PAN   , c_v+32
	.byte	W03
	.byte		N02   , Cn5 
	.byte	W02
	.byte		PAN   , c_v-32
	.byte	W03
	.byte		N02   , Fn4 
	.byte	W01
	.byte		PAN   , c_v+32
	.byte	W03
	.byte	W01
	.byte		N02   , An4 
	.byte	W01
	.byte		PAN   , c_v-33
	.byte	W04
	.byte		N02   , Cn4 
	.byte	W05
	.byte		PAN   , c_v-1
	.byte		N02   , Fn4 , v112
	.byte	W01
	.byte	W04
	.byte		        An4 , v120
	.byte	W08
	.byte	W02
	.byte		        Cn5 
	.byte	W10
	.byte		        Fn5 
	.byte	W02
	.byte		        Fn5 , v064
	.byte	W03
	.byte		        Fn5 , v036
	.byte	W03
	.byte		        Fn5 , v024
	.byte	W04
	.byte	W12
	.byte	FINE

@*********************** Track 05 ***********************@

seq_317_4:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 24
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v-32
	.byte		VOL   , 44*seq_317_mvl/mxv
	.byte		BEND  , c_v+1
	.byte	W12
	.byte		N05   , Fn5 , v080
	.byte	W05
	.byte		N02   , En5 
	.byte	W05
	.byte		N05   , Dn5 
	.byte	W02
	.byte	W03
	.byte		N02   , Cn5 
	.byte	W05
	.byte		N05   , As4 
	.byte	W04
	.byte	W01
	.byte		        Cn5 
	.byte	W05
	.byte		        Dn5 
	.byte	W05
	.byte		        En5 
	.byte	W01
	.byte	W04
	.byte		        Fn5 
	.byte	W08
	.byte	W02
	.byte		        Gn5 
	.byte	W10
	.byte		N09   , Fn5 
	.byte	W09
	.byte		N02   , Fn5 , v044
	.byte	W03
	.byte		        Fn5 , v024
	.byte	W12
	.byte	FINE

@*********************** Track 06 ***********************@

seq_317_5:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 24
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		PAN   , c_v+16
	.byte		VOL   , 65*seq_317_mvl/mxv
	.byte	W12
	.byte		N05   , Fn5 , v127
	.byte	W05
	.byte		N02   , En5 
	.byte	W05
	.byte		N05   , Dn5 
	.byte	W02
	.byte	W03
	.byte		N02   , Cn5 
	.byte	W05
	.byte		N05   , As4 
	.byte	W04
	.byte	W01
	.byte		        Cn5 
	.byte	W05
	.byte		        Dn5 
	.byte	W05
	.byte		        En5 
	.byte	W01
	.byte	W04
	.byte		        Fn5 
	.byte	W08
	.byte	W02
	.byte		        Gn5 
	.byte	W10
	.byte		N09   , Fn5 
	.byte	W09
	.byte		N02   , Fn5 , v064
	.byte	W03
	.byte		        Fn5 , v028
	.byte	W12
	.byte	FINE

@*********************** Track 07 ***********************@

seq_317_6:
	.byte	KEYSH , seq_317_key+0
	.byte		VOICE , 0
	.byte		VOL   , 70*seq_317_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N04   , Fs2 , v084
	.byte	W04
	.byte		        Fs2 , v064
	.byte	W05
	.byte		        Fs2 , v084
	.byte	W03
	.byte	W02
	.byte		        Fs2 , v064
	.byte	W05
	.byte		        Fs2 , v080
	.byte	W05
	.byte		        Fs2 , v064
	.byte	W04
	.byte		PAN   , c_v+48
	.byte		N04   , Fs2 , v072
	.byte	W05
	.byte		N02   , Fs2 , v044
	.byte	W03
	.byte	W02
	.byte		PAN   , c_v+0
	.byte	W02
	.byte		N09   , Bn4 
	.byte	W08
	.byte		PAN   , c_v-48
	.byte	W02
	.byte		N09   , Bn4 , v072
	.byte	W10
	.byte		N12   , Bn4 , v044
	.byte	W12
	.byte	W12
	.byte	FINE

@******************************************************@

	.align	2

seq_317:
	.byte	7	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_317_pri	@ Priority
	.byte	seq_317_rev	@ Reverb

	.word	seq_317_grp

	.word	seq_317_0
	.word	seq_317_1
	.word	seq_317_2
	.word	seq_317_3
	.word	seq_317_4
	.word	seq_317_5
	.word	seq_317_6

	.end