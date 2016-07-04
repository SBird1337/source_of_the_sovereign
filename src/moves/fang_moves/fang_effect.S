#include <battle_script.h>

.align 2
.text
.global script_fang_flinch

script_fang_flinch:

setbyte 0x2023E85 0x8
jumpifhalfword 0x0 0x2023D4A FIRE_FANG firefang
jumpifhalfword 0x0 0x2023D4A ICE_FANG icefang
jumpifhalfword 0x0 0x2023D4A THUNDER_FANG thunderfang
goto 0x81D6900

firefang:

call effect
setbyte 0x2023E85 0x3
seteffectwithchancetarget
goto 0x81D6947

icefang:

call effect
setbyte 0x2023E85 0x4
seteffectwithchancetarget
goto 0x81D6947

thunderfang:

call effect
setbyte 0x2023E85 0x5
seteffectwithchancetarget
goto 0x81D6947

effect:

attackcanceler
accuracycheck 0x81D695E 0x0
attackstring
ppreduce
calculatedamage
attackanimation
waitanimation
missmessage
cmd5c BANK_TARGET
waitstate
graphicalhpupdate BANK_TARGET
datahpupdate BANK_TARGET
critmessage
waitmessage DELAY_1SECOND
resultmessage
waitmessage DELAY_1SECOND
return