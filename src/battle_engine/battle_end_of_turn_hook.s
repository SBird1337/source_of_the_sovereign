.text
.thumb
.align 2

.global battle_end_of_turn_hook
battle_end_of_turn_hook:
    push {lr}
    bl battle_end_of_turn
    pop {r0}
    mov lr, r0
    ldr r0, =0x08013BD5
    bx r0


