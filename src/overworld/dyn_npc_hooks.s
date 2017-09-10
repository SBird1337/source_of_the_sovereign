.align 2
.thumb
.text

.global obj_delete_and_free_tiles_hook
obj_delete_and_free_tiles_hook:
	push {r4-r7,lr}
	mov r5, r0
	ldr r0, [r5, #0x14] @template
	ldr r1, =0x8231D00 @ template for empty OBJ
	cmp r0, r1
	beq no_entry_remove
    ldrb r0, [r5,#5]
	ldr r1, [r5, #0x14]
	ldrh r1, [r1,#2] @tag
    lsr r0, #4
    bl npc_dynamic_remove_entry
no_entry_remove:
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
