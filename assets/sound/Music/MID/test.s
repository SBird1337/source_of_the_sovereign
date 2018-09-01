        .include "MPlayDef.s"

        .equ    test_grp, voicegroup000
        .equ    test_pri, 0
        .equ    test_rev, 0
        .equ    test_key, 0

        .section .rodata
        .global test
        .align  2

@****************** Track 0 (Midi-Chn.0) ******************@

test_0:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte   TEMPO , 86/2
        .byte           PAN   , c_v+21
        .byte           VOL   , 100
        .byte           BENDR , 12
        .byte           VOICE , 68
        .byte   W96
@ 001   ----------------------------------------
        .byte   W96
@ 002   ----------------------------------------
        .byte   W96
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
        .byte   W96
@ 005   ----------------------------------------
        .byte   W96
@ 006   ----------------------------------------
        .byte   W96
@ 007   ----------------------------------------
        .byte   W96
@ 008   ----------------------------------------
        .byte   W96
@ 009   ----------------------------------------
        .byte   W96
@ 010   ----------------------------------------
        .byte   W96
@ 011   ----------------------------------------
        .byte   W96
@ 012   ----------------------------------------
        .byte   W96
@ 013   ----------------------------------------
test_0_13:
        .byte   W72
        .byte           N12   , Bn2 , v122
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte   PEND
@ 014   ----------------------------------------
test_0_14:
        .byte           N24   , En3 , v122
        .byte   W24
        .byte           N36   , Bn3
        .byte   W36
        .byte           N06   , Dn4
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte           N12   , An3
        .byte   W12
        .byte                   Gn3
        .byte   W12
        .byte   PEND
@ 015   ----------------------------------------
        .byte           N96   , Fs3
        .byte   W96
@ 016   ----------------------------------------
test_0_16:
        .byte           N24   , En3 , v122
        .byte   W24
        .byte           N36   , Bn3
        .byte   W36
        .byte           N06   , Dn4
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte           N12   , An3
        .byte   W12
        .byte                   Bn3
        .byte   W12
        .byte   PEND
@ 017   ----------------------------------------
test_0_17:
        .byte           N48   , Fs3 , v122
        .byte   W48
        .byte           N24   , Gn3
        .byte   W24
        .byte           N12   , Cn4
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte   PEND
@ 018   ----------------------------------------
test_0_18:
        .byte           N36   , En4 , v126
        .byte   W36
        .byte           N12   , Gn4
        .byte   W12
        .byte           N10   , Fs4
        .byte   W12
        .byte           N03   , Fs4 , v127
        .byte   W03
        .byte                   Gn4 , v094
        .byte   W03
        .byte           N06   , Fs4 , v119
        .byte   W06
        .byte           N12   , En4 , v126
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte   PEND
@ 019   ----------------------------------------
test_0_19:
        .byte           N24   , En4 , v126
        .byte   W24
        .byte           N48   , Bn3
        .byte   W48
        .byte           N12   , Cn4
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte   PEND
@ 020   ----------------------------------------
        .byte   PATT
         .word  test_0_18
@ 021   ----------------------------------------
test_0_21:
        .byte           N44   , En4 , v126 , gtp2
        .byte   W48
        .byte           N48
        .byte   W48
        .byte   PEND
@ 022   ----------------------------------------
        .byte   W96
@ 023   ----------------------------------------
        .byte   W96
@ 024   ----------------------------------------
        .byte   W96
@ 025   ----------------------------------------
        .byte   W96
@ 026   ----------------------------------------
test_0_LOOP:
        .byte   W96
@ 027   ----------------------------------------
        .byte   W96
@ 028   ----------------------------------------
        .byte   W96
@ 029   ----------------------------------------
        .byte   W96
@ 030   ----------------------------------------
        .byte   W96
@ 031   ----------------------------------------
        .byte   W96
@ 032   ----------------------------------------
        .byte   W96
@ 033   ----------------------------------------
        .byte   W96
@ 034   ----------------------------------------
        .byte   W96
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_0_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_0_14
@ 037   ----------------------------------------
        .byte           N96   , Fs3 , v122
        .byte   W96
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_0_16
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_0_17
@ 040   ----------------------------------------
        .byte   PATT
         .word  test_0_18
@ 041   ----------------------------------------
        .byte   PATT
         .word  test_0_19
@ 042   ----------------------------------------
        .byte   PATT
         .word  test_0_18
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_0_21
@ 044   ----------------------------------------
        .byte   W96
@ 045   ----------------------------------------
        .byte   W96
@ 046   ----------------------------------------
        .byte   W96
@ 047   ----------------------------------------
        .byte   W96
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_0_LOOP
        .byte   FINE

@****************** Track 1 (Midi-Chn.1) ******************@

test_1:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v+18
        .byte           VOL   , 127
        .byte           BENDR , 12
        .byte           VOICE , 33
        .byte   W96
@ 001   ----------------------------------------
        .byte   W96
@ 002   ----------------------------------------
        .byte   W96
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
test_1_4:
        .byte           N03   , En1 , v088
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte   PEND
@ 005   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 006   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 007   ----------------------------------------
test_1_7:
        .byte           N03   , Bn0 , v088
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W06
        .byte                   Fs1 , v073
        .byte   W06
        .byte                   Bn0 , v088
        .byte   W06
        .byte                   Fs1 , v072
        .byte   W06
        .byte   PEND
@ 008   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 009   ----------------------------------------
test_1_9:
        .byte           N03   , Cn1 , v088
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte   PEND
@ 010   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 011   ----------------------------------------
        .byte   PATT
         .word  test_1_7
@ 012   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 013   ----------------------------------------
test_1_13:
        .byte           N03   , Cn1 , v088
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Fn1
        .byte   W06
        .byte                   Cn2 , v072
        .byte   W06
        .byte                   Fn1 , v088
        .byte   W06
        .byte                   Cn2 , v072
        .byte   W06
        .byte                   Fn1 , v088
        .byte   W06
        .byte                   Cn2 , v072
        .byte   W06
        .byte                   Fn1 , v088
        .byte   W06
        .byte                   Cn2 , v072
        .byte   W06
        .byte   PEND
@ 014   ----------------------------------------
test_1_14:
        .byte           N24   , Gn1 , v116
        .byte   W24
        .byte                   Dn2
        .byte   W24
        .byte                   Fs1
        .byte   W24
        .byte                   Bn1
        .byte   W24
        .byte   PEND
@ 015   ----------------------------------------
test_1_15:
        .byte           N12   , En1 , v116
        .byte   W12
        .byte                   Bn1
        .byte   W12
        .byte                   Fs1
        .byte   W12
        .byte                   Bn1
        .byte   W12
        .byte                   Gn1
        .byte   W12
        .byte                   Dn2
        .byte   W12
        .byte                   Fs1
        .byte   W12
        .byte                   Bn1
        .byte   W12
        .byte   PEND
@ 016   ----------------------------------------
        .byte   PATT
         .word  test_1_14
@ 017   ----------------------------------------
test_1_17:
        .byte           N24   , En1 , v116
        .byte   W24
        .byte                   En1
        .byte   W24
        .byte                   Dn1
        .byte   W24
        .byte                   Dn1
        .byte   W24
        .byte   PEND
@ 018   ----------------------------------------
test_1_18:
        .byte           N48   , Cn1 , v116
        .byte   W48
        .byte           N36   , Dn1
        .byte   W36
        .byte           N06   , En1
        .byte   W06
        .byte                   Dn1
        .byte   W06
        .byte   PEND
@ 019   ----------------------------------------
test_1_19:
        .byte           N48   , En1 , v116
        .byte   W48
        .byte           N36   , An0
        .byte   W36
        .byte           N06   , En1
        .byte   W06
        .byte                   Dn1
        .byte   W06
        .byte   PEND
@ 020   ----------------------------------------
        .byte   PATT
         .word  test_1_18
@ 021   ----------------------------------------
test_1_21:
        .byte           N84   , En1 , v116
        .byte   W84
        .byte           N06
        .byte   W06
        .byte                   Dn1
        .byte   W06
        .byte   PEND
@ 022   ----------------------------------------
test_1_22:
        .byte           N48   , En1 , v116
        .byte   W48
        .byte           N36   , Fs1
        .byte   W36
        .byte           N06   , Gs1
        .byte   W06
        .byte                   Fs1
        .byte   W06
        .byte   PEND
