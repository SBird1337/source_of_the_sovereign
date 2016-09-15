#include <battle_script.h>

.align 2
.thumb
.text

.global bs_tailwind
bs_tailwind:
    attackcanceler
    callasm set_tailwind+1
    attackstring
    ppreduce
    attackanimation
    waitanimation
    setword STRING_LOADER str_tailwind
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E


