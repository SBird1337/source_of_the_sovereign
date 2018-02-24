#include <agb_debug.h>
#include <pokeagb/pokeagb.h>
#include <pokedex/pdexArrowRotated.h>
#include <pokedex/pdexDetailBg.h>

#include "pokedex_common.h"

#define TB_PKNAME 0
#define TB_PKSIZE 1
#define TB_DESC 2

#define TB_PKNAME_W 30
#define TB_SW_W 12

extern pchar pdex_entry_debug[];
extern pchar pdex_str_size[];
extern pchar pdex_str_weight[];
extern pchar pdex_str_size_unit[];
extern pchar pdex_str_weight_unit[];
extern pchar pdex_str_comma[];

struct TextboxTemplate dexdetail_boxes[] = {
    {.bg_id = 0, .x = 0, .y = 0, .width = TB_PKNAME_W, .height = 4, .pal_id = 15, .charbase = 1},
    {.bg_id = 0, .x = 17, .y = 5, .width = TB_SW_W, .height = 4, .pal_id = 15, .charbase = 121},
    {.bg_id = 1, .x = 1, .y = 0, .width = 28, .height = 20, .pal_id = 15, .charbase = 161},

    {.bg_id = 0xFF},
};

u8 dexdetail_type_to_oam_type[18] = {0, 9, 8, 12, 6, 5, 11, 10, 14, 17, 1, 2, 3, 4, 13, 7, 16, 15};

#define O_TYPE(t) (dexdetail_type_to_oam_type[t])

struct OamData dexdetail_type_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 1,
    .size = 2,
};

void dexdetail_update_type_oam(u8 type, struct Object *obj) {
    memcpy((void *)((0x06010000) + (obj->final_oam.tile_num * 0x20)),
           pokemon_type_chart_gfx + (128 * O_TYPE(type)) + (512 * (O_TYPE(type) >> 2)), 128);
    memcpy((void *)((0x06010000) + 128 + (obj->final_oam.tile_num * 0x20)),
           pokemon_type_chart_gfx + 512 + (128 * O_TYPE(type)) + (512 * (O_TYPE(type) >> 2)), 128);
}

s8 dexdetail_load_type_oam(u8 type, u16 tag) {
    struct SpriteTiles typeTiles = {(&pokemon_type_chart_gfx[0]) + 256 * O_TYPE(type), 256, tag};
    gpu_tile_obj_alloc_tag_and_upload(&typeTiles);
    const struct Template typeTemplate = {
        .tiles_tag = tag,
        .pal_tag = DEX_DETAIL_TYPEPAL,
        .oam = &dexdetail_type_oam,
        .animation = &anim_image_empty,
        .graphics = &typeTiles,
        .rotscale = &rotscale_empty,
        .callback = oac_nullsub,
    };
    s8 id = (s8)template_instanciate_forward_search(&typeTemplate, 100, 100, 0);
    dexdetail_update_type_oam(type, &objects[id]);
    return id;
}

extern pchar pdex_str_form_alola[];

