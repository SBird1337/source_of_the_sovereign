#include <battle_script.h>

.align 2
.text
.thumb

.global bs_crush_grip_like
bs_crush_grip_like:
    attackcanceler
    accuracycheck 0x081D695E 0
    attackstring    
    ppreduce
    callasm hp_damage_mod+1
    calculatedamage
    attackanimation
    waitanimation
    missmessage
    cmd5c 0x0
    waitstate
    graphicalhpupdate 0x0
    datahpupdate 0x0
    critmessage
    waitmessage 0x40
    resultmessage
    waitmessage 0x40
    seteffectwithchancetarget
    faintpokemon 0x0 0x0 0x0
    setbyte 0x2023FD8 0x0
    cmd49 0x0 0x0
    end
