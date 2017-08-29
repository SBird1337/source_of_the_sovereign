#include <battle_script.h>

.align 2
.thumb
.text

.global bs_change_ability
bs_change_ability:
    attackcanceler
    attackstring
    ppreduce
    accuracycheck 0x81D7DF2 0xFFFF
    callasm ability_change+1
    attackanimation
    waitanimation
    printstring 0x184
    waitmessage 0x40
    goto 0x81D694E


