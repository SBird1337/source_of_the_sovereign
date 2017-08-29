#include <battle_script.h>

.text
.align 2
.thumb

.global bs_power_trick
bs_power_trick:
attackcanceler
attackstring
ppreduce
callasm power_trick_swap+1
attackanimation
waitanimation
setword STRING_LOADER str_power_trick
printstring 0x184
waitmessage 0x40
goto 0x081D694E