#include <battle_script.h>

.align 2
.thumb
.text

.global bs_change_ability
bs_change_ability:
    attackcanceler
    attackstring
    ppreduce
    callasm worry_seed+1
    attackanimation
    waitanimation
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E


