.org 0x0804323C
.word pokedex_order

.org 0x080432B0
.word pokedex_order

.org 0x081025EC
.byte 0xC0			//1/4 dex length more or less

.org 0x081025EE
.halfword 0x0140	//fix alloc

.org 0x08103920
.halfword 0x2D0

.org 0x08043220
.halfword 0x0000	//break limit
