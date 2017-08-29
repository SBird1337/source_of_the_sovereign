#include <battle_script.h>

.align 2
.thumb
.text

.global bs_rooms
bs_rooms:
    attackcanceler
    attackstring
    ppreduce
    attackanimation
    waitanimation
    callasm set_or_delete_rooms+1
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E



