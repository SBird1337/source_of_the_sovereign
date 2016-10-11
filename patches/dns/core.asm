.org 0x08059A90
    ldr r3, =mapdata_load_palette_one+1
    bx r3
    .pool

.org 0x08059AA0
    ldr r3, =mapdata_load_palette_two+1
    bx r3
    .pool

.org 0x0805F538
    ldr r2, =pal_patch_for_npc+1
    bx r2
    .pool

.org 0x08083614
    ldr r1, =overworld_anim_load_pal+1
    bx r1
    .pool

.org 0x08056578
    ldr r0, =overworld_loop+1
    bx r0
    .pool