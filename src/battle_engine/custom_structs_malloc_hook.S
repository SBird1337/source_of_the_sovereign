.text
.align 2
.thumb

.global alloc_res_hook
alloc_res_hook:

bl malloc_battle_structs
ldr r0, =0x0802E084|1
bx r0

.align 2

.global free_res_hook
free_res_hook:

bl free_battle_structs
ldr r0, =0x0802E200|1
bx r0