@ 023   ----------------------------------------
test_1_23:
        .byte           N48   , Gs1 , v116
        .byte   W48
        .byte           N36   , Cs1
        .byte   W36
        .byte           N06   , Gs1
        .byte   W06
        .byte                   Fs1
        .byte   W06
        .byte   PEND
@ 024   ----------------------------------------
        .byte   PATT
         .word  test_1_22
@ 025   ----------------------------------------
        .byte           N84   , Gs1 , v116
        .byte   W84
        .byte           N06
        .byte   W06
        .byte                   Fs1
        .byte   W06
@ 026   ----------------------------------------
test_1_LOOP:
        .byte           N03   , En1 , v088
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_1_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_1_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_1_7
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_1_4
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_1_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_1_14
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_1_15
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_1_14
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_1_17
@ 040   ----------------------------------------
        .byte   PATT
         .word  test_1_18
@ 041   ----------------------------------------
        .byte   PATT
         .word  test_1_19
@ 042   ----------------------------------------
        .byte   PATT
         .word  test_1_18
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_1_21
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_1_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_1_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_1_22
@ 047   ----------------------------------------
        .byte           N84   , Gs1 , v116
        .byte   W84
        .byte           N06
        .byte   W06
        .byte           N05   , Fs1
        .byte   W06
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_1_LOOP
        .byte   FINE

@****************** Track 2 (Midi-Chn.2) ******************@

test_2:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v-23
        .byte           VOL   , 103
        .byte           BENDR , 12
        .byte           VOICE , 56
        .byte   W96
@ 001   ----------------------------------------
        .byte   W96
@ 002   ----------------------------------------
        .byte   W96
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
        .byte   W96
@ 005   ----------------------------------------
test_2_5:
        .byte   W72
        .byte           N24   , Fs3 , v122
        .byte   W24
        .byte   PEND
@ 006   ----------------------------------------
test_2_6:
        .byte           N32   , En3 , v122 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte                   Fs3
        .byte   W06
        .byte           N12   , Gn3
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte                   En3
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte   PEND
@ 007   ----------------------------------------
test_2_7:
        .byte           N80   , Bn2 , v122 , gtp2
        .byte   W84
        .byte           N06
        .byte   W06
        .byte                   Dn3
        .byte   W06
        .byte   PEND
@ 008   ----------------------------------------
test_2_8:
        .byte           N32   , En3 , v122 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte                   Fs3
        .byte   W06
        .byte           N12   , Gn3
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte                   En3
        .byte   W12
        .byte                   Bn3
        .byte   W12
        .byte   PEND
@ 009   ----------------------------------------
test_2_9:
        .byte           N48   , An3 , v122
        .byte   W48
        .byte           N44   , En3 , v122 , gtp2
        .byte   W48
        .byte   PEND
@ 010   ----------------------------------------
test_2_10:
        .byte           N24   , En3 , v122
        .byte   W24
        .byte           N36   , Bn2
        .byte   W36
        .byte           N12   , Dn3
        .byte   W12
        .byte                   Gn3
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte   PEND
@ 011   ----------------------------------------
test_2_11:
        .byte           N48   , Dn3 , v122
        .byte   W48
        .byte           N44   , En3 , v122 , gtp2
        .byte   W48
        .byte   PEND
@ 012   ----------------------------------------
test_2_12:
        .byte           N24   , En3 , v122
        .byte   W24
        .byte           N36   , Bn2
        .byte   W36
        .byte           N12   , Dn3
        .byte   W12
        .byte           N06   , Bn3
        .byte   W06
        .byte                   An3
        .byte   W06
        .byte                   Gn3
        .byte   W06
        .byte                   Fs3
        .byte   W06
        .byte   PEND
@ 013   ----------------------------------------
test_2_13:
        .byte           N48   , En3 , v122
        .byte   W48
        .byte                   An3
        .byte   W48
        .byte   PEND
@ 014   ----------------------------------------
        .byte   W96
@ 015   ----------------------------------------
        .byte   W96
@ 016   ----------------------------------------
        .byte   W96
@ 017   ----------------------------------------
        .byte   W96
@ 018   ----------------------------------------
        .byte   W96
@ 019   ----------------------------------------
        .byte   W96
@ 020   ----------------------------------------
        .byte   W96
@ 021   ----------------------------------------
        .byte   W96
@ 022   ----------------------------------------
        .byte   W96
@ 023   ----------------------------------------
        .byte   W96
@ 024   ----------------------------------------
        .byte   W96
@ 025   ----------------------------------------
        .byte   W96
@ 026   ----------------------------------------
test_2_LOOP:
        .byte   W96
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_2_5
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_2_6
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_2_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_2_8
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_2_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_2_10
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_2_11
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_2_12
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_2_13
@ 036   ----------------------------------------
        .byte   W96
@ 037   ----------------------------------------
        .byte   W96
@ 038   ----------------------------------------
        .byte   W96
@ 039   ----------------------------------------
        .byte   W96
@ 040   ----------------------------------------
        .byte   W96
@ 041   ----------------------------------------
        .byte   W96
@ 042   ----------------------------------------
        .byte   W96
@ 043   ----------------------------------------
        .byte   W96
@ 044   ----------------------------------------
        .byte   W96
@ 045   ----------------------------------------
        .byte   W96
@ 046   ----------------------------------------
        .byte   W96
@ 047   ----------------------------------------
        .byte   W96
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_2_LOOP
        .byte   FINE

@****************** Track 3 (Midi-Chn.3) ******************@

test_3:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           VOL   , 95
        .byte           BENDR , 12
        .byte           VOICE , 47
        .byte           N24   , Cn2 , v106
        .byte   W24
        .byte                   Cn2
        .byte   W24
        .byte           N06   , Cn2 , v102
        .byte   W06
        .byte                   Cn2 , v039
        .byte   W06
        .byte                   Cn2 , v060
        .byte   W06
        .byte                   Cn2 , v077
        .byte   W06
        .byte                   Cn2 , v089
        .byte   W06
        .byte                   Cn2 , v102
        .byte   W06
        .byte                   Cn2 , v112
        .byte   W06
        .byte                   Cn2 , v119
        .byte   W06
@ 001   ----------------------------------------
        .byte           N24   , Cn2 , v106
        .byte   W96
@ 002   ----------------------------------------
        .byte   W96
@ 003   ----------------------------------------
test_3_3:
        .byte   W48
        .byte           N06   , Cn2 , v020
        .byte   W06
        .byte                   Cn2 , v039
        .byte   W06
        .byte                   Cn2 , v060
        .byte   W06
        .byte                   Cn2 , v077
        .byte   W06
        .byte                   Cn2 , v089
        .byte   W06
        .byte                   Cn2 , v102
        .byte   W06
        .byte                   Cn2 , v112
        .byte   W06
        .byte                   Cn2 , v119
        .byte   W06
        .byte   PEND
@ 004   ----------------------------------------
        .byte           N24   , Cn2 , v106
        .byte   W96
@ 005   ----------------------------------------
        .byte   W96
@ 006   ----------------------------------------
        .byte   W96
@ 007   ----------------------------------------
        .byte   W96
@ 008   ----------------------------------------
        .byte   W96
@ 009   ----------------------------------------
        .byte   W96
@ 010   ----------------------------------------
        .byte   W96
@ 011   ----------------------------------------
        .byte   W96
@ 012   ----------------------------------------
        .byte   W96
@ 013   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 014   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 015   ----------------------------------------
test_3_15:
        .byte   W72
        .byte           N12   , Cn2 , v107
        .byte   W12
        .byte           N06   , Cn2 , v093
        .byte   W06
        .byte                   Cn2 , v082
        .byte   W06
        .byte   PEND
@ 016   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 017   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 018   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 019   ----------------------------------------
        .byte   W96
@ 020   ----------------------------------------
        .byte   W96
@ 021   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 022   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 023   ----------------------------------------
        .byte   W96
@ 024   ----------------------------------------
        .byte   W96
@ 025   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 026   ----------------------------------------
test_3_LOOP:
        .byte           N24   , Cn2 , v106
        .byte   W96
@ 027   ----------------------------------------
        .byte   W96
@ 028   ----------------------------------------
        .byte   W96
@ 029   ----------------------------------------
        .byte   W96
@ 030   ----------------------------------------
        .byte   W96
@ 031   ----------------------------------------
        .byte   W96
@ 032   ----------------------------------------
        .byte   W96
@ 033   ----------------------------------------
        .byte   W96
@ 034   ----------------------------------------
        .byte   W96
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 036   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_3_15
@ 038   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 040   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 041   ----------------------------------------
        .byte   W96
