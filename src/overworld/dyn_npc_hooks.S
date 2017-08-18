.align 2
.thumb
.text

.global obj_delete_and_free_tiles_hook
obj_delete_and_free_tiles_hook:
	push {r4-r7,lr}
	mov r5, r0
    ldrb r0, [r5,#5]
    lsr r0, #4
    bl npc_dynamic_remove_entry
	mov r0, r5
	add r0, #0x3E
	ldrb r1, [r0]
	ldr r0, =0x8007288+1
	bx r0

.global obj_delete_all_hook
obj_delete_all_hook:
ldr r1, =obj_delete
bl bxr1
bl npc_dynamic_reset
pop {r4-r5}
pop {r0}
bx r0

bxr1:
bx r1