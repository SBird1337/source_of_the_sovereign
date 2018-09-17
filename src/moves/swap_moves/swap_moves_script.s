#include <battle_script.h>

.align 2
.text
.thumb

.global bs_swap_moves
bs_swap_moves:
    attackcanceler
    attackstring
    ppreduce
    callasm set_swap_moves+1
    attackanimation
    waitanimation
    printstring 0x184
    waitmessage 0x40
    goto 0x081D694E