@ 042   ----------------------------------------
        .byte   W96
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_3_3
@ 044   ----------------------------------------
        .byte           N24   , Cn2 , v122
        .byte   W96
@ 045   ----------------------------------------
        .byte   W96
@ 046   ----------------------------------------
        .byte   W96
@ 047   ----------------------------------------
        .byte   W48
        .byte           N06   , Cn2 , v020
        .byte   W06
        .byte                   Cn2 , v039
        .byte   W06
        .byte                   Cn2 , v060
        .byte   W06
        .byte                   Cn2 , v077
        .byte   W06
        .byte                   Cn2 , v089
        .byte   W06
        .byte                   Cn2 , v102
        .byte   W06
        .byte                   Cn2 , v112
        .byte   W06
        .byte           N05   , Cn2 , v119
        .byte   W06
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_3_LOOP
        .byte   FINE

@****************** Track 4 (Midi-Chn.4) ******************@

test_4:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           VOL   , 113
        .byte           BENDR , 12
        .byte           VOICE , 127
        .byte           N48   , En2 , v098
        .byte           N24   , En1 , v122
        .byte   W24
        .byte           N12
        .byte   W12
        .byte           N06   , En1 , v106
        .byte   W06
        .byte                   En1 , v083
        .byte   W06
        .byte                   En1 , v121
        .byte   W06
        .byte                   En1 , v038
        .byte   W06
        .byte                   En1 , v060
        .byte   W06
        .byte                   En1 , v077
        .byte   W06
        .byte                   En1 , v089
        .byte   W06
        .byte                   En1 , v102
        .byte   W06
        .byte                   En1 , v112
        .byte   W06
        .byte                   En1 , v119
        .byte   W06
@ 001   ----------------------------------------
        .byte           N24   , En2 , v098
        .byte           N24   , En1 , v111
        .byte   W24
        .byte                   Fs2 , v098
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N06   , En1 , v088
        .byte   W06
        .byte                   En1 , v072
        .byte   W06
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N03   , En1 , v099
        .byte   W03
        .byte                   En1 , v096
        .byte   W03
        .byte           N06   , En1 , v080
        .byte   W06
        .byte           N24   , Fs2 , v098
        .byte           N12   , En1 , v103
        .byte   W12
        .byte                   En1 , v087
        .byte   W12
@ 002   ----------------------------------------
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , En1 , v087
        .byte   W06
        .byte           N24   , Fs2 , v098
        .byte           N12   , En1 , v102
        .byte   W12
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   En1
        .byte   W06
        .byte                   En1 , v103
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03   , En1 , v074
        .byte   W03
        .byte                   En1
        .byte   W03
        .byte           N06   , En1 , v083
        .byte   W06
        .byte           N24   , Fs2 , v098
        .byte           N12   , En1 , v102
        .byte   W12
        .byte                   En1 , v088
        .byte   W12
@ 003   ----------------------------------------
        .byte           N24   , En2 , v098
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , En1 , v087
        .byte   W06
        .byte           N12   , En1 , v102
        .byte           N24   , Fs2 , v098
        .byte   W12
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   En1
        .byte   W06
        .byte                   En1 , v103
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03   , En1 , v074
        .byte   W03
        .byte                   En1
        .byte   W03
        .byte           N06   , En1 , v083
        .byte   W06
        .byte           N24   , Fs2 , v098
        .byte           N12   , En1 , v102
        .byte   W12
        .byte                   En1 , v088
        .byte   W12
@ 004   ----------------------------------------
        .byte                   En2 , v098
        .byte   W12
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v083
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v080
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
@ 005   ----------------------------------------
test_4_5:
        .byte           N06   , Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v082
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v083
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v079
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v080
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte   PEND
@ 006   ----------------------------------------
test_4_6:
        .byte           N06   , Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v080
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v083
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte   W06
        .byte                   Fs2 , v072
        .byte   W06
        .byte   PEND
@ 007   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 008   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 009   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 010   ----------------------------------------
test_4_10:
        .byte           N12   , En2 , v098
        .byte           N24   , En1 , v111
        .byte   W12
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2
        .byte   W06
        .byte                   Fs2 , v094
        .byte           N12   , En1 , v104
        .byte   W06
        .byte           N06   , Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte           N06   , En1 , v088
        .byte   W06
        .byte                   Fs2 , v073
        .byte           N06   , En1 , v072
        .byte   W06
        .byte                   Fs2 , v094
        .byte           N12   , En1 , v104
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v083
        .byte           N03   , En1 , v099
        .byte   W03
        .byte                   En1 , v096
        .byte   W03
        .byte           N06   , Fs2 , v074
        .byte           N06   , En1 , v080
        .byte   W06
        .byte                   Fs2 , v096
        .byte           N12   , En1 , v103
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v080
        .byte           N12   , En1 , v087
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte   PEND
@ 011   ----------------------------------------
test_4_11:
        .byte           N06   , Fs2 , v096
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   Fs2 , v074
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   Fs2 , v082
        .byte           N03   , En1 , v087
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , Fs2
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   Fs2 , v094
        .byte           N12   , En1 , v102
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v083
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   Fs2 , v074
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   Fs2 , v096
        .byte           N06   , En1 , v103
        .byte   W06
        .byte                   Fs2 , v074
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   Fs2 , v079
        .byte           N03   , En1 , v074
        .byte   W03
        .byte                   En1
        .byte   W03
        .byte           N06   , Fs2
        .byte           N06   , En1 , v083
        .byte   W06
        .byte                   Fs2 , v094
        .byte           N12   , En1 , v102
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v080
        .byte           N12   , En1 , v088
        .byte   W06
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte   PEND
@ 012   ----------------------------------------
test_4_12:
        .byte           N06   , Fs2 , v094
        .byte           N24   , En1 , v111
        .byte   W06
        .byte           N06   , Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v080
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v096
        .byte           N12   , En1 , v104
        .byte   W06
        .byte           N06   , Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v083
        .byte           N06   , En1 , v088
        .byte   W06
        .byte                   Fs2 , v074
        .byte           N06   , En1 , v072
        .byte   W06
        .byte                   Fs2 , v096
        .byte           N12   , En1 , v104
        .byte   W06
        .byte           N06   , Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte           N03   , En1 , v099
        .byte   W03
        .byte                   En1 , v096
        .byte   W03
        .byte           N06   , Fs2 , v073
        .byte           N06   , En1 , v080
        .byte   W06
        .byte                   Fs2 , v094
        .byte           N12   , En1 , v103
        .byte   W06
        .byte           N06   , Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte           N12   , En1 , v087
        .byte   W06
        .byte           N06   , Fs2 , v072
        .byte   W06
        .byte   PEND
@ 013   ----------------------------------------
        .byte   PATT
         .word  test_4_11
@ 014   ----------------------------------------
test_4_14:
        .byte           N48   , En2 , v098
        .byte   W24
        .byte           N24   , Fs2 , v097
        .byte   W48
        .byte                   Fs2
        .byte   W24
        .byte   PEND
@ 015   ----------------------------------------
test_4_15:
        .byte   W24
        .byte           N24   , Fs2 , v097
        .byte   W48
        .byte                   Fs2
        .byte   W24
        .byte   PEND
@ 016   ----------------------------------------
        .byte   PATT
         .word  test_4_15
@ 017   ----------------------------------------
        .byte   PATT
         .word  test_4_15
@ 018   ----------------------------------------
        .byte           N48   , En2 , v098
        .byte   W96
@ 019   ----------------------------------------
        .byte   W96
@ 020   ----------------------------------------
        .byte   W96
@ 021   ----------------------------------------
        .byte   W96
@ 022   ----------------------------------------
test_4_22:
        .byte           N24   , En1 , v111
        .byte           N48   , En2 , v098
        .byte   W24
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N06   , En1 , v088
        .byte   W06
        .byte                   En1 , v072
        .byte   W06
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N03   , En1 , v099
        .byte   W03
        .byte                   En1 , v096
        .byte   W03
        .byte           N06   , En1 , v080
        .byte   W06
        .byte           N12   , En1 , v103
        .byte   W12
        .byte                   En1 , v087
        .byte   W12
        .byte   PEND
@ 023   ----------------------------------------
test_4_23:
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , En1 , v087
        .byte   W06
        .byte           N12   , En1 , v102
        .byte   W12
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   En1
        .byte   W06
        .byte                   En1 , v103
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03   , En1 , v074
        .byte   W03
        .byte                   En1
        .byte   W03
        .byte           N06   , En1 , v083
        .byte   W06
        .byte           N12   , En1 , v102
        .byte   W12
        .byte                   En1 , v088
        .byte   W12
        .byte   PEND
