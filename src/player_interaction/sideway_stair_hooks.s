.align 2
.thumb
.text
.global npc_run_hook

npc_run_hook:
    //we just got our result from npc_get_walkable_status in r0
    lsl r0, #0x18
    lsr r0, #0x18
    mov r6, r0
    bl npc_sideway_try_walking
    cmp r0, #1
    bne continue
walkable:
    ldr r6, =0x0805BA18|1
    bx r6
continue:
    mov r0, r6
    mov r1, r0
    cmp r0, #0
    beq walkable
    ldr r6, =0x0805B9EE|1
    bx r6

.global npc_bike_hook
npc_bike_hook:
    lsr r5, r0, #0x18
    bl npc_sideway_try_walking
    cmp r0, #0
    beq continue_bike
    pop {r4-r6}
    pop {r0}
    bx r0
    continue_bike:
    mov r1, r5
    sub r0, r1, #1
    ldr r2, =0x080BD312|1
    bx r2