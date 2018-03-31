#include <pokeagb/pokeagb.h>

#define MAX_PAL_STORE 16
#define STRANGE_NPC_MAX 4

struct PalStoreEntry {
    u8 reference_count;
    u16 tag;
};

struct StrangeNpcStruct {
    u8 field0;
    u8 field1;
    u8 field2;
    u8 field3;
};

extern struct PalStoreEntry stored_palettes[16];

extern struct NpcType *npc_get_type(u16 id);

extern void dprintf(const char *str, ...);

extern struct StrangeNpcStruct strange_npc_table[4];

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
        dprintf("npc_dynamic: ATTENTION - TRIED TO ALLOCATE DYNOVER PALETTE WITHOUT SPACE LEFT, INCREASING ZERO "
                "REFERENCE\n");
        stored_palettes[0].reference_count++;
        return 0;
    }

    pal_patch_for_npc(tag, (u8)store_entry);

    return (u8)store_entry;
}

void ov_emot_load(struct Object *obj, u16 a2, u8 a3) {
    (void)npc_dynamic_load_palette(0x1100);
    obj->final_oam.priority = 2;
    obj->bitfield2 |= 2;
    obj->priv[0] = oe_state.effect_pos.x;
    obj->priv[1] = oe_state.effect_pos.y;
    obj->priv[2] = oe_state.priority;
    obj->priv[3] = -5;
    obj->priv[7] = a2;
    obj_anim_image_start(obj, a3);
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

void npc_restore_state(u8 id, u16 x, u16 y) {
    for (u8 i = 0; i < STRANGE_NPC_MAX; ++i) {
        if (strange_npc_table[i].field0 != 0) {
            if (strange_npc_table[i].field2 == id)
                return;
        }
    }

    struct NpcState *npc_to_load = &npc_states[id];
    u16 type_id = ((u16)npc_to_load->type_id) | (((u16)npc_to_load->field1A << 8));
    struct NpcType *type_to_load = npc_get_type(type_id);

    struct Template template_to_load;
    u32 f14;
    npc_to_objtemplate__with_indexed_objfunc(type_id, npc_to_load->running_behavior, &template_to_load, &f14);
    template_to_load.pal_tag = 0xFFFF;
    s8 pal_slot = npc_dynamic_load_palette(type_to_load->pal_num);

    /*template_to_load.pal_tag = type_to_load->pal_num;
    gpu_pal_obj_alloc_tag_and_apply(&npc_palettes[npc_pal_idx_for_given_tag(type_to_load->pal_num)]);
    u8 pal_slot = gpu_pal_tags_index_of(type_to_load->pal_num);*/

    u8 obj_id = template_instanciate_forward_search(&template_to_load, 0, 0, 0);

    if (obj_id == 64)
        return;

    struct Object *npc_obj = &objects[obj_id];
    npc_fix_position(x + npc_to_load->to.x, y + npc_to_load->to.y, &npc_obj->pos1.x, &npc_obj->pos1.y);
    npc_obj->shift.x = -(type_to_load->pos_neg_center.x / 2);
    npc_obj->shift.y = -(type_to_load->pos_neg_center.y / 2);
    npc_obj->pos1.x += 8;
    npc_obj->pos1.y += (s8)npc_obj->shift.y + 16;
    npc_obj->gfx_table = type_to_load->gfx_table;
    if (npc_to_load->running_behavior == 11) {
        walkrun_init_something(id, obj_id);
        npc_to_load->oamid2 = arrow_init_something();
    }

    if (f14 != 0) {
        (void)obj_set_f18_to_r0_f42_to_40(npc_obj, f14);
    }

    npc_obj->final_oam.palette_num = pal_slot;
    npc_obj->bitfield2 |= 2;
    npc_obj->priv[0] = id;
    npc_to_load->oam_id = obj_id;
    if (!(npc_to_load->field1 & 0x10) && (npc_to_load->running_behavior != 11)) {
        obj_anim_image_start(npc_obj, npc_direction_to_obj_anim_image_number(npc_to_load->direction & 0xF));
    }

    npc_805EFF4(npc_to_load);
    npc_y_height_related(npc_to_load->height >> 4, npc_obj, 1);
}

u8 npc_spawn_with_provided_template(struct RomNpc *npc, struct Template *template, u8 map, u8 bank, s16 x, s16 y) {
    u8 state = rom_npc_to_npc_state(npc, map, bank);
    if (state >= 16)
        return 16;

    struct NpcState *created_state = &npc_states[state];
    struct NpcType *type = npc_get_type(created_state->type_id | (npc->field3 << 8));

    s8 pal_slot = npc_dynamic_load_palette(type->pal_num);

    // gpu_pal_obj_alloc_tag_and_apply(&npc_palettes[npc_pal_idx_for_given_tag(type->pal_num)]);
    // u8 pal_slot = gpu_pal_tags_index_of(type->pal_num);

    if (created_state->running_behavior == 76)
        created_state->field1 |= 0x20;
    template->pal_tag = 0xFFFF;
    // template->pal_tag = type->pal_num;
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
        obj_anim_image_start(npc_object, npc_direction_to_obj_anim_image_number(created_state->direction & 0xF));
    }
    npc_y_height_related(created_state->height >> 4, npc_object, 1);
    npc_obj_offscreen_culling_and_flag_update(created_state, npc_object);
    return state;
}

void npc_delete_obj_and_free_tiles_for_npc_hack(struct NpcState *state) {
    struct SpriteTiles tiles;
    u16 npc_id = ((u16)state->type_id) | (((u16)state->field1A << 8));
    struct NpcType *type = npc_get_type(npc_id);
    tiles.size = type->field_6;
    objects[state->oam_id].gfx_table = &tiles;
    u8 pal_num = objects[state->oam_id].final_oam.palette_num;
    obj_delete_and_free(&objects[state->oam_id]);
    npc_dynamic_remove_entry(pal_num);
    dprintf("deleted npc state at x: %d y: %d\n", state->to.x, state->to.y);
}
