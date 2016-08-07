.text
.align 2
.thumb

.global alloc_res_hook
alloc_res_hook:
str r0, [r4] @save last malloced data pointer
ldr r4, =0x02023FF4 @some battle struct pointer
mov r0, #0x20 @size of struct
bl malloc_and_clear
str r0, [r4]

bl malloc_battle_structs @allocate custom stuff
ldr r0, =0x0802E084|1
bx r0

.align 2
.global free_res_hook
free_res_hook:
ldr r4, =0x02022BBC
ldr r0, [r4]
bl free_routine
str r5, [r4]	@@null_pointer
bl free_battle_structs
ldr r0, =0x0802E200|1
bx r0

.align 2

malloc_and_clear:
ldr r3, =malloc
bx r3

free_routine:
ldr r3, =free
bx r3