@ 024   ----------------------------------------
test_4_24:
        .byte           N24   , En1 , v111
        .byte   W24
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N06   , En1 , v088
        .byte   W06
        .byte                   En1 , v072
        .byte   W06
        .byte           N12   , En1 , v104
        .byte   W12
        .byte           N03   , En1 , v099
        .byte   W03
        .byte                   En1 , v096
        .byte   W03
        .byte           N06   , En1 , v080
        .byte   W06
        .byte           N12   , En1 , v103
        .byte   W12
        .byte                   En1 , v087
        .byte   W12
        .byte   PEND
@ 025   ----------------------------------------
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , En1 , v087
        .byte   W06
        .byte           N12   , En1 , v102
        .byte   W12
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   En1
        .byte   W06
        .byte                   En1 , v121
        .byte   W06
        .byte                   En1 , v038
        .byte   W06
        .byte                   En1 , v060
        .byte   W06
        .byte                   En1 , v077
        .byte   W06
        .byte                   En1 , v089
        .byte   W06
        .byte                   En1 , v102
        .byte   W06
        .byte                   En1 , v112
        .byte   W06
        .byte                   En1 , v119
        .byte   W06
@ 026   ----------------------------------------
test_4_LOOP:
        .byte           N12   , En2 , v098
        .byte   W12
        .byte           N06   , Fs2 , v074
        .byte   W06
        .byte                   Fs2
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v082
        .byte   W06
        .byte                   Fs2 , v073
        .byte   W06
        .byte                   Fs2 , v094
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v083
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v096
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
        .byte                   Fs2 , v080
        .byte   W06
        .byte                   Fs2 , v074
        .byte   W06
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_4_6
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_4_5
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_4_10
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_4_11
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_4_12
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_4_11
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_4_14
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_4_15
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_4_15
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_4_15
@ 040   ----------------------------------------
        .byte           N48   , En2 , v098
        .byte   W96
@ 041   ----------------------------------------
        .byte   W96
@ 042   ----------------------------------------
        .byte   W96
@ 043   ----------------------------------------
        .byte   W96
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_4_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_4_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_4_24
@ 047   ----------------------------------------
        .byte           N06   , En1 , v104
        .byte   W06
        .byte                   En1 , v087
        .byte   W06
        .byte           N03
        .byte   W03
        .byte                   En1 , v074
        .byte   W03
        .byte           N06   , En1 , v087
        .byte   W06
        .byte           N12   , En1 , v102
        .byte   W12
        .byte           N06   , En1 , v087
        .byte   W06
        .byte                   En1
        .byte   W06
        .byte                   En1 , v121
        .byte   W06
        .byte                   En1 , v038
        .byte   W06
        .byte                   En1 , v060
        .byte   W06
        .byte                   En1 , v077
        .byte   W06
        .byte                   En1 , v089
        .byte   W06
        .byte                   En1 , v102
        .byte   W06
        .byte                   En1 , v112
        .byte   W06
        .byte           N05   , En1 , v119
        .byte   W06
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_4_LOOP
        .byte   FINE

@****************** Track 5 (Midi-Chn.5) ******************@

test_5:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v-23
        .byte           VOL   , 114
        .byte           BENDR , 12
        .byte           VOICE , 0
        .byte   W96
@ 001   ----------------------------------------
        .byte   W96
@ 002   ----------------------------------------
        .byte   W96
@ 003   ----------------------------------------
        .byte   W84
        .byte           N06   , Bn3 , v094
        .byte   W06
        .byte                   Dn4
        .byte   W06
@ 004   ----------------------------------------
        .byte           N36   , En4
        .byte           N03   , En0 , v055
        .byte   W12
        .byte                   En0 , v057
        .byte   W12
        .byte                   En0
        .byte   W12
        .byte                   En0 , v058
        .byte           N06   , Gn4 , v094
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N04   , En4
        .byte           N03   , En0 , v059
        .byte   W06
        .byte           N04   , En4 , v094
        .byte   W06
        .byte                   Dn4
        .byte           N03   , En0 , v062
        .byte   W06
        .byte           N04   , Dn4 , v094
        .byte   W06
        .byte           N12   , Cn4
        .byte           N03   , En0 , v063
        .byte   W12
        .byte                   En0
        .byte           N12   , Bn3 , v094
        .byte   W12
@ 005   ----------------------------------------
test_5_5:
        .byte           N84   , Gn3 , v094
        .byte           N03   , Bn0 , v063
        .byte           N03   , En0
        .byte   W12
        .byte                   En0
        .byte           N03   , Bn0
        .byte   W12
        .byte                   Bn0
        .byte           N03   , En0
        .byte   W12
        .byte           N06   , Gn2 , v094
        .byte           N03   , Bn0 , v063
        .byte           N03   , En0
        .byte   W06
        .byte           N06   , Fs2 , v094
        .byte   W06
        .byte           N04   , En2
        .byte           N03   , Bn0 , v063
        .byte           N03   , En0
        .byte   W06
        .byte           N04   , En2 , v094
        .byte   W06
        .byte                   Dn2
        .byte           N03   , Bn0 , v063
        .byte           N03   , En0
        .byte   W06
        .byte           N04   , Dn2 , v094
        .byte   W06
        .byte           N03   , En0 , v063
        .byte           N03   , Bn0
        .byte           N12   , Cn2 , v094
        .byte   W12
        .byte           N03   , En0 , v064
        .byte           N03   , Bn0
        .byte           N12   , Gn2 , v094
        .byte   W12
        .byte   PEND
@ 006   ----------------------------------------
test_5_6:
        .byte           N03   , En1 , v078
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte   PEND
@ 007   ----------------------------------------
test_5_7:
        .byte           N03   , Bn0 , v078
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W12
        .byte                   Bn0
        .byte   W06
        .byte                   Fs1 , v063
        .byte   W06
        .byte                   Bn0 , v078
        .byte   W06
        .byte                   Fs1 , v062
        .byte   W06
        .byte   PEND
@ 008   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 009   ----------------------------------------
test_5_9:
        .byte           N03   , Cn1 , v078
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte                   An1
        .byte   W12
        .byte   PEND
@ 010   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 011   ----------------------------------------
        .byte   PATT
         .word  test_5_7
@ 012   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 013   ----------------------------------------
test_5_13:
        .byte           N03   , Cn1 , v078
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Cn1
        .byte   W12
        .byte                   Fn1
        .byte   W06
        .byte                   Cn2 , v062
        .byte   W06
        .byte                   Fn1 , v078
        .byte   W06
        .byte                   Cn2 , v062
        .byte   W06
        .byte                   Fn1 , v078
        .byte   W06
        .byte                   Cn2 , v062
        .byte   W06
        .byte                   Fn1 , v078
        .byte   W06
        .byte                   Cn2 , v062
        .byte   W06
        .byte   PEND
@ 014   ----------------------------------------
test_5_14:
        .byte           N09   , Gn3 , v101
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte                   Bn2
        .byte   W12
        .byte                   Gn2
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte                   Bn2
        .byte   W12
        .byte                   Fs2
        .byte   W12
        .byte   PEND
@ 015   ----------------------------------------
test_5_15:
        .byte           N09   , En2 , v101
        .byte   W12
        .byte                   Gn2
        .byte   W12
        .byte                   Fs2
        .byte   W12
        .byte                   An2
        .byte   W12
        .byte                   Gn2
        .byte   W12
        .byte                   Bn2
        .byte   W12
        .byte                   An2
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte   PEND
@ 016   ----------------------------------------
        .byte   PATT
         .word  test_5_14
@ 017   ----------------------------------------
test_5_17:
        .byte           N09   , En2 , v101
        .byte   W12
        .byte                   Gn2
        .byte   W12
        .byte                   Fs2
        .byte   W12
        .byte                   An2
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte                   Bn2
        .byte   W12
        .byte                   An2
        .byte   W12
        .byte                   Gn2
        .byte   W12
        .byte   PEND
@ 018   ----------------------------------------
        .byte   W96
@ 019   ----------------------------------------
        .byte   W96
@ 020   ----------------------------------------
        .byte   W96
@ 021   ----------------------------------------
        .byte   W96
@ 022   ----------------------------------------
test_5_22:
        .byte           N24   , Gs3 , v121
        .byte   W24
        .byte                   Bn3 , v119
        .byte   W24
        .byte                   As3
        .byte   W24
        .byte                   Fs3
        .byte   W24
        .byte   PEND
