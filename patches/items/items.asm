.include "patches/items/item_limits.asm"
.include "patches/items/item_tables.asm"
.include "patches/items/item_routines.asm"
.include "patches/items/tm_fixes.asm"

.org 0x080001C8
.word item_list

.org 0x0809A8D8
.word item_list

.org 0x0809A8FC 
.word item_list

.org 0x0809A920 
.word item_list

.org 0x0809A944 
.word item_list

.org 0x0809A968 
.word item_list

.org 0x0809A98C 
.word item_list

.org 0x0809A9B0 
.word item_list

.org 0x0809A9D4 
.word item_list

.org 0x0809A9F8 
.word item_list

.org 0x0809AA1C 
.word item_list

.org 0x0809AA40 
.word item_list

.org 0x0809AA64 
.word item_list

.org 0x0809AA88 
.word item_list

.org 0x0809AAAC 
.word item_list

.org 0x0803A2B0 
.word item_flagtable

.org 0x08041548 
.word item_flagtable

.org 0x08042524 
.word item_flagtable

.org 0x08042C30 
.word item_flagtable

.org 0x08042E3C 
.word item_flagtable

.org 0x0812504C 
.word item_flagtable

.org 0x0812574C 
.word item_flagtable

.org 0x08126CC4 
.word item_flagtable