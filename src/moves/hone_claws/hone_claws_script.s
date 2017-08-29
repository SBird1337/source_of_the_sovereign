#include <battle_script.h>
#include <moves.h>

.align 2
.thumb
.text

.global bs_hone_claws
bs_hone_claws:
    jumpifhalfword 0x0 0x2023D4A MOVE_HONE_CLAWS hone_claws
    goto 0x081D6B77

hone_claws:
    attackcanceler
    attackstring
    ppreduce
    jumpifstat BANK_USER 0x3 0x1 0xC attack
    jumpifstat BANK_USER 0 0x6 0xC 0x81D85E7

attack:
    attackanimation
    waitanimation
    setbyte 0x2023FDF 0x0
    playstatchangeanimation 0x0 0x42 0x0
    setbyte 0x2023FDE 0x11
    statbuffchange 0x41 accuracy
    jumpifbyte 0x0 0x2023E87 0x2 accuracy
    printfromtable 0x83FE57C
    waitmessage 0x40

accuracy:
    setbyte 0x2023FDE 0x16
    statbuffchange 0x41 0x81D85E2
    jumpifbyte 0x0 0x2023E87 0x2 0x81D85E2
    printfromtable 0x83FE57C
    waitmessage 0x40
    goto 0x1D694E


