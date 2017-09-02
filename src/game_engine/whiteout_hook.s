#include <config.h>

.align 2
.thumb
.text

.global whiteout_hook
whiteout_hook:
ldr r0, =HEALING_BANK_MAP_VAR
bl var_get_rekt
lsl r1, r0, #0x18
lsr r0, r0, #8
lsr r1, r1, #0x18
strb r1, [r4]
strb r0, [r4,#1]
mov r0, #0xFF
strb r0, [r4, #2]
ldr r0, =HEALING_X_VAR
bl var_get_rekt
lsl r0, #0x10
lsr r0, #0x10
strh r0, [r4, #4]
ldr r0, =HEALING_Y_VAR
bl var_get_rekt
lsl r0, #0x10
lsr r0, #0x10
strh r0, [r4,#6]
ldr r0, =0x080BFDF5
bx r0

var_get_rekt:
ldr r1, =var_get
bx r1
