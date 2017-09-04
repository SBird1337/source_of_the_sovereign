#include <oe_images/oea_grass_normal.h>
#include <pokeagb/pokeagb.h>

struct SpriteTiles sprite_tiles_grass_normal[5] = {{.data = oea_grass_normalTiles + (0x80/4) * 0, .tag = 0, .size = 0x80},
                                                   {.data = oea_grass_normalTiles + (0x80/4) * 1, .tag = 0, .size = 0x80},
                                                   {.data = oea_grass_normalTiles + (0x80/4) * 2, .tag = 0, .size = 0x80},
                                                   {.data = oea_grass_normalTiles + (0x80/4) * 3, .tag = 0, .size = 0x80},
                                                   {.data = oea_grass_normalTiles + (0x80/4) * 4, .tag = 0, .size = 0x80}};

struct Template grass_template_normal = {.tiles_tag = 0xFFFF,
                                         .pal_tag = 0x1005,
                                         .oam = &oam_data_grass,
                                         .animation = &anim_image_grass,
                                         .graphics = sprite_tiles_grass_normal,
                                         .rotscale = &rotscale_empty,
                                         .callback = oac_grass};

void grass_step_general(struct NpcState *npc) {
    oe_state.effect_pos.x = npc->to.x;
    oe_state.effect_pos.y = npc->to.y;
    oe_state.priority = (npc->height) >> 4;
    oe_state.field_c = 2;
    oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_map_number);
    oe_state.local_mapbank = npc->local_map_bank;
    oe_state.sav1_location = (((saveblock1->location.map) << 8) | saveblock1->location.bank);
    oe_state.field_1c = 1;
    (void)oe_exec(4);
}

void grass_step_elastic(struct NpcState *npc) {
    oe_state.effect_pos.x = npc->to.x;
    oe_state.effect_pos.y = npc->to.y;
    oe_state.priority = (npc->height) >> 4;
    oe_state.field_c = 2;
    oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_map_number);
    oe_state.local_mapbank = npc->local_map_bank;
    oe_state.sav1_location = (((saveblock1->location.map) << 8) | saveblock1->location.bank);
    oe_state.field_1c = 0;

    /* use variable to determine the oe animation to play */
    (void)oe_exec(4);
}

void oei_grass_normal(void) {
    s16 x = (s16)oe_state.effect_pos.x;
    s16 y = (s16)oe_state.effect_pos.y;
    oe_adjust_coordinates(&x, &y, 8, 8);
    u8 objid = template_instanciate_reverse_search(&grass_template_normal, x, y, 0);
    if (objid != 64) {
        struct Object *obj = &objects[objid];
        obj->bitfield2 |= 2;
        obj->final_oam.priority = oe_state.field_c & 3;
        obj->priv[0] = oe_state.priority;
        obj->priv[1] = oe_state.effect_pos.x;
        obj->priv[2] = oe_state.effect_pos.y;
        obj->priv[3] = oe_state.local_id_and_mapnumber;
        obj->priv[4] = oe_state.local_mapbank;
        obj->priv[5] = oe_state.sav1_location;
        if (oe_state.field_1c)
            obj_anim_image_seek(obj, 4);
    }
}