void dexdetail_load_pokemon(u16 dexindex, enum DexFormType formType) {
    u16 species = pdex_lazy_lookup_entry(dexindex)->species;
    rboxid_clear_pixels(TB_PKNAME, 0);
    rboxid_clear_pixels(TB_PKSIZE, 0);
    rboxid_clear_pixels(TB_DESC, 0);
    pstrcpy(string_buffer, &pokemon_names[species][0]);
    switch (formType) {
    case ALOLA:
        pstrcat(string_buffer, pdex_str_form_alola);
        break;
    default:
        break;
    }
    u16 twidth = font_get_width_of_string(FONT_DEX_STD, string_buffer, 0x0000);
    rboxid_print(TB_PKNAME, FONT_DEX_STD, TB_STD_CENTER(twidth, 8 * TB_PKNAME_W), 0, &pdex_text_color, 0,
                 string_buffer);

    pchar *strType = &pokedex_data[dexindex].category_name[0];
    u16 typeTwidth = font_get_width_of_string(FONT_DEX_STD, strType, 0x0000);
    rboxid_print(TB_PKNAME, FONT_DEX_STD, TB_STD_CENTER(typeTwidth, 88) + 110, 14, &pdex_text_color, 0, strType);
    rboxid_print(TB_PKSIZE, FONT_DEX_STD, 4, 1, &pdex_text_color, 0, pdex_str_size);
    rboxid_print(TB_PKSIZE, FONT_DEX_STD, 4, 14, &pdex_text_color, 0, pdex_str_weight);

    u16 weightNumber = pokedex_data[dexindex].weight / 10;
    u16 weightDecimal = pokedex_data[dexindex].weight % 10;
    pchar buffer[20];
    fmt_int_10(string_buffer, weightNumber, 0, 3);
    fmt_int_10(&buffer[0], weightDecimal, 0, 1);
    pstrcat(string_buffer, pdex_str_comma);
    pstrcat(string_buffer, buffer);
    pstrcat(string_buffer, pdex_str_weight_unit);
    u16 weightTwidth = font_get_width_of_string(FONT_DEX_STD, string_buffer, 0x0000);

    rboxid_print(TB_PKSIZE, FONT_DEX_STD, TB_STD_RIGHT(weightTwidth, TB_SW_W * 8) - 6, 14, &pdex_text_color, 0,
                 string_buffer);

    u16 sizeNumber = pokedex_data[dexindex].height / 10;
    u16 sizeDecimal = pokedex_data[dexindex].height % 10;
    fmt_int_10(string_buffer, sizeNumber, 0, 3);
    fmt_int_10(&buffer[0], sizeDecimal, 0, 1);
    pstrcat(string_buffer, pdex_str_comma);
    pstrcat(string_buffer, buffer);
    pstrcat(string_buffer, pdex_str_size_unit);

    rboxid_print(TB_PKSIZE, FONT_DEX_STD, TB_STD_RIGHT(weightTwidth, TB_SW_W * 8) - 6, 1, &pdex_text_color, 0,
                 string_buffer);

    rboxid_print(TB_DESC, FONT_DEX_STD, 3, 2, &pdex_text_color, 0, pokedex_data[dexindex].description1);

    /* load the species sprite */
    if (pokedex_context->detail_pokemon_oam != -1) {
        lz77UnCompVram(
            pokemon_graphics_front[species].data,
            ((void *)(objects[pokedex_context->detail_pokemon_oam].final_oam.tile_num * 32) + ADDR_VRAM + 0x10000));
        gpu_pal_apply_compressed(pokemon_palette_normal[species].data,
                                 16 * (objects[pokedex_context->detail_pokemon_oam].final_oam.palette_num + 16), 32);
    } else {
        struct SpriteTiles pkmnTiles = {pokemon_graphics_front[species].data, 2048, DEX_PKMN_TAG_ONE};
        struct SpritePalette pkmnPal = {pokemon_palette_normal[species].data, DEX_PKMN_TAG_ONE};
        const struct Template pkmnTemplate = {
            .tiles_tag = DEX_PKMN_TAG_ONE,
            .pal_tag = DEX_PKMN_TAG_ONE,
            .oam = &pdex_oam_pkmn,
            .animation = &anim_image_empty,
            .graphics = &pkmnTiles,
            .rotscale = &rotscale_empty,
            .callback = oac_nullsub,
        };
        gpu_tile_obj_decompress_alloc_tag_and_upload(&pkmnTiles);

        gpu_pal_decompress_alloc_tag_and_upload(&pkmnPal);
        pokedex_context->detail_pokemon_oam = (s8)template_instanciate_forward_search(&pkmnTemplate, 10, 10, 0);

        objects[pokedex_context->detail_pokemon_oam].pos1.x = 55;
        objects[pokedex_context->detail_pokemon_oam].pos1.y = 55;
    }

    // draw the first type icon
    if (pokedex_context->detail_type_oam[0] != -1) {
        dexdetail_update_type_oam(pokemon_base_stats[species].type[0], &objects[pokedex_context->detail_type_oam[0]]);
    } else {
        pokedex_context->detail_type_oam[0] =
            dexdetail_load_type_oam(pokemon_base_stats[species].type[0], DEX_DETAIL_TYPE1);
        objects[pokedex_context->detail_type_oam[0]].pos1.x = 156;
        objects[pokedex_context->detail_type_oam[0]].pos1.y = 80;
    }
    // draw the second type icon eventually
    if (pokemon_base_stats[species].type[0] != pokemon_base_stats[species].type[1]) {
        if (pokedex_context->detail_type_oam[1] != -1) {
            dexdetail_update_type_oam(pokemon_base_stats[species].type[1],
                                      &objects[pokedex_context->detail_type_oam[1]]);
        } else {
            pokedex_context->detail_type_oam[1] =
                dexdetail_load_type_oam(pokemon_base_stats[species].type[1], DEX_DETAIL_TYPE2);
            objects[pokedex_context->detail_type_oam[1]].pos1.x = 210;
            objects[pokedex_context->detail_type_oam[1]].pos1.y = 80;
        }
        OBJID_SHOW(pokedex_context->detail_type_oam[1]);
    } else {
        OBJID_HIDE(pokedex_context->detail_type_oam[1]);
    }
    rboxid_update_tilemap_and_tileset(TB_DESC);
    rboxid_update_tilemap_and_tileset(TB_PKNAME);
    rboxid_update_tilemap_and_tileset(TB_PKSIZE);
}

