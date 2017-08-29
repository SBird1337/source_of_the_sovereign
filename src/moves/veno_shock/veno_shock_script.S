#include <battle_script.h>

.align 2
.thumb
.text

.global bs_venoshock
bs_venoshock:
    callasm venoshock_has_multiplier+1
    goto 0x81D6900


