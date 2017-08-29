#include <battle_script.h>

.align 2
.text
.thumb

.global bs_gastro_acid
bs_gastro_acid:
    attackcanceler
    attackstring
    ppreduce
    callasm gastro_acid_set+1
    attackanimation
    waitanimation
    setword STRING_LOADER str_gastro_acid
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E