void dexdetail_update_form(u16 form) {
    REG_DISPCNT &= ~((1 << 8) | (1 << 9));
    if (form == 0) {
        dexdetail_load_pokemon(pokedex_context->cursor_position_top + pokedex_context->cursor_position_internal,
                               NORMAL);
    } else {
        form--;
        if (pokedex_context->detail_forms[form].index > PDEX_LAST_SHOWN) {
            dexdetail_load_pokemon(pokedex_context->detail_forms[form].index, pokedex_context->detail_forms[form].type);
        } else {
            // update the oam only
            u16 species = pokedex_context->detail_forms[form].species;
            lz77UnCompVram(
                pokemon_graphics_front[species].data,
                ((void *)(objects[pokedex_context->detail_pokemon_oam].final_oam.tile_num * 32) + ADDR_VRAM + 0x10000));
            gpu_pal_apply_compressed(pokemon_palette_normal[species].data,
                                     16 * (objects[pokedex_context->detail_pokemon_oam].final_oam.palette_num + 16),
                                     32);
        }
    }
    REG_DISPCNT |= ((1 << 8) | (1 << 9));
}

struct DexFormEntry *dexdetail_get_forms(u16 index) {
    u16 current = 0;
    while (pdex_forms[current].index != 0xFFFF) {
        if (pdex_forms[current].index == index)
            return &pdex_forms[current].forms[0];
        current++;
    }
    return NULL;
}

void dexdetail_oac_arrow(struct Object *obj) {
    if (pokedex_context->detail_forms != NULL) {
        if (obj->priv[0]) {
            // this is the left arrow
            if (pokedex_context->detail_form_position != 0) {
                obj->final_oam.palette_num = obj->priv[1];
            } else {
                obj->final_oam.palette_num = obj->priv[2];
            }
        } else {
            // this is the right arrow
            if (pokedex_context->detail_forms[pokedex_context->detail_form_position].type != FORM_END) {
                obj->final_oam.palette_num = obj->priv[1];
            } else {
                obj->final_oam.palette_num = obj->priv[2];
            }
        }
    }
}

struct SpriteTiles pdex_arrow_rot_tiles = {pdexArrowRotatedTiles, 256, DEX_ARROW_TAG};
struct SpritePalette pdex_arrow_rot_pal = {pdexArrowRotatedPal, DEX_ARROW_TAG};
struct SpritePalette pdex_arrow_rot_pal_gray = {pdexArrowRotatedPal, DEX_ARROW_TAG_EPAL};

const struct OamData pdex_arrow_rot_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 1,
};

const struct Template pdex_arrow_rot_template = {
    .tiles_tag = DEX_ARROW_TAG,
    .pal_tag = DEX_ARROW_TAG,
    .oam = &pdex_arrow_rot_oam,
    .animation = &anim_image_empty,
    .graphics = &pdex_arrow_rot_tiles,
    .rotscale = &rotscale_empty,
    .callback = dexdetail_oac_arrow,
};

void dexdetail_load_form_arrows(void) {
    gpu_tile_obj_decompress_alloc_tag_and_upload(&pdex_arrow_rot_tiles);
    u8 normalPal = gpu_pal_obj_alloc_tag_and_apply(&pdex_arrow_rot_pal);
    u8 grayPal = gpu_pal_obj_alloc_tag_and_apply(&pdex_arrow_rot_pal_gray);
    tint_palette_gray(&palette_bg_unfaded[16 * (16 + grayPal)], 16);
    u8 leftArrow = template_instanciate_forward_search(&pdex_arrow_rot_template, 10, 55, 0);
    u8 rightArrow = template_instanciate_forward_search(&pdex_arrow_rot_template, 100, 55, 0);
    objects[leftArrow].priv[0] = true;
    objects[leftArrow].final_oam.h_flip = true;
    objects[leftArrow].priv[1] = normalPal;
    objects[leftArrow].priv[2] = grayPal;
    objects[rightArrow].priv[0] = false;
    objects[rightArrow].priv[1] = normalPal;
    objects[rightArrow].priv[2] = grayPal;
    pokedex_context->detail_arrows_oam[0] = leftArrow;
    pokedex_context->detail_arrows_oam[1] = rightArrow;
}

