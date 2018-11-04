.org 0x08064540
.word npc_walk_animations

.org 0x08064584
.word npc_walk_animations

.org 0x080645B4
.word npc_walk_animations

.org 0x0805BBA8
push {r4, lr}
ldr r4, [sp, #8] //block role
push {r4}
ldr r4, =npc_get_walkable_status+1
bl bxr4_npc_walk
add sp, #4
pop {r4}
pop {r1}
bx r1

bxr4_npc_walk:
    bx r4
.pool

.org 0x0805B9E4
    ldr r1, =npc_run_hook|1
    bx r1
.pool

.org 0x080BD308
    ldr r1, =npc_bike_hook|1
    bx r1
.pool

.org 0x08068A8C
    ldr r2, =little_steps_single_hook|1
    bx r2
.pool

.org 0x08068AAC
    ldr r2, =little_steps_double_hook|1
    bx r2
.pool

.org 0x08068AD0
    ldr r2, =little_steps_triple_hook|1
    bx r2
.pool

.org 0x08068AF8
    ldr r2, =little_steps_quad_hook|1
    bx r2
.pool

.org 0x08068B1C
    ldr r2, =little_steps_octa_hook|1
    bx r2
.pool



.org 0x08063A40
.word tile_movement_dirs

.org 0x08063A68
.word tile_movement_dirs

.org 0x08063AD0
.word tile_movement_dirs

