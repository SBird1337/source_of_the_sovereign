#include <battle_script.h>

.align 2
.thumb
.text

.global bs_magnet_rise
bs_magnet_rise:
    attackcanceler
    attackstring
    ppreduce
    callasm set_magnet_rise+1
    attackanimation
    waitanimation
    setword STRING_LOADER str_magnet_rise
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E

