EGG_HATCH_LEVEL EQU 1
EV_CAP EQU 252

PLAYER_S_X EQU 7
PLAYER_S_Y EQU 0x13

PLAYER_S_B EQU 5
PLAYER_S_M EQU 0

// Something //
.org 0x080441D6
.byte 0x0

.org 0x08125AA8
.byte 0x0

// Change hatch level of new pokémon //
.org 0x081375B0
.byte EGG_HATCH_LEVEL

.org 0x08046CBE
.byte EGG_HATCH_LEVEL

.org 0x0804623E
.byte EGG_HATCH_LEVEL

// Something //
.org 0x0805BA3A
.word 0x00000000

// No flag check while in menu (moves) //
.org 0x08124630
.halfword 0xE012

// Intro and Naming Hacking //

.org 0x080EC5D0
//.word 0x08078915

.org 0x0800C4C8
//.word 0x0800C608

.org 0x08054A68
//.halfword 0x4C3C
//.halfword 0x6820
//.halfword 0x4900
//.halfword 0xE001
//.word str_player_dummy_name

.org 0x08054A7E
//.halfword 0x4E34

.org 0x08054B3A
//.word 0x00000000

.org 0x080439FC
.byte EV_CAP

.org 0x08043A02
.byte EV_CAP

// Critical hit chance table //
.org 0x08250530
.halfword 0x0010
.halfword 0x0008
.halfword 0x0002
.halfword 0x0001
.halfword 0x0001

.org 0x08080484
.word 0x00000000
.word 0x00000000

.org 0x08054A08
.byte PLAYER_S_X

.org 0x08054A00
.byte PLAYER_S_Y

.org 0x08054A04
.byte PLAYER_S_B

.org 0x08054A06
.byte PLAYER_S_M