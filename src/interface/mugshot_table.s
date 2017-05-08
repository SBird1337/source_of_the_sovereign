.align 2
.thumb
.section .rodata

mugshot_table_int:
.word mug_00Tiles
.word mug_00Pal

.word mug_01Tiles
.word mug_01Pal

.word mug_02Tiles
.word mug_02Pal

.word mug_03Tiles
.word mug_03Pal

.word mug_04Tiles
.word mug_04Pal

.word mug_05Tiles
.word mug_05Pal

.word mug_06Tiles
.word mug_06Pal

.word mug_07Tiles
.word mug_07Pal

.word mug_08Tiles
.word mug_08Pal


.global mugshots
mugshots:
.word mugshot_table_int