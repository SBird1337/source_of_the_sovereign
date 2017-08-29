#include <battle_script.h>

.align 2
.thumb
.text

.global bs_pay_back
bs_pay_back:
    callasm pay_back_damage_modifier+1
    goto 0x081D6900 @normal damaging move

.global as_pay_back
as_pay_back:
    .byte 0x14, 0x00, 0x17, 0x00, 0x97, 0x27, 0x00, 0x9F, 0x27, 0x0A, 0x03, 0x0C, 0x0C, 0x08, 0x03, 0x7D
    .byte 0x90, 0x09, 0x08, 0x02, 0x05, 0x00, 0x00, 0x12, 0x00, 0x06, 0x00, 0x01, 0x00, 0x04, 0x00, 0x19
    .byte 0x73, 0x00, 0xC0, 0x05, 0x02, 0x9C, 0x4E, 0x3D, 0x08, 0x02, 0x05, 0x00, 0x00, 0x14, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x04, 0x02, 0x08, 0x7C, 0x3E, 0x08, 0x02, 0x04, 0xF1, 0xFF
    .byte 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x74, 0x00, 0x3F, 0x04, 0x01, 0x03, 0xF9, 0x89, 0x09
    .byte 0x08, 0x02, 0x05, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00, 0x19, 0x00, 0x01, 0x00, 0x02, 0x10, 0x67
    .byte 0x3E, 0x08, 0x03, 0x05, 0xF1, 0xFF, 0x12, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x03
    .byte 0x02, 0x08, 0x7C, 0x3E, 0x08, 0x02, 0x04, 0x00, 0x00, 0xFC, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x19
    .byte 0x74, 0x00, 0x3F, 0x04, 0x01, 0x02, 0x10, 0x67, 0x3E, 0x08, 0x03, 0x05, 0x00, 0x00, 0xFC, 0xFF
    .byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x03, 0x02, 0x08, 0x7C, 0x3E, 0x08, 0x02, 0x04, 0x0F
    .byte 0x00, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x74, 0x00, 0x3F, 0x04, 0x01, 0x02, 0x10, 0x67
    .byte 0x3E, 0x08, 0x03, 0x05, 0x0F, 0x00, 0x09, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x05
    .byte 0x02, 0x84, 0x4E, 0x3D, 0x08, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x0B, 0x03
    .byte 0x0D, 0x0E, 0xC7, 0x59, 0x1D, 0x08, 0x08