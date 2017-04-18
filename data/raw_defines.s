.align 2
.thumb
.text

.global objects
objects:
    .word 0x0202063C

.global evolutions
evolutions:
    .word 0x08259754

.global ts_pals
ts_pals:
    .incbin "sots-private/assets/misc/title/pal.bin"