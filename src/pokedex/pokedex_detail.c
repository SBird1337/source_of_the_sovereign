#include <agb_debug.h>
#include <pokeagb/pokeagb.h>
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

void dexdetail_load_pokemon(u16 dexindex) {
    u16 species = pokedex_context->lookup[dexindex].species;
    rboxid_clear_pixels(TB_PKNAME, 0);
    rboxid_clear_pixels(TB_PKSIZE, 0);
    rboxid_clear_pixels(TB_DESC, 0);
    u16 twidth = font_get_width_of_string(FONT_DEX_STD, &pokemon_names[species][0], 0x0000);
    rboxid_print(TB_PKNAME, FONT_DEX_STD, TB_STD_CENTER(twidth, 8 * TB_PKNAME_W), 0, &pdex_text_color, 0,
                 &pokemon_names[species][0]);

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

    rboxid_print(TB_PKSIZE, FONT_DEX_STD, TB_STD_RIGHT(weightTwidth, TB_SW_W * 8) - 6, 1, &pdex_text_color, 0,
                 string_buffer);

    u16 sizeNumber = pokedex_data[dexindex].height / 10;
    u16 sizeDecimal = pokedex_data[dexindex].height % 10;
    fmt_int_10(string_buffer, sizeNumber, 0, 3);
    fmt_int_10(&buffer[0], sizeDecimal, 0, 1);
    pstrcat(string_buffer, pdex_str_comma);
    pstrcat(string_buffer, buffer);
    pstrcat(string_buffer, pdex_str_size_unit);

    rboxid_print(TB_PKSIZE, FONT_DEX_STD, TB_STD_RIGHT(weightTwidth, TB_SW_W * 8) - 6, 14, &pdex_text_color, 0,
                 string_buffer);

    rboxid_print(TB_DESC, FONT_DEX_STD, 3, 2, &pdex_text_color, 0, pokedex_data[dexindex].description1);

    /* load the species sprite */
    if (pokedex_context->detail_pokemon_oam != -1) {

    } else {
        struct SpriteTiles pkmnTiles = {pokemon_graphics_front[species].data, 2048, DEX_PKMN_TAG};
        struct SpritePalette pkmnPal = {pokemon_palette_normal[species].data, DEX_PKMN_TAG};
        const struct Template pkmnTemplate = {
            .tiles_tag = DEX_PKMN_TAG,
            .pal_tag = DEX_PKMN_TAG,
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

    rboxid_update_tilemap_and_tileset(TB_DESC);
    rboxid_update_tilemap_and_tileset(TB_PKNAME);
    rboxid_update_tilemap_and_tileset(TB_PKSIZE);
}

void dexdetail_loop(u8 tid) {
    (void)tid;
    switch (pokedex_context->state) {
    case 0:
        bgid_send_tilemap(2);
        dexdetail_load_pokemon(pokedex_context->cursor_position_top + pokedex_context->cursor_position_internal);

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
    default:
        break;
    }
}

void dexdetail_load_gfx(void) {
    rbox_init_from_templates(&dexdetail_boxes[0]);
    lz77UnCompVram(pdexDetailBgTiles, (void *)0x0600C000);
    LZ77UnCompWram(pdexDetailBgMap, bgid_get_tilemap(2));
    gpu_pal_apply_compressed(pdexDetailBgPal, 0, 32);
    gpu_pal_apply(pdex_text_pal, 15 * 16, 32);

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
    task_add(dexdetail_loop, 0);
    set_callback2(pdex_cb_handler);
}