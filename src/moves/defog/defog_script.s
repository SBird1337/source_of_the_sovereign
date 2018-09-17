#include <battle_script.h>
#include <constants/moves.h>

.align 2
.thumb
.text

.global bs_defog
bs_defog:
    setbyte 0x2023FDE 0x97
    attackcanceler
    jumpifsecondarystatus 0x0 0x1000000 0x81D7DF0
    accuracycheck 0x81D695E 0x0
    attackstring
    ppreduce
    jumpifhalfword 0x0 0x2023D4A MOVE_SWEET_SCENT no_defog
    callasm defog_field+1
no_defog:
    statbuffchange 0x1 0x81D6C5D
    jumpifbyte 0x3 0x2023E87 0x2 0x81D6C4B
    jumpifbyte 0x0 0x2023E87 0x3 0x81D6C5D
    pause 0x20
    goto 0x81D6C55