@ 023   ----------------------------------------
test_5_23:
        .byte           N24   , Gs3 , v119
        .byte   W24
        .byte                   Bn3
        .byte   W24
        .byte                   As3
        .byte   W24
        .byte           N12   , En3
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte   PEND
@ 024   ----------------------------------------
test_5_24:
        .byte           N24   , Gs3 , v119
        .byte   W24
        .byte                   Bn3
        .byte   W24
        .byte                   As3
        .byte   W24
        .byte                   Fs3
        .byte   W24
        .byte   PEND
@ 025   ----------------------------------------
        .byte           N06   , Cs4
        .byte   W06
        .byte                   As3 , v107
        .byte   W06
        .byte                   Gs3 , v106
        .byte   W06
        .byte                   Cs3 , v104
        .byte   W06
        .byte                   Cs4 , v119
        .byte   W06
        .byte                   As3 , v107
        .byte   W06
        .byte                   Gs3
        .byte   W06
        .byte                   Cs3 , v106
        .byte   W06
        .byte                   Ds4 , v119
        .byte   W06
        .byte                   Bn3 , v107
        .byte   W06
        .byte                   Ds3
        .byte   W06
        .byte                   Bn2
        .byte   W06
        .byte                   Ds4 , v119
        .byte   W06
        .byte                   Bn3 , v106
        .byte   W06
        .byte                   Ds3
        .byte   W06
        .byte                   Bn2
        .byte   W06
@ 026   ----------------------------------------
test_5_LOOP:
        .byte           N36   , En4 , v094
        .byte           N03   , En0 , v055
        .byte   W12
        .byte                   En0 , v057
        .byte   W12
        .byte                   En0
        .byte   W12
        .byte                   En0 , v058
        .byte           N06   , Gn4 , v094
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N04   , En4
        .byte           N03   , En0 , v059
        .byte   W06
        .byte           N04   , En4 , v094
        .byte   W06
        .byte                   Dn4
        .byte           N03   , En0 , v062
        .byte   W06
        .byte           N04   , Dn4 , v094
        .byte   W06
        .byte           N12   , Cn4
        .byte           N03   , En0 , v063
        .byte   W12
        .byte                   En0
        .byte           N12   , Bn3 , v094
        .byte   W12
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_5_5
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_5_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_5_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_5_7
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_5_6
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_5_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_5_14
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_5_15
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_5_14
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_5_17
@ 040   ----------------------------------------
        .byte   W96
@ 041   ----------------------------------------
        .byte   W96
@ 042   ----------------------------------------
        .byte   W96
@ 043   ----------------------------------------
        .byte   W96
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_5_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_5_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_5_24
@ 047   ----------------------------------------
        .byte           N06   , Cs4 , v119
        .byte   W06
        .byte                   As3 , v107
        .byte   W06
        .byte                   Gs3 , v106
        .byte   W06
        .byte                   Cs3 , v104
        .byte   W06
        .byte                   Cs4 , v119
        .byte   W06
        .byte                   As3 , v107
        .byte   W06
        .byte                   Gs3
        .byte   W06
        .byte                   Cs3 , v106
        .byte   W06
        .byte                   Ds4 , v119
        .byte   W06
        .byte                   Bn3 , v107
        .byte   W06
        .byte                   Ds3
        .byte   W06
        .byte                   Bn2
        .byte   W06
        .byte                   Ds4 , v119
        .byte   W06
        .byte                   Bn3 , v106
        .byte   W06
        .byte                   Ds3
        .byte   W06
        .byte           N05   , Bn2
        .byte   W06
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_5_LOOP
        .byte   FINE

@****************** Track 6 (Midi-Chn.6) ******************@

test_6:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v+19
        .byte           VOL   , 114
        .byte           BENDR , 12
        .byte           VOICE , 48
        .byte   W72
        .byte           N12   , En2 , v126
        .byte           N12   , Cn3
        .byte   W12
        .byte                   Fs2
        .byte           N12   , Dn3
        .byte   W12
@ 001   ----------------------------------------
        .byte           N36   , En3
        .byte           N36   , Gn2
        .byte   W36
        .byte           N12   , Gn3
        .byte           N12   , Gn2
        .byte   W12
        .byte           N10   , Fs2
        .byte           N10   , Fs3
        .byte   W12
        .byte           N03   , Fs2 , v127
        .byte           N03   , Fs3
        .byte   W03
        .byte                   Gn2 , v094
        .byte           N03   , Gn3
        .byte   W03
        .byte           N06   , Fs2 , v119
        .byte           N06   , Fs3
        .byte   W06
        .byte           N12   , En3 , v126
        .byte           N10   , Gn2
        .byte   W12
        .byte           N12   , En2
        .byte           N12   , Dn3
        .byte   W12
@ 002   ----------------------------------------
        .byte           N24   , Bn2
        .byte           N24   , En3
        .byte   W24
        .byte                   Bn2
        .byte           N24   , Gn2
        .byte   W24
        .byte           TIE   , En2
        .byte           TIE   , Cs3
        .byte   W48
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
        .byte           EOT   , En2
        .byte                   Cs3
        .byte   W96
@ 005   ----------------------------------------
test_6_5:
        .byte   W72
        .byte           N24   , Fs4 , v122
        .byte   W24
        .byte   PEND
@ 006   ----------------------------------------
test_6_6:
        .byte           N32   , En4 , v122 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N12   , Gn4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte                   En4
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte   PEND
@ 007   ----------------------------------------
test_6_7:
        .byte           N80   , Bn3 , v122 , gtp2
        .byte   W84
        .byte           N06
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 008   ----------------------------------------
test_6_8:
        .byte           N32   , En4 , v122 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N12   , Gn4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte                   En4
        .byte   W12
        .byte                   Bn4
        .byte   W12
        .byte   PEND
@ 009   ----------------------------------------
test_6_9:
        .byte           N48   , An4 , v122
        .byte   W48
        .byte           N44   , En4 , v122 , gtp2
        .byte   W48
        .byte   PEND
@ 010   ----------------------------------------
test_6_10:
        .byte           N24   , En4 , v122
        .byte   W24
        .byte           N36   , Bn3
        .byte   W36
        .byte           N12   , Dn4
        .byte   W12
        .byte                   Gn4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte   PEND
@ 011   ----------------------------------------
test_6_11:
        .byte           N48   , Dn4 , v122
        .byte   W48
        .byte           N44   , En4 , v122 , gtp2
        .byte   W48
        .byte   PEND
@ 012   ----------------------------------------
test_6_12:
        .byte           N24   , En4 , v122
        .byte   W24
        .byte           N36   , Bn3
        .byte   W36
        .byte           N12   , Dn4
        .byte   W12
        .byte           N06   , Bn4
        .byte   W06
        .byte                   An4
        .byte   W06
        .byte                   Gn4
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte   PEND
@ 013   ----------------------------------------
test_6_13:
        .byte           N48   , En4 , v122
        .byte   W48
        .byte                   An4
        .byte   W48
        .byte   PEND
@ 014   ----------------------------------------
test_6_14:
        .byte           N48   , Gn3 , v122
        .byte   W48
        .byte           N36   , Fs3
        .byte   W36
        .byte           N12   , Gn3
        .byte   W12
        .byte   PEND
@ 015   ----------------------------------------
test_6_15:
        .byte           N12   , Bn3 , v122
        .byte   W12
        .byte           N10   , An3
        .byte   W12
        .byte           N12
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte           N48   , An3
        .byte   W48
        .byte   PEND
@ 016   ----------------------------------------
test_6_16:
        .byte           N48   , Gn3 , v122
        .byte   W48
        .byte                   Fs3
        .byte   W48
        .byte   PEND
@ 017   ----------------------------------------
test_6_17:
        .byte           N12   , Dn3 , v122
        .byte   W12
        .byte           N10   , En3
        .byte   W12
        .byte           N12
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte           N48   , Gn3
        .byte   W48
        .byte   PEND
@ 018   ----------------------------------------
test_6_18:
        .byte           N48   , En3 , v084
        .byte           N48   , Gn3
        .byte   W48
        .byte                   An3
        .byte           N48   , Fs3
        .byte   W48
        .byte   PEND
@ 019   ----------------------------------------
test_6_19:
        .byte           N48   , Gn3 , v084
        .byte           N48   , Bn3
        .byte   W48
        .byte                   En3
        .byte           N48   , Cs3
        .byte   W48
        .byte   PEND
