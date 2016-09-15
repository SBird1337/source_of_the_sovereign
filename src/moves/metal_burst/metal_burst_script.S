#include <battle_script.h>
#include <moves.h>

.align 2
.thumb
.text

.global bs_metal_burst_counter
bs_metal_burst_counter:
    jumpifhalfword 0x0 0x02023D4A MOVE_COUNTER 0x081D7433
    attackcanceler
    counterdamagecalculator try_mirror_coat
    accuracycheck 0x81D695E 0x0
    attackstring
    ppreduce
    damagecalc2
    cmd69
    callasm metal_burst_dmg_reduction+1
    goto 0x81D6934

try_mirror_coat:
    mirrorcoatdamagecalculator 0x081D7DF0
    accuracycheck 0x81D695E 0x0
    attackstring
    ppreduce
    damagecalc2
    cmd69
    callasm metal_burst_dmg_reduction+1
    goto 0x81D6934