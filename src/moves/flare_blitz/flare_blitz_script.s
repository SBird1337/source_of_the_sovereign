#include <battle_script.h>
#include <moves.h>

.align 2
.thumb
.text

.global bs_flare_blitz
bs_flare_blitz:

    setbyte 0x2023E85 0x3
    jumpifhalfword 0x0 0x2023D4A MOVE_FLARE_BLITZ flare_blitz
    goto 0x81D6900

flare_blitz:
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
    seteffectwithchancetarget
    setbyte 0x2023E85 0xE6
    seteffectwithchancetarget
    goto 0x81D6947