void dexdetail_loop(u8 tid) {
    u16 currentIndex = pokedex_context->cursor_position_top + pokedex_context->cursor_position_internal;
    switch (pokedex_context->state) {
    case 0:
        bgid_send_tilemap(2);
        dexdetail_load_form_arrows();
        dexdetail_load_pokemon(currentIndex, NORMAL);
        pokedex_context->detail_form_position = 0;
        struct DexFormEntry *forms = dexdetail_get_forms(currentIndex);
        if (forms != NULL) {
            OBJID_SHOW(pokedex_context->detail_arrows_oam[0]);
            OBJID_SHOW(pokedex_context->detail_arrows_oam[1]);
        } else {
            OBJID_HIDE(pokedex_context->detail_arrows_oam[0]);
            OBJID_HIDE(pokedex_context->detail_arrows_oam[1]);
        }
        dprintf("test: %d", pokedex_index_to_species(1000));
        pokedex_context->detail_forms = forms;

        palette_bg_faded_fill_black();
        pokedex_context->state++;
        break;
    case 1:
        gpu_sync_bg_show(0);
        gpu_sync_bg_show(1);
        gpu_sync_bg_hide(3);

        gpu_sync_bg_show(2);
        fade_screen(0xFFFFFFFF, PDEX_FADEIN_SPD, 16, 0, 0x0000);
        pokedex_context->state++;
        break;
    case 2:
        if (!pal_fade_control.active) {
            pokecry_play(pdex_lazy_lookup_entry(currentIndex)->species, 0);
            pokedex_context->state++;
        }
        break;
    case 3:
        switch (super.buttons_new) {
        case KEY_B:
            pokedex_context->state = 12;
            u16 dexindex = pokedex_context->cursor_position_top + pokedex_context->cursor_position_internal;
            if (dexindex <= PDEX_LAST_SHOWN - 7) {
                pokedex_context->cursor_position_top = dexindex;
                pokedex_context->cursor_position_internal = 0;
            } else {
                pokedex_context->cursor_position_top = PDEX_LAST_SHOWN - 7;
                pokedex_context->cursor_position_internal = (dexindex - pokedex_context->cursor_position_top);
            }
            m4aSongNumStart(601);
            fade_screen(0xFFFFFFFF, PDEX_FADEIN_SPD, 0, 16, 0x0000);
            break;
        case KEY_LEFT:
            if (pokedex_context->detail_form_position != 0) {
                pokedex_context->detail_form_position--;
                dexdetail_update_form(pokedex_context->detail_form_position);
            }
            break;
        case KEY_RIGHT:
            if (pokedex_context->detail_forms[pokedex_context->detail_form_position].type != FORM_END) {
                pokedex_context->detail_form_position++;
                dexdetail_update_form(pokedex_context->detail_form_position);
            }
            break;
        case KEY_START:
            pokecry_play(pdex_lazy_lookup_entry(currentIndex)->species, 0);
        }
        break;
    case 12:
        if (!pal_fade_control.active) {
            task_del(tid);
            pdex_vram_free_bgmaps();
            set_callback2(pdex_load);
        }
        break;
    default:
        break;
    }
}

struct SpritePalette dexdetail_type_pal = {&pokemon_type_chart_pal[0], DEX_DETAIL_TYPEPAL};

void dexdetail_load_gfx(void) {
    rbox_init_from_templates(&dexdetail_boxes[0]);
    lz77UnCompVram(pdexDetailBgTiles, (void *)0x0600C000);
    LZ77UnCompWram(pdexDetailBgMap, bgid_get_tilemap(2));
    gpu_pal_apply_compressed(pdexDetailBgPal, 0, 32);
    gpu_pal_apply(pdex_text_pal, 15 * 16, 32);
    gpu_pal_obj_alloc_tag_and_apply(&dexdetail_type_pal);

    lcd_io_set(REG_ID_WIN0H, (8 << 8) | (232));
    lcd_io_set(REG_ID_WIN0V, ((100 << 8) | (160)));
    lcd_io_set(REG_ID_WININ, WIN_BG0 | WIN_BG1 | WIN_BG2 | WIN_BG3 | WIN_OBJ);
    lcd_io_set(REG_ID_WINOUT, WIN_BG0 | WIN_BG2 | WIN_BG3 | WIN_OBJ);
    bgid_mod_y_offset(1, -24576, 1);
    bgid_mark_for_sync(0);
}

void dexdetail_load(void) {
    pdex_vram_setup();
    dexdetail_load_gfx();
    pokedex_context->state = 0;
    pokedex_context->detail_pokemon_oam = -1;
    pokedex_context->detail_type_oam[0] = -1;
    pokedex_context->detail_type_oam[1] = -1;
    task_add(dexdetail_loop, 0);
    set_callback2(pdex_cb_handler);
}