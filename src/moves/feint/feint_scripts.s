#include <battle_script.h>
#include <moves.h>
.align 2
.text
.thumb

.global bs_feint
bs_feint:
    attackcanceler
    accuracycheck 0x081D695E 0
    attackstring
    ppreduce
    callasm break_shields+1
normal_execute:
    calculatedamage
    attackanimation
    waitanimation
    missmessage
    cmd5c 0x0
    graphicalhpupdate 0
    datahpupdate 0
    critmessage
    waitmessage 0x40
    jumpifhalfword 0x0 0x02023D4A MOVE_FEINT feint_message
    setword STRING_LOADER str_shield_break_normal
    goto after_feint
feint_message:
    setword STRING_LOADER str_shield_break_feint
after_feint:
    printstring 0x184
    waitmessage 0x40
    faintpokemon 0x0 0x0 0x0
    setbyte 0x2023FD8 0x0
    cmd49 0x0 0x0
    end
    
.global bs_feint_no_break
bs_feint_no_break:
    calculatedamage
    attackanimation
    waitanimation
    missmessage
    cmd5c 0x0
    graphicalhpupdate 0
    datahpupdate 0
    critmessage
    waitmessage 0x40
    faintpokemon 0x0 0x0 0x0
    setbyte 0x2023FD8 0x0
    cmd49 0x0 0x0
    end

.global bs_feint_no_break_ptr
bs_feint_no_break_ptr:
    .word bs_feint_no_break
