#include <battle_script.h>

.text
.align 2
.thumb

.global bs_stealth_rock_int
bs_stealth_rock_int:
	orword 0x2023DD0 0x100100
	graphicalhpupdate 0x0
	datahpupdate 0x0
	setword STRING_LOADER str_stealth_rock
	printstring 0x184
	waitmessage 0x40
	faintpokemon 0x0 0x0 0x0
	faintpokemon 0x0 0x1 0x81D8CDF
	return

.align 2
.global bs_stealth_rock
bs_stealth_rock:
	.word bs_stealth_rock_int


.global toxic_spikes_int
toxic_spikes_int:
	statusanimation BANK_TARGET
	setword STRING_LOADER str_got_poison
rest_of_toxic:
	printstring 0x184
	waitmessage 0x40
	cmd98 0x0
	setbyte 0x2023FD8 0x0
	cmd49 0x0 0x0
	return

.align 2
.global bs_toxic_spikes
bs_toxic_spikes:
	.word toxic_spikes_int

.align 2
.global bs_toxic_spikes_bad_int
bs_toxic_spikes_bad_int:
	statusanimation BANK_TARGET
	setword STRING_LOADER str_got_bad_poison
	goto rest_of_toxic

.align 2
.global bs_toxic_spikes_bad
bs_toxic_spikes_bad:
	.word bs_toxic_spikes_bad_int
	
.align 2
.global bs_sticky_web_int
bs_sticky_web_int:
	setword STRING_LOADER str_sticky_web
	printstring 0x184
	waitmessage 0x40
	statbuffchange 0x1 sticky_return
	cmd47
	playanimation 0 1 0x02023FD4
	printfromtable 0x083FE57C
	waitmessage 0x40
sticky_return:
	return
	
.align 2
.global bs_sticky_web
bs_sticky_web:
	.word bs_sticky_web_int
	
.align 2
.global bs_toxic_resolve_int
bs_toxic_resolve_int:
	setword STRING_LOADER str_toxic_resolve
	printstring 0x184
	waitmessage 0x40
	return
	
.align 2
.global bs_toxic_resolve
bs_toxic_resolve:
	.word bs_toxic_resolve_int