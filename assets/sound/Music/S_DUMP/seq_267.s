@ File generated by m4a2s Song-Module
	.include "MPlayDef.s"

	.equ	seq_267_grp, bank_012
	.equ	seq_267_pri, 1
	.equ	seq_267_rev, 178
	.equ	seq_267_mvl, 127
	.equ	seq_267_key, 0

	.section .rodata
	.global	seq_267
	.align	2

@*********************** Track 01 ***********************@

seq_267_0:
	.byte	KEYSH , seq_267_key+0
	.byte	TEMPO , 116/2
	.byte		VOICE , 1
	.byte		LFOS  , 44
	.byte		VOL   , 87*seq_267_mvl/mxv
	.byte		PAN   , c_v+4
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		VOL   , 96*seq_267_mvl/mxv
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W84
	.byte		N06   , En3 , v064
	.byte	W12
	.byte	W60
	.byte		        Gn3 
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	W12
	.byte		        An3 
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte		N18   , En3 
	.byte	W24
	.byte	GOTO
	 .word	seq_267_0 + 0x2
	.byte	FINE

@*********************** Track 02 ***********************@

seq_267_1:
	.byte		VOL   , 100*seq_267_mvl/mxv
	.byte	KEYSH , seq_267_key+0
	.byte		VOICE , 1
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte	W96
	.byte	W84
	.byte		N06   , Fs4 , v064
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N06
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		N24   , An4 
	.byte	W24
	.byte		N06   , Dn5 
	.byte	W12
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N06
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N24   , Gn4 
	.byte	W24
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N06
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Gn4 
	.byte	W24
	.byte		        Bn3 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		        En4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N03
	.byte	W03
	.byte		        Bn4 
	.byte	W03
	.byte		N06   , An4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		N24   , An4 
	.byte	W24
	.byte		N06   , Dn5 
	.byte	W12
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N03
	.byte	W03
	.byte		        An4 
	.byte	W03
	.byte		N06   , Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N24   , Gn4 
	.byte	W24
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		N06
	.byte	W12
	.byte		N03
	.byte	W03
	.byte		        Gn4 
	.byte	W03
	.byte		N06   , Fs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		N06
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		N03   , Cs5 
	.byte	W03
	.byte		        Dn5 
	.byte	W03
	.byte		N06   , Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        En5 
	.byte	W24
	.byte	W12
	.byte		N12   , Bn4 
	.byte	W12
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W24
	.byte		        Bn4 
	.byte	W12
	.byte		        En4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		N48   , Cs5 
	.byte	W36
	.byte		N06   , En3 
	.byte	W12
	.byte	W12
	.byte		N12   , Bn4 
	.byte	W12
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		        Gn3 
	.byte		N06   , Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        Gn3 
	.byte		N06   , Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W24
	.byte		        Bn4 
	.byte	W12
	.byte		N03   , Cs5 
	.byte	W03
	.byte		        Dn5 
	.byte	W03
	.byte		N06   , Bn4 
	.byte	W06
	.byte		N48   , An4 
	.byte	W48
	.byte	W12
	.byte		N12   , Bn4 
	.byte	W12
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		N03   , Bn4 
	.byte	W03
	.byte		        Cs5 
	.byte	W03
	.byte		N06   , Bn4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		N48   , En5 
	.byte	W48
	.byte	W12
	.byte		N12   , Bn4 
	.byte	W12
	.byte		N06   , Cs5 
	.byte	W12
	.byte		        Dn5 
	.byte	W12
	.byte		        En5 
	.byte	W12
	.byte		N03   , Dn5 
	.byte	W03
	.byte		        En5 
	.byte	W03
	.byte		N06   , Dn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W12
	.byte		        Bn4 
	.byte	W12
	.byte		        Cs5 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		N06
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		N18   , En5 
	.byte	W24
	.byte	GOTO
	 .word	seq_267_1 + 0x4
	.byte	FINE

@*********************** Track 03 ***********************@

seq_267_2:
	.byte		VOL   , 100*seq_267_mvl/mxv
	.byte	KEYSH , seq_267_key+0
	.byte		VOICE , 1
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		N06   , Dn2 , v064
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		N06   , Dn2 , v064
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_2 + 0x20
	.byte		N06   , En2 , v064
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte	PEND
	.byte		N06   , Bn1 , v064
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte	PEND
	.byte		N06   , Gn1 , v064
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Bn2 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        Cs3 
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_2 + 0x20
	.byte	PATT
	 .word	seq_267_2 + 0x38
	.byte	PATT
	 .word	seq_267_2 + 0x4B
	.byte	PATT
	 .word	seq_267_2 + 0x5E
	.byte		N06   , Gn2 , v064
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte	PEND
	.byte		N06   , An2 , v064
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte	PEND
	.byte		N06   , Gn2 , v064
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte	PEND
	.byte		        An2 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte	PATT
	 .word	seq_267_2 + 0x85
	.byte	PATT
	 .word	seq_267_2 + 0x98
	.byte	PATT
	 .word	seq_267_2 + 0xAB
	.byte		N06   , An2 , v064
	.byte	W24
	.byte		        En2 
	.byte	W24
	.byte		        An2 
	.byte	W24
	.byte		N12   , An1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte	GOTO
	 .word	seq_267_2 + 0x4
	.byte	FINE

@*********************** Track 04 ***********************@

seq_267_3:
	.byte		VOL   , 100*seq_267_mvl/mxv
	.byte	KEYSH , seq_267_key+0
	.byte		VOICE , 1
	.byte		LFOS  , 44
	.byte		BENDR , 12
	.byte	W12
	.byte		N06   , Fs3 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	W12
	.byte		N06   , Fs3 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_3 + 0x15
	.byte	W12
	.byte		N06   , Gn3 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_3 + 0x15
	.byte	W12
	.byte		N06   , Gn3 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		        An3 
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_3 + 0x15
	.byte	PATT
	 .word	seq_267_3 + 0x26
	.byte	PATT
	 .word	seq_267_3 + 0x15
	.byte	PATT
	 .word	seq_267_3 + 0x37
	.byte	W12
	.byte		N06   , Dn4 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N06   , Cs4 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N06   , Bn3 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte	PEND
	.byte	PATT
	 .word	seq_267_3 + 0x63
	.byte	PATT
	 .word	seq_267_3 + 0x57
	.byte	PATT
	 .word	seq_267_3 + 0x63
	.byte	PATT
	 .word	seq_267_3 + 0x6F
	.byte	W12
	.byte		N06   , Cs4 , v064
	.byte	W24
	.byte		N06
	.byte	W24
	.byte		N06
	.byte	W12
	.byte		N18   , An3 
	.byte	W24
	.byte	GOTO
	 .word	seq_267_3 + 0x4
	.byte	FINE

@******************************************************@

	.align	2

seq_267:
	.byte	4	@ NumTrks
	.byte	0	@ NumBlks
	.byte	seq_267_pri	@ Priority
	.byte	seq_267_rev	@ Reverb

	.word	seq_267_grp

	.word	seq_267_0
	.word	seq_267_1
	.word	seq_267_2
	.word	seq_267_3

	.end