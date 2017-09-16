.org 0x0805E5D4
    bx r1

.org 0x0805E5F4
    .word overworld_h_one+1

.org 0x0805F2C8
    ldr r1, =npc_get_type+1
    bx r1
    .pool

.org 0x0805e152
mov r1, #5
orr r0, r1
strb r0, [r4]
ldrb r0, [r5, #3]
strb r0, [r4, #0x1A]

/*.org 0x0805E510
    ldr r1, =overworld_h_two+1
    bx r1
    .pool*/

.org 0x0805E744
    lsl r4, r4, #0x10
    lsr r4, r4, #0x10
    lsl r5, r5, #0x10
    lsr r5, r5, #0x10
    mov r0, #0x0
    str r0, [SP, #0x20] 
    mov r1, r9
    ldrb r0, [r1, #0x1]
    ldrb r1, [r1, #0x3]
    lsl r1, r1, #0x18
    lsr r1, r1, #0x10
    orr r0, r1

.org 0x0805e964
    ldr r4, =overworld_h_three+1
    bx r4
    .pool

.org 0x0805E8F0
    lsl r0, #0x10
    lsr r0, #0x10

.org 0x0805ee84
    bx r1

.org 0x0805EFE4
    .word overworld_h_four+1

.org 0x08067A12
    ldr r5, =overworld_h_five+1
    bx r5
    .pool

.org 0x08067F92
    ldr r5, =overworld_h_six+1
    bx r5
    .pool

.org 0x0805F4D8
    .word ow_pal_table

.org 0x0805F570
    .word ow_pal_table

.org 0x0805F2F4
    .word ow_pal_table

.org 0x0805F5C8
    .word ow_pal_table

.org 0x0805F4D4
    .halfword 0x13FF

.org 0x0805F5CC
    .halfword 0x13FF

.org 0x0805F5D2
    lsl r0, r0, #0x10
    lsr r2, r0, #0x10

.org 0x0805F548
    lsl r0, r0, #0x10
.org 0x0805F54C
    lsr r0, r0, #0xD

.org 0x0805F4BA
    lsl r0, #0x10
    lsr r1, r0, #0x10

.org 0x0806837C
    ldr r3, =grass_step_general+1
    bx r3
    .pool

.org 0x080683C8
    ldr r3, =grass_step_elastic+1
    bx r3
    .pool

.org 0x08083484
    .word oe_effect_table

.org 0x08064540
    .word movement_animations

.org 0x08064584
    .word movement_animations
.org 0x080645B4
    .word movement_animations

.org 0x0805F5CC
.halfword 0xC3FF

.org 0x0805F634
.halfword 0xC3FF

.org 0x0805F6AC
.halfword 0xC3FF