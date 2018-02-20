#include <agb_debug.h>
#include <pokeagb/pokeagb.h>
#include <pokedex/pdexDetailBg.h>

#include "pokedex_common.h"

#define TB_PKNAME 0
#define TB_PKSIZE 2
#define TB_PKWEIGHT 3
#define TB_DESC 2

#define TB_PKNAME_W 30
#define TB_SW_W 20

extern pchar pdex_entry_debug[];
extern pchar pdex_str_size[];
extern pchar pdex_str_weight[];
extern pchar pdex_str_size_unit[];
extern pchar pdex_str_weight_unit[];

struct TextboxTemplate dexdetail_boxes[] = {
    {.bg_id = 0, .x = 0, .y = 0, .width = TB_PKNAME_W, .height = 4, .pal_id = 15, .charbase = 1},

    {.bg_id = 1, .x = 1, .y = 0, .width = 28, .height = 20, .pal_id = 15, .charbase = 121},

    {.bg_id = 0xFF},
};

void dexdetail_load_pokemon(u16 dexindex) {
    u16 species = pokedex_context->lookup[dexindex].species;
    rboxid_clear_pixels(TB_PKNAME, 0);
    u16 twidth = font_get_width_of_string(FONT_DEX_STD, &pokemon_names[species][0], 0x0000);
    //rboxid_print(TB_PKNAME, FONT_DEX_STD, TB_STD_CENTER(twidth,8*TB_PKNAME_W), 0, &pdex_text_color, 0, &pokemon_names[species][0]);
    rboxid_print(TB_PKNAME, FONT_DEX_STD, 0, 0, &pdex_text_color, 0, pdex_entry_debug);
    pchar *strType = &pokedex_data[dexindex].category_name[0];
    u16 typeTwidth = font_get_width_of_string(FONT_DEX_STD, strType, 0x0000);
    rboxid_print(TB_PKNAME, FONT_DEX_STD, 50, 16, &pdex_text_color, 0, strType);
    rboxid_update_tilemap_and_tileset(TB_PKNAME);

}

void dexdetail_loop(u8 tid) {
    (void)tid;
    switch (pokedex_context->state) {
    case 0:
        bgid_send_tilemap(2);
        // rboxid_fill_rectangle(4, 1, 0, 0, 28 * 8, 20 * 8);
        dexdetail_load_pokemon(pokedex_context->cursor_position_top + pokedex_context->cursor_position_internal);
        //rboxid_clear_pixels(TB_DESC, 0);
        //rboxid_print(TB_DESC, FONT_DEX_STD, 3, 2, &pdex_text_color, 0, pdex_entry_debug);
        //rboxid_update_tilemap_and_tileset(TB_DESC);

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
    task_add(dexdetail_loop, 0);
    set_callback2(pdex_cb_handler);
}