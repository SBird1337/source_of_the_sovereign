.align 2
.text
.thumb
.global bs_callasm
bs_callasm:

push {lr}
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
bl bxr1
cmp r0, #0
bne no_script_change
ldr r0, =0x02023D74
ldr r1, [r0]
add r1, #5
str r1, [r0]
no_script_change:
pop {r0}
bx r0

bxr1:
bx r1