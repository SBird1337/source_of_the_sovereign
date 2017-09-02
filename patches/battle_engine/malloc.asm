.org 0x0802E078
ldr r1, =alloc_res_hook|1
bx r1

.pool

.org 0x0802E224
.word free_res_hook|1

.org 0x0802E1F8
bx r4