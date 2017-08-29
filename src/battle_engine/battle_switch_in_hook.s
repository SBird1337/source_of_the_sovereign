.text
.align 2
.thumb

.global battle_switch_in_hook
battle_switch_in_hook:
    ldr r1, =0xFDFF
    and r1, r2
    strh r1, [r0]
    mov r4, #0
    push {r0-r3}
    bl battle_switch_in
    pop {r0-r3}
    ldr r0, =0x08024FEC|1
    bx r0
