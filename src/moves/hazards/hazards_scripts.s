#include <battle_script.h>

.text
.align 2
.thumb

.global hazards_script
hazards_script:
attackcanceler
callasm lay_entry_hazards

.global bs_spikes_lain_int
bs_spikes_lain_int:
setword STRING_LOADER str_spikes_lain
goto hazards_end

.global bs_toxic_lain_int
bs_toxic_lain_int:
setword STRING_LOADER str_toxic_lain
goto hazards_end

.global bs_rocks_lain_int
bs_rocks_lain_int:
setword STRING_LOADER str_rocks_lain
goto hazards_end

.global bs_sticky_lain_int
bs_sticky_lain_int:
setword STRING_LOADER str_sticky_lain
goto hazards_end

.align 2
.global bs_spikes_lain
bs_spikes_lain:
	.word bs_spikes_lain_int
	
.global bs_rocks_lain
bs_rocks_lain:
	.word bs_rocks_lain_int
	
.global bs_toxic_lain
bs_toxic_lain:
	.word bs_toxic_lain_int
	
.global bs_sticky_lain
bs_sticky_lain:
	.word bs_sticky_lain_int

hazards_end:
attackstring
ppreduce
attackanimation
waitanimation
printstring 0x184
waitmessage 0x40
setbyte 0x2023FD8 0x0
cmd49 0x0 0x0
end
