.align 2
.thumb
.text

.global overworld_h_one

overworld_h_one:
    ldr r1, =npc_states
    add r5, r0, r1
    ldrb r0, [r5, #5] @image number
    ldrb r1, [r5, #0x1A] @table index
    lsl r1, #8
    orr r0, r1
    bl npc_get_type
    ldr r1, =0x0805E5DD
    bx r1

.global overworld_h_two

overworld_h_two:
    push {r4, lr}
    sub sp, #8
    add r4, r0, #0
    ldrb r0, [r4, #5] @image number
    ldrb r1, [r4, #0x1A] @table index
    lsl r1, #8
    orr r0, r1
    bl npc_get_type
    ldr r1, =0x0805e51D
    bx r1
    
.global overworld_h_three
overworld_h_three:
    add r4, r0, #0x0
    add r5, r1, #0x0
    add r3, r2, #0x0
    ldrb r0, [r4, #0x1]
    lsl r0, r0, #0x18
    lsr r0, r0, #0x18
    ldrb r1, [r4, #0x3]
    lsl r1, r1, #0x18
    lsr r1, r1, #0x10
    orr r0, r0, r1
    ldrb r1, [r4, #0x9]
    add r2, r5, #0x0
    ldr r4, =0x0805e96f
    bx r4

.global overworld_h_four
overworld_h_four:
    ldr r6, =npc_states
    add r6, r0
    mov r0, #0
    str r0, [sp, #0x20]
    ldrb r0, [r6, #5]
    ldrb r1, [r6, #0x1A]
    lsl r1, #8
    orr r0, r1
    bl npc_get_type
    add r5, r0, #0x0
    ldrh r2, [r5, #0x6]
    add r4, SP, #0x18
    ldr r0, [r4, #0x4]
    lsr r0, r0, #0x10
    lsl r0, r0, #0x10
    orr r0, r2
    str r0, [r4, #0x4]
    ldrb r0, [r6, #0x5] 
    ldrb r1, [r6, #0x1a]
    lsl r1, r1, #0x8
    orr r0, r1
    ldr r1, =0x0805eea3
    bx r1

.global overworld_h_five
overworld_h_five:
    add r5, r0, #0
    add r4, r1, #0
    ldrb r1, [r5, #1]
    mov r0, #0x41
    neg r0, r0
    and r0, r1
    strb r0, [r5,#1]
    ldrb r0, [r5, #0x5]
    ldrb r1, [r5, #0x1a]
    lsl r1, r1, #0x8
    orr r0, r1
    bl npc_get_type
    ldr r1, =0x08067A27
    bx r1

.global overworld_h_six
overworld_h_six:
    add r5, r0, #0x0
    mov r4, #0x0
    ldrb r0, [r5, #0x5] 
    ldrb r1, [r5, #0x1a]
    lsl r1, r1, #0x8
    orr r0, r1
    bl npc_get_type
    ldr r1, =0x08067f9d
    bx r1
