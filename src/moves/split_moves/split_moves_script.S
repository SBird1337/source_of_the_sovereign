#include <battle_script.h>
#include <moves.h>

.align 2
.thumb
.text

.global bs_split_status
bs_split_status:
    attackcanceler
    callasm split_status+1
    attackstring
    ppreduce
    attackanimation
    waitanimation
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E



