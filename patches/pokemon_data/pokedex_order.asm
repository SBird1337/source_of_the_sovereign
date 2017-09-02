NUMBER_OF_ENTRIES equ 0x2D1

.org 0x0804323C
.word pokedex_order

.org 0x080432B0
.word pokedex_order

.org 0x081025EC
.byte 0xC0			//1/4 dex length more or less

.org 0x081025EE
.halfword 0x0140	//fix alloc

.org 0x08103920		//fix last mon of dex
.halfword NUMBER_OF_ENTRIES-1

.org 0x08043220
.halfword 0x0000	//break limit

.org 0x08088EA4
.halfword NUMBER_OF_ENTRIES-1

.org 0x08104C28
.halfword NUMBER_OF_ENTRIES-1