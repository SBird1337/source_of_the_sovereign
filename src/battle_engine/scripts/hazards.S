#include <battle_script.h>

.text
.align 2
.thumb

.global bs_stealth_rock_int
bs_stealth_rock_int:

orword 0x2023DD0 0x100100
graphicalhpupdate 0x0
datahpupdate 0x0
setword 0x0203C020 str_stealth_rock
printstring 0x184
waitmessage 0x40
faintpokemon 0x0 0x0 0x0
faintpokemon 0x0 0x1 0x81D8CDF
return

.align 2
.global bs_stealth_rock
bs_stealth_rock:
.word bs_stealth_rock_int