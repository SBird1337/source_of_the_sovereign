#include <battle_script.h>

.align 2
.thumb
.text

.global bs_lucky_chant
bs_lucky_chant:
    attackcanceler
    attackstring
    ppreduce
    callasm lucky_chant_set+1
    attackanimation
    waitanimation
    setword STRING_LOADER str_lucky_chant
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E