@ 020   ----------------------------------------
test_6_20:
        .byte           N48   , En3 , v084
        .byte           N48   , Gn3
        .byte   W48
        .byte                   Fs3
        .byte           N48   , An3
        .byte   W48
        .byte   PEND
@ 021   ----------------------------------------
test_6_21:
        .byte           N48   , An3 , v084
        .byte           N48   , Fs3
        .byte   W48
        .byte                   Bn3
        .byte           N48   , Gn3
        .byte   W48
        .byte   PEND
@ 022   ----------------------------------------
test_6_22:
        .byte           N36   , Gs3 , v126
        .byte           N48   , Gs2 , v084
        .byte           N48   , Bn2
        .byte   W36
        .byte           N12   , Bn3 , v126
        .byte   W12
        .byte           N10   , As3
        .byte           N48   , Cs3 , v084
        .byte           N48   , As2
        .byte   W12
        .byte           N03   , As3 , v127
        .byte   W03
        .byte                   Bn3 , v094
        .byte   W03
        .byte           N06   , As3 , v119
        .byte   W06
        .byte           N12   , Gs3 , v126
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte   PEND
@ 023   ----------------------------------------
test_6_23:
        .byte           N24   , Ds3 , v084
        .byte           N24   , Gs3 , v126
        .byte           N48   , Bn2 , v084
        .byte   W24
        .byte           N24   , Ds2
        .byte           N48   , Ds3 , v126
        .byte   W24
        .byte                   Gs2 , v084
        .byte           N48   , Fn2
        .byte   W24
        .byte           N12   , En3 , v126
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte   PEND
@ 024   ----------------------------------------
test_6_24:
        .byte           N36   , Gs3 , v126
        .byte           N48   , Gs2 , v084
        .byte           N48   , Bn2
        .byte   W36
        .byte           N12   , Bn3 , v126
        .byte   W12
        .byte           N10   , As3
        .byte           N48   , As2 , v084
        .byte           N48   , Cs3
        .byte   W12
        .byte           N03   , As3 , v127
        .byte   W03
        .byte                   Bn3 , v094
        .byte   W03
        .byte           N06   , As3 , v119
        .byte   W06
        .byte           N12   , Gs3 , v126
        .byte   W12
        .byte                   Fs3
        .byte   W12
        .byte   PEND
@ 025   ----------------------------------------
        .byte           N44   , As3 , v126 , gtp2
        .byte           N48   , Cs3 , v084
        .byte           N48   , As2
        .byte   W48
        .byte                   Bn3 , v126
        .byte           N48   , Ds3 , v084
        .byte           N48   , Bn2
        .byte   W48
@ 026   ----------------------------------------
test_6_LOOP:
        .byte   W96
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_6_5
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_6_6
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_6_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_6_8
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_6_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_6_10
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_6_11
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_6_12
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_6_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_6_14
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_6_15
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_6_16
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_6_17
@ 040   ----------------------------------------
        .byte   PATT
         .word  test_6_18
@ 041   ----------------------------------------
        .byte   PATT
         .word  test_6_19
@ 042   ----------------------------------------
        .byte   PATT
         .word  test_6_20
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_6_21
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_6_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_6_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_6_24
@ 047   ----------------------------------------
        .byte           N44   , As3 , v126 , gtp2
        .byte           N48   , Cs3 , v084
        .byte           N48   , As2
        .byte   W48
        .byte           N44   , Bn3 , v126 , gtp3
        .byte                   Ds3 , v084
        .byte           N44   , Bn2 , v084 , gtp3
        .byte   W48
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_6_LOOP
        .byte   FINE

@****************** Track 7 (Midi-Chn.7) ******************@

test_7:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v-21
        .byte           VOL   , 99
        .byte           BENDR , 12
        .byte           VOICE , 48
        .byte   W96
@ 001   ----------------------------------------
        .byte           N12   , Cn1 , v094
        .byte           N32   , Bn3 , v098 , gtp2
        .byte   W12
        .byte           N12   , Gn1 , v094
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   Cn1
        .byte           N10   , Bn3 , v098
        .byte   W12
        .byte           N32   , An3 , v098 , gtp2
        .byte           N12   , Dn1 , v094
        .byte   W12
        .byte                   An0
        .byte   W12
        .byte                   Fs1
        .byte   W12
        .byte                   Dn1
        .byte           N10   , An3 , v098
        .byte   W12
@ 002   ----------------------------------------
        .byte           N32   , Bn3 , v098 , gtp2
        .byte           N22   , En1 , v094
        .byte   W24
        .byte                   En1
        .byte   W12
        .byte           N10   , Bn3 , v098
        .byte   W12
        .byte           TIE   , An1 , v094
        .byte           TIE   , Cs4 , v098
        .byte   W48
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
        .byte           EOT   , An1
        .byte                   Cs4
        .byte           N03   , En1 , v094
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
@ 005   ----------------------------------------
test_7_5:
        .byte           N03   , En1 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En1
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En1
        .byte   W12
        .byte                   En1
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En1
        .byte   W12
        .byte   PEND
@ 006   ----------------------------------------
test_7_6:
        .byte           N96   , Gn3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte   PEND
@ 007   ----------------------------------------
test_7_7:
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte           N06   , En3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W06
        .byte           N06   , Fs3 , v078
        .byte   W06
        .byte           N12   , Gn3
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte           N12   , Fs3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte           N12   , En3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte           N12   , Dn3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte           N24   , Bn2 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte   PEND
@ 008   ----------------------------------------
test_7_8:
        .byte           N96   , Gn3 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte   PEND
@ 009   ----------------------------------------
test_7_9:
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W12
        .byte           N06   , En3 , v078
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W06
        .byte           N06   , Fs3 , v078
        .byte   W06
        .byte                   An3
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W06
        .byte           N06   , Gn3 , v078
        .byte   W06
        .byte           N12   , Dn3
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W12
        .byte           N48   , En3 , v078
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W12
        .byte                   Cn2
        .byte           N03   , En2
        .byte   W12
        .byte                   Cn2
        .byte           N03   , En2
        .byte   W12
        .byte                   Cn2
        .byte           N03   , En2
        .byte   W12
        .byte   PEND
@ 010   ----------------------------------------
test_7_10:
        .byte           N24   , En3 , v078
        .byte           N03   , En2 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte           N72   , Bn2 , v078
        .byte           N03   , En2 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte   PEND
@ 011   ----------------------------------------
test_7_11:
        .byte           N24   , Dn3 , v078
        .byte           N03   , Fs2 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte           N72   , Bn2 , v078
        .byte           N03   , Bn1 , v094
        .byte           N03   , Fs2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte                   Fs2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , Fs2
        .byte   W12
        .byte   PEND
@ 012   ----------------------------------------
test_7_12:
        .byte           N24   , En3 , v078
        .byte           N03   , En2 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte           N72   , Bn2 , v078
        .byte           N03   , En2 , v094
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   Bn1
        .byte           N03   , En2
        .byte   W12
        .byte                   En2
        .byte           N03   , Bn1
        .byte   W12
        .byte   PEND
@ 013   ----------------------------------------
test_7_13:
        .byte           N24   , En3 , v078
        .byte           N03   , En2 , v094
        .byte           N03   , Cn2
        .byte   W12
        .byte                   Cn2
        .byte           N03   , En2
        .byte   W12
        .byte           N24   , Bn2 , v078
        .byte           N03   , Cn2 , v094
        .byte           N03   , En2
        .byte   W12
        .byte                   Cn2
        .byte           N03   , En2
        .byte   W12
        .byte           N48   , An2 , v078
        .byte           N48   , Cn2 , v094
        .byte           N48   , Fn2
        .byte   W48
        .byte   PEND
@ 014   ----------------------------------------
test_7_14:
        .byte           N48   , Gn2 , v082
        .byte   W48
        .byte                   Fs2 , v084
        .byte   W48
        .byte   PEND
@ 015   ----------------------------------------
test_7_15:
        .byte           N48   , En2 , v084
        .byte   W48
        .byte                   Dn2
        .byte   W48
        .byte   PEND
@ 016   ----------------------------------------
test_7_16:
        .byte           N48   , Gn2 , v084
        .byte   W48
        .byte                   Fs2
        .byte   W48
        .byte   PEND
@ 017   ----------------------------------------
test_7_17:
        .byte           N48   , En2 , v084
        .byte   W48
        .byte                   Gn2
        .byte   W48
        .byte   PEND
@ 018   ----------------------------------------
test_7_18:
        .byte           N36   , Bn2 , v099
        .byte           N48   , Cn2 , v084
        .byte   W36
        .byte           N12   , Cn3 , v099
        .byte   W12
        .byte           N10   , Dn3
        .byte           N48   , Dn2 , v084
        .byte   W12
        .byte           N03   , Dn3 , v099
        .byte   W03
        .byte                   En3
        .byte   W03
        .byte           N06   , Dn3
        .byte   W06
        .byte           N12   , An2
        .byte   W12
        .byte                   Bn2
        .byte   W12
        .byte   PEND
@ 019   ----------------------------------------
test_7_19:
        .byte           N24   , Bn2 , v099
        .byte           N48   , En2 , v084
        .byte   W24
        .byte                   Bn2 , v099
        .byte   W24
        .byte                   An1 , v084
        .byte   W24
        .byte           N12   , Cn3 , v099
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte   PEND
@ 020   ----------------------------------------
test_7_20:
        .byte           N36   , Bn2 , v099
        .byte           N48   , Cn2 , v084
        .byte   W36
        .byte           N12   , Gn3 , v099
        .byte   W12
        .byte           N10   , Fs3
        .byte           N48   , Dn2 , v084
        .byte   W12
        .byte           N03   , Fs3 , v099
        .byte   W03
        .byte                   Gn3 , v101
        .byte   W03
        .byte           N06   , Fs3 , v099
        .byte   W06
        .byte           N12   , En3
        .byte   W12
        .byte                   Dn3
        .byte   W12
        .byte   PEND
@ 021   ----------------------------------------
test_7_21:
        .byte           N96   , Bn2 , v099
        .byte           N96   , En2 , v084
        .byte   W96
        .byte   PEND
@ 022   ----------------------------------------
test_7_22:
        .byte           N48   , En2 , v084
        .byte   W48
        .byte                   Fs2
        .byte   W48
        .byte   PEND
@ 023   ----------------------------------------
test_7_23:
        .byte           N48   , Gs2 , v084
        .byte   W48
        .byte                   Cs2
        .byte   W48
        .byte   PEND
@ 024   ----------------------------------------
        .byte   PATT
         .word  test_7_22
@ 025   ----------------------------------------
        .byte           N96   , Gs2 , v084
        .byte   W96
@ 026   ----------------------------------------
test_7_LOOP:
        .byte           N03   , En1 , v094
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
        .byte                   En1
        .byte   W12
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_7_5
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_7_6
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_7_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_7_8
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_7_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_7_10
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_7_11
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_7_12
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_7_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_7_14
@ 037   ----------------------------------------
        .byte   PATT
         .word  test_7_15
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_7_16
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_7_17
@ 040   ----------------------------------------
        .byte   PATT
         .word  test_7_18
@ 041   ----------------------------------------
        .byte   PATT
         .word  test_7_19
@ 042   ----------------------------------------
        .byte   PATT
         .word  test_7_20
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_7_21
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_7_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_7_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_7_22
@ 047   ----------------------------------------
        .byte           N92   , Gs2 , v084 , gtp3
        .byte   W96
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_7_LOOP
        .byte   FINE

@****************** Track 8 (Midi-Chn.8) ******************@

test_8:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v+23
        .byte           VOL   , 97
        .byte           BENDR , 12
        .byte           VOICE , 24
        .byte   W96
@ 001   ----------------------------------------
        .byte           N12   , Cn3 , v114
        .byte   W12
        .byte                   En3 , v094
        .byte   W12
        .byte                   Gn3
        .byte   W12
        .byte                   Cn4
        .byte   W12
        .byte                   Dn3 , v116
        .byte   W12
        .byte                   Fs3 , v094
        .byte   W12
        .byte                   An3
        .byte   W12
        .byte                   Dn4
        .byte   W12
@ 002   ----------------------------------------
        .byte                   En3 , v116
        .byte   W12
        .byte                   Gn3 , v094
        .byte   W12
        .byte                   Bn3
        .byte   W12
        .byte                   En4
        .byte   W12
        .byte                   En3 , v116
        .byte   W12
        .byte                   An3 , v094
        .byte   W12
        .byte                   Cs4
        .byte   W12
        .byte                   En4
        .byte   W12
@ 003   ----------------------------------------
        .byte                   En3 , v116
        .byte   W12
        .byte                   An3 , v094
        .byte   W12
        .byte                   Cs4
        .byte   W12
        .byte                   En4
        .byte   W12
        .byte                   En3 , v116
        .byte   W12
        .byte                   An3 , v094
        .byte   W12
        .byte                   Cs4
        .byte   W12
        .byte                   En4
        .byte   W12
@ 004   ----------------------------------------
test_8_4:
        .byte           N06   , En3 , v107
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   Gn3 , v094
        .byte   W06
        .byte                   Bn3 , v096
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v108
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v109
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte   PEND
@ 005   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 006   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 007   ----------------------------------------
test_8_7:
        .byte           N06   , Dn3 , v107
        .byte   W06
        .byte                   Fs3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte                   Dn3 , v107
        .byte   W06
        .byte                   Fs3 , v094
        .byte   W06
        .byte                   Bn3 , v096
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte                   Dn3 , v108
        .byte   W06
        .byte                   Fs3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte                   Dn3 , v109
        .byte   W06
        .byte                   Fs3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 008   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 009   ----------------------------------------
test_8_9:
        .byte           N06   , En3 , v107
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Cn4
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   Gn3 , v094
        .byte   W06
        .byte                   Cn4 , v096
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   An3 , v096
        .byte   W06
        .byte                   Cn4
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   An3 , v094
        .byte   W06
        .byte                   Cn4 , v096
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte   PEND
@ 010   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 011   ----------------------------------------
        .byte   PATT
         .word  test_8_7
@ 012   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 013   ----------------------------------------
test_8_13:
        .byte           N06   , En3 , v107
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Cn4
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   Gn3 , v094
        .byte   W06
        .byte                   Cn4 , v096
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   Fn3 , v107
        .byte   W06
        .byte                   An3 , v096
        .byte   W06
        .byte                   Cn4
        .byte   W06
        .byte                   Fn4
        .byte   W06
        .byte                   Fn3 , v107
        .byte   W06
        .byte                   An3 , v094
        .byte   W06
        .byte                   Cn4 , v096
        .byte   W06
        .byte                   Fn4
        .byte   W06
        .byte   PEND
@ 014   ----------------------------------------
        .byte   W96
@ 015   ----------------------------------------
        .byte   W96
@ 016   ----------------------------------------
        .byte   W96
@ 017   ----------------------------------------
        .byte   W96
@ 018   ----------------------------------------
        .byte   W96
@ 019   ----------------------------------------
        .byte   W96
@ 020   ----------------------------------------
        .byte   W96
@ 021   ----------------------------------------
        .byte   W96
@ 022   ----------------------------------------
        .byte   W96
@ 023   ----------------------------------------
        .byte   W96
@ 024   ----------------------------------------
        .byte   W96
@ 025   ----------------------------------------
        .byte   W96
@ 026   ----------------------------------------
test_8_LOOP:
        .byte           N06   , En3 , v107
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v107
        .byte   W06
        .byte                   Gn3 , v094
        .byte   W06
        .byte                   Bn3 , v096
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v108
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
        .byte                   En3 , v109
        .byte   W06
        .byte                   Gn3 , v096
        .byte   W06
        .byte                   Bn3
        .byte   W06
        .byte                   En4
        .byte   W06
@ 027   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 028   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_8_7
@ 030   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_8_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_8_7
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_8_4
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_8_13
@ 036   ----------------------------------------
        .byte   W96
@ 037   ----------------------------------------
        .byte   W96
@ 038   ----------------------------------------
        .byte   W96
@ 039   ----------------------------------------
        .byte   W96
@ 040   ----------------------------------------
        .byte   W96
@ 041   ----------------------------------------
        .byte   W96
@ 042   ----------------------------------------
        .byte   W96
@ 043   ----------------------------------------
        .byte   W96
@ 044   ----------------------------------------
        .byte   W96
@ 045   ----------------------------------------
        .byte   W96
@ 046   ----------------------------------------
        .byte   W96
@ 047   ----------------------------------------
        .byte   W96
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_8_LOOP
        .byte   FINE

@***************** Track 9 (Midi-Chn.10) ******************@

test_9:
        .byte   KEYSH , test_key+0
@ 000   ----------------------------------------
        .byte           PAN   , c_v-24
        .byte           VOL   , 106
        .byte           BENDR , 12
        .byte           VOICE , 73
        .byte   W72
        .byte           N12   , Cn4 , v126
        .byte   W12
        .byte                   Dn4
        .byte   W12
