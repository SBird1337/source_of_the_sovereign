#include <pokeagb/pokeagb.h>

#define MAX_PAL_STORE 16

struct PalStoreEntry {
    u8 reference_count;
    u16 tag;
};

extern struct PalStoreEntry stored_palettes[16];

extern struct NpcType *npc_get_type(u16 id);

extern void dprintf(const char *str, ...);

s8 npc_dynamic_find_palette(u16 tag) {
    for (s8 i = 0; i < MAX_PAL_STORE; ++i) {
        if (stored_palettes[i].reference_count > 0 && stored_palettes[i].tag == tag)
            return i;
    }
    return -1;
}

s8 npc_dynamic_allocate_palette(u16 tag) {
    for (s8 i = 0; i < MAX_PAL_STORE; ++i) {
        if (stored_palettes[i].reference_count == 0) {
            stored_palettes[i].tag = tag;
            stored_palettes[i].reference_count++;
            return i;
        }
    }
    return -1;
}

u8 npc_dynamic_load_palette(u16 tag) {
    s8 store_entry = npc_dynamic_find_palette(tag);
    if (store_entry != -1) {
        stored_palettes[store_entry].reference_count++;
        return store_entry;
    }
    store_entry = npc_dynamic_allocate_palette(tag);
    if (store_entry == -1) {
        /* we do not have allocation space left */
        dprintf("ATTENTION: TRIED TO ALLOCATE DYNOVER PALETTE WITHOUT SPACE LEFT, INCREASING ZERO REFERENCE\n");
        stored_palettes[0].reference_count++;
        return 0;
    }

    pal_patch_for_npc(tag, (u8)store_entry);

    return (u8)store_entry;
}

void npc_dynamic_reset() {
    for (u8 i = 0; i < MAX_PAL_STORE; ++i) {
        stored_palettes[i].reference_count = 0;
        stored_palettes[i].tag = 0;
    }
}

void npc_dynamic_remove_entry(u8 id) {
    if (stored_palettes[id].reference_count > 0) {
        stored_palettes[id].reference_count--;
        dprintf("npc_dynamic: removed entry #%d\n", id);
        if (stored_palettes[id].reference_count == 0)
            stored_palettes[id].tag = 0;
    }
}

u8 npc_spawn_with_provided_template(struct RomNpc *npc, struct Template *template, u8 map, u8 bank, s16 x, s16 y) {
    u8 state = rom_npc_to_npc_state(npc, map, bank);
    if (state >= 16)
        return 16;

    struct NpcState *created_state = &npc_states[state];
    struct NpcType *type = npc_get_type(created_state->type_id | (npc->field3 << 8));
    s8 pal_slot = npc_dynamic_load_palette(type->pal_num);

    if (created_state->running_behavior == 76)
        created_state->field1 |= 0x20;
    template->pal_tag = 0xFFFF;
    u8 obj_id = template_instanciate_forward_search(template, 0, 0, 0);
    if (obj_id == 64) {
        created_state->bitfield &= 0xFE;
        return 16;
    }

    struct Object *npc_object = &objects[obj_id];
    npc_fix_position(x + created_state->to.x, y + created_state->to.y, &npc_object->pos1.x, &npc_object->pos1.y);
    npc_object->shift.x = -(type->pos_neg_center.x / 2);
    npc_object->shift.y = -(type->pos_neg_center.y / 2);
    npc_object->pos1.x += 8;
    npc_object->pos1.y += (s8)npc_object->shift.y + 16;

    /* Set our allocated index */
    npc_object->final_oam.palette_num = pal_slot;
    npc_object->bitfield2 |= 2;
    npc_object->priv[0] = state;
    created_state->oam_id = obj_id;

    u8 unknown = (created_state->field1 & 0xEF) | (16 * (type->pal_slot_unk << 25 >> 31));
    created_state->field1 = unknown;
    if (!(unknown & 0x10)) {
        obj_anim_image_start(npc_object, npc_direction_to_obj_anim_image_number(created_state->direction));
    }
    npc_y_height_related(created_state->height >> 4, npc_object, 1);
    npc_obj_offscreen_culling_and_flag_update(created_state, npc_object);
    return state;
}
