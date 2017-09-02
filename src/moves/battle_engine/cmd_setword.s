.text
.align 2
.thumb
.global bs_setword
bs_setword:
ldr r0, =0x02023D74 @current script location
ldr r0, [r0]
ldrb r1, [r0, #1]
ldrb r2, [r0, #2]
lsl r2, #0x8
orr r1, r2
ldrb r2, [r0, #3]
ldrb r3, [r0, #4]
lsl r2, #0x10
orr r1, r2
lsl r3, #0x18
orr r1, r3
add r0, #5
ldrb r2, [r0, #0]
ldrb r3, [r0, #1]
lsl r3, #0x8
orr r2, r3
ldrb r3, [r0, #2]
lsl r3, #0x10
orr r2, r3
ldrb r3, [r0, #3]
lsl r3, #0x18
orr r2, r3
str r2, [r1]
add r0, #4
ldr r1, =0x02023D74
str r0, [r1]
bx lr