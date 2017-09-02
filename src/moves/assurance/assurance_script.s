#include <battle_script.h>

.align 2
.thumb
.text

.global bs_assurance
bs_assurance:
    callasm assurance_damage_modifier+1
    goto 0x081D6900


