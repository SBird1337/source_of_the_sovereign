.align 2
.text
.thumb

.global npc_spawn_hook:
npc_spawn_hook:
    ldrh r0, [r6, #2]
    bl dynamic_npc_load_palette
    lsl r1, r0, #4
