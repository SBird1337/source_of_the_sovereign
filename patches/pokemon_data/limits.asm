//name table limit
.org 0x08041000
.byte 0,0,0,0,0,0

//sprite table limit
.org 0x0800ED72
.byte 0x07, 0xE0

.org 0x0800F1B6
.byte 0x07, 0xE0

//pal table limit
.org 0x08044104
.byte 0x04, 0xE0

//height and altitude limit
.org 0x0807472E
.byte 0x03, 0xE0

.org 0x0807465E
.byte 0x03, 0xE0

.org 0x08074788
.byte 0x06, 0xE0

//icon limits
.org 0x08096F90
.halfword 0x0000

.org 0x08096E7A
.word 0x00000000

.org 0x080971DA
.halfword 0x0000
