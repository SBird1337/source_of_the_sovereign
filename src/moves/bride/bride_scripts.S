#include <battle_script.h>

.align 2
.thumb
.text

.global bs_bride
bs_bride:
    callasm bride_has_multiplier+1
    goto 0x81D6926