@ 001   ----------------------------------------
        .byte   PATT
         .word  test_0_18
@ 002   ----------------------------------------
        .byte           N24   , En4 , v126
        .byte   W24
        .byte           TIE   , Bn3
        .byte   W72
@ 003   ----------------------------------------
        .byte   W96
@ 004   ----------------------------------------
        .byte           EOT
        .byte   W96
@ 005   ----------------------------------------
        .byte   W96
@ 006   ----------------------------------------
        .byte           N96   , Bn4 , v096
        .byte   W96
@ 007   ----------------------------------------
test_9_7:
        .byte   W12
        .byte           N06   , Gn4 , v096
        .byte   W06
        .byte                   An4
        .byte   W06
        .byte           N12   , Bn4
        .byte   W12
        .byte                   An4
        .byte   W12
        .byte                   Gn4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte           N24   , En4
        .byte   W24
        .byte   PEND
@ 008   ----------------------------------------
        .byte           N96   , Bn4
        .byte   W96
@ 009   ----------------------------------------
test_9_9:
        .byte   W12
        .byte           N06   , Gn4 , v096
        .byte   W06
        .byte                   An4
        .byte   W06
        .byte                   Cn5
        .byte   W06
        .byte                   Bn4
        .byte   W06
        .byte           N12   , Gn4
        .byte   W12
        .byte           N48   , An4
        .byte   W48
        .byte   PEND
@ 010   ----------------------------------------
test_9_10:
        .byte           N24   , Bn4 , v108
        .byte   W24
        .byte           N72   , En4 , v096
        .byte   W72
        .byte   PEND
@ 011   ----------------------------------------
test_9_11:
        .byte           N24   , Bn4 , v107
        .byte   W24
        .byte           N36   , En4 , v096
        .byte   W36
        .byte           N04   , Fs4
        .byte   W12
        .byte           N12   , Gn4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte   PEND
@ 012   ----------------------------------------
        .byte   PATT
         .word  test_9_10
@ 013   ----------------------------------------
test_9_13:
        .byte           N24   , Bn4 , v107
        .byte   W24
        .byte                   En4 , v096
        .byte   W24
        .byte           N48   , Fn4
        .byte   W48
        .byte   PEND
@ 014   ----------------------------------------
test_9_14:
        .byte           N24   , En4 , v122
        .byte   W24
        .byte           N36   , Bn4
        .byte   W36
        .byte           N06   , Dn5
        .byte   W06
        .byte                   Bn4
        .byte   W06
        .byte           N12   , An4
        .byte   W12
        .byte                   Gn4
        .byte   W12
        .byte   PEND
@ 015   ----------------------------------------
        .byte           N96   , Fs4
        .byte   W96
@ 016   ----------------------------------------
test_9_16:
        .byte           N24   , En4 , v122
        .byte   W24
        .byte           N36   , Bn4
        .byte   W36
        .byte           N06   , Dn5
        .byte   W06
        .byte                   Bn4
        .byte   W06
        .byte           N12   , An4
        .byte   W12
        .byte                   Bn4
        .byte   W12
        .byte   PEND
@ 017   ----------------------------------------
test_9_17:
        .byte           N48   , Fs4 , v122
        .byte   W48
        .byte           N36   , Gn4
        .byte   W36
        .byte           N06   , En4 , v121
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 018   ----------------------------------------
test_9_18:
        .byte           N84   , En4 , v101
        .byte   W84
        .byte           N06   , En4 , v111
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 019   ----------------------------------------
test_9_19:
        .byte           N12   , En4 , v112
        .byte   W12
        .byte                   Bn3
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte                   Gn4
        .byte   W12
        .byte           N36   , Bn4
        .byte   W36
        .byte           N06   , En4
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 020   ----------------------------------------
test_9_20:
        .byte           N84   , Bn3 , v101
        .byte   W84
        .byte           N06   , En4 , v111
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 021   ----------------------------------------
test_9_21:
        .byte           N12   , En4 , v111
        .byte   W12
        .byte                   Bn3
        .byte   W12
        .byte                   Dn4
        .byte   W12
        .byte                   Gn4
        .byte   W12
        .byte           N32   , En4 , v111 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte                   Dn4
        .byte   W06
        .byte   PEND
@ 022   ----------------------------------------
test_9_22:
        .byte           N32   , Gs4 , v111 , gtp2
        .byte   W36
        .byte           N06
        .byte   W06
        .byte           N01   , Fs4 , v096
        .byte   W03
        .byte                   Gs4
        .byte   W03
        .byte           N32   , Ds4 , v111 , gtp2
        .byte   W36
        .byte           N06   , Gs4
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte   PEND
@ 023   ----------------------------------------
test_9_23:
        .byte           N12   , Gs4 , v111
        .byte   W12
        .byte                   Ds4
        .byte   W12
        .byte                   Fs4
        .byte   W12
        .byte                   Bn4
        .byte   W12
        .byte           N36   , Ds5 , v109
        .byte   W36
        .byte           N06   , Gs4 , v111
        .byte   W06
        .byte           N01   , Fs4 , v093
        .byte   W03
        .byte                   Gs4
        .byte   W03
        .byte   PEND
@ 024   ----------------------------------------
test_9_24:
        .byte           N12   , Ds4 , v111
        .byte   W12
        .byte           N06   , Gs4
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N12   , Ds4
        .byte   W12
        .byte           N06   , Gs4
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte           N12   , Ds4
        .byte   W12
        .byte           N06   , Gs4
        .byte   W06
        .byte           N01   , Fs4 , v092
        .byte   W03
        .byte                   Gs4 , v089
        .byte   W03
        .byte           N06   , Ds4 , v111
        .byte   W06
        .byte                   Cs4
        .byte   W06
        .byte                   Gs4
        .byte   W06
        .byte                   Fs4
        .byte   W06
        .byte   PEND
@ 025   ----------------------------------------
        .byte           N48   , Cs4
        .byte   W48
        .byte                   Ds4
        .byte   W48
@ 026   ----------------------------------------
test_9_LOOP:
        .byte   W96
@ 027   ----------------------------------------
        .byte   W96
@ 028   ----------------------------------------
        .byte           N96   , Bn4 , v096
        .byte   W96
@ 029   ----------------------------------------
        .byte   PATT
         .word  test_9_7
@ 030   ----------------------------------------
        .byte           N96   , Bn4 , v096
        .byte   W96
@ 031   ----------------------------------------
        .byte   PATT
         .word  test_9_9
@ 032   ----------------------------------------
        .byte   PATT
         .word  test_9_10
@ 033   ----------------------------------------
        .byte   PATT
         .word  test_9_11
@ 034   ----------------------------------------
        .byte   PATT
         .word  test_9_10
@ 035   ----------------------------------------
        .byte   PATT
         .word  test_9_13
@ 036   ----------------------------------------
        .byte   PATT
         .word  test_9_14
@ 037   ----------------------------------------
        .byte           N96   , Fs4 , v122
        .byte   W96
@ 038   ----------------------------------------
        .byte   PATT
         .word  test_9_16
@ 039   ----------------------------------------
        .byte   PATT
         .word  test_9_17
@ 040   ----------------------------------------
        .byte   PATT
         .word  test_9_18
@ 041   ----------------------------------------
        .byte   PATT
         .word  test_9_19
@ 042   ----------------------------------------
        .byte   PATT
         .word  test_9_20
@ 043   ----------------------------------------
        .byte   PATT
         .word  test_9_21
@ 044   ----------------------------------------
        .byte   PATT
         .word  test_9_22
@ 045   ----------------------------------------
        .byte   PATT
         .word  test_9_23
@ 046   ----------------------------------------
        .byte   PATT
         .word  test_9_24
@ 047   ----------------------------------------
        .byte           N48   , Cs4 , v111
        .byte   W48
        .byte           N44   , Ds4 , v111 , gtp3
        .byte   W48
@ 048   ----------------------------------------
        .byte   GOTO
         .word  test_9_LOOP
        .byte   FINE


@********************** End of Song ***********************@

        .align  2
test:
        .byte   10                      @ Num Tracks
        .byte   0                       @ Unknown
        .byte   test_pri                @ Priority
        .byte   test_rev                @ Reverb

        .word   test_grp               

        .word   test_0
        .word   test_1
        .word   test_2
        .word   test_3
        .word   test_4
        .word   test_5
        .word   test_6
        .word   test_7
        .word   test_8
        .word   test_9

        .end
