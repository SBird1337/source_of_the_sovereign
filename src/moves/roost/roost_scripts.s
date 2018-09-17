#include <battle_script.h>

.text
.align 2
.thumb

.global bs_roost
bs_roost:
attackcanceler
attackstring
ppreduce
setdamageasrestorehalfmaxhp bs_roost_max 1
attackanimation
waitanimation
orword 0x02023DD0 0x100
graphicalhpupdate 1
datahpupdate 1
printstring 0x4B
waitmessage 0x40
jumpifhalfword 0x0 0x02023D4A 0x163 roost_active
goto roost_end

bs_roost_max:
pause 0x20
printstring 0x4C
waitmessage 0x40
goto roost_end

roost_active:
jumpiftype2 1 2 change_type
goto roost_end

change_type:
callasm roost_change_type+1
roost_end:
setbyte 0x0203FD80 0
cmd49 0 0
end
