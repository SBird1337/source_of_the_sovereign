#include <battle_script.h>
#include <moves.h>

.align 2
.text
.thumb

.global bs_lower_def_moves
bs_lower_def_moves:
    jumpifhalfword 0x0 0x2023D4A MOVE_SEED_FLARE set_seed_flare
    goto 0x81D6900
set_acid:
    setbyte 0x2023E85 0x17
set_seed_flare:
    setbyte 0x02023E85 0x32
    goto 0x81D6900
