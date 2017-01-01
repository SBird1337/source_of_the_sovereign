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

.word 0
.word 0

.word 0
.word 0

.word mug_05Tiles
.word mug_05Pal

.word mug_06Tiles
.word mug_06Pal

.word mug_07Tiles
.word mug_07Pal

.word mug_08Tiles
.word mug_08Pal

.word mug_09Tiles
.word mug_09Pal

.word mug_10Tiles
.word mug_10Pal

.word mug_11Tiles
.word mug_11Pal

.global mugshots
mugshots:
    .word mugshot_table_int


