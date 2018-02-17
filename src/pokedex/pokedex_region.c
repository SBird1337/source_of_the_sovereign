#include <agb_debug.h>
#include <constants/pkmns.h>
#include <pokeagb/pokeagb.h>
#include <pokedex/pdexSelectBg.h>
#include <pokedex/pdexSelectRegion.h>

#include "pokedex_common.h"

void region_select_load(void);
extern const pchar *pdex_str_regions[];
extern const pchar *pdex_str_empty;

struct TextboxTemplate region_select_boxes[] = {
    {.bg_id = 0, .x = 4, .y = 7, .width = 6, .height = 3, .pal_id = 15, .charbase = 1},
    {.bg_id = 0, .x = 13, .y = 7, .width = 6, .height = 3, .pal_id = 15, .charbase = 19},
    {.bg_id = 0, .x = 22, .y = 7, .width = 6, .height = 3, .pal_id = 15, .charbase = 38},

    {.bg_id = 0, .x = 2, .y = 17, .width = 6, .height = 2, .pal_id = 15, .charbase = 57},
    {.bg_id = 0, .x = 9, .y = 17, .width = 6, .height = 2, .pal_id = 15, .charbase = 69},
    {.bg_id = 0, .x = 17, .y = 17, .width = 6, .height = 2, .pal_id = 15, .charbase = 81},
    {.bg_id = 0, .x = 24, .y = 17, .width = 6, .height = 2, .pal_id = 15, .charbase = 93},

    {.bg_id = 0xFF},
};

u8 region_text_x_offset[] = {2, 4, 2, 1, 5, 1, 4};
u8 region_text_y_offset[] = {7, 7, 7, 2, 2, 2, 2};
u8 region_select_x_offset[] = {54, 128, 198, 38, 97, 156, 215};
u8 region_select_y_offset[] = {40, 40, 40, 115, 115, 115, 115};

u16 region_icons[] = {PKMN_BISASAM,   PKMN_SCHIGGY,  PKMN_GLUMANDA, PKMN_ENDIVIE, PKMN_KARNIMANI, PKMN_FEURIGEL,
                     PKMN_GECKARBOR, PKMN_HYDROPI, PKMN_FLEMMLI,  PKMN_CHELAST, PKMN_PLINFA,    PKMN_PANFLAM,
                     PKMN_SERPIFEU,  PKMN_OTTARO,  PKMN_FLOINK,   PKMN_IGAMARO, PKMN_FROXY,     PKMN_FYNX,
                     PKMN_BAUZ,      PKMN_ROBBALL, PKMN_FLAMIAU};

u16 region_icons_x_offset[] = {37, 49, 58, 110, 122, 133, 183, 193, 206, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120};

u16 region_icons_y_offset[] = {39,  17,  39, 39,  19,  39, 39,  19,  39, 100, 90,
                              100, 100, 90, 100, 100, 90, 100, 100, 90, 100};

bool sm_pdex_init(void) {
    if (pal_fade_control.active)
        return false;
    audioDampenMaybe();
    sav1_secure_increment(0x29); // this is something the original dex routine does, probably for statistics
    /* maybe clean up safari stuff here if necessary */
    overworld_free_bgmaps();

    malloc_init((void *)0x2000000, 0x1C000);
    set_callback2(region_select_load);
    return true;
}

void region_select_load_gfx() {
    rbox_init_from_templates(&region_select_boxes[0]);
    lz77UnCompVram(pdexSelectBgTiles, (void *)0x0600C000);
    LZ77UnCompWram(pdexSelectBgMap, bgid_get_tilemap(2));
    gpu_pal_apply_compressed(pdexSelectBgPal, 0, 32);
    gpu_pal_apply(pdex_text_pal, 15 * 16, 32);
    bgid_mark_for_sync(0);
}

void region_oac_select(struct Object *obj) {
    obj->pos1.x = region_select_x_offset[pokedex_context->region_selected];
    obj->pos1.y = region_select_y_offset[pokedex_context->region_selected];
}

struct SpriteTiles region_select_tiles = {pdexSelectRegionTiles, 2048, DEX_REGION_SELECT};
struct SpritePalette region_select_pal = {pdexSelectRegionPal, DEX_REGION_SELECT};

const struct OamData region_select_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 3,
};

struct Template region_select_template = {
    .tiles_tag = DEX_REGION_SELECT,
    .pal_tag = DEX_REGION_SELECT,
    .oam = &region_select_oam,
    .animation = &anim_image_empty,
    .graphics = &region_select_tiles,
    .rotscale = &rotscale_empty,
    .callback = region_oac_select,
};

void region_load_icon_palettes(void) {
    for (u8 i = 0; i < 3; ++i) {
        struct SpritePalette current = {pokeicon_pals[i], DEX_REGION_PAL(i)};
        gpu_pal_obj_alloc_tag_and_apply(&current);
    }
}

const struct OamData region_icon_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 2,
};

void region_load_icon(u8 i) {
    struct SpriteTiles current = {pokeicon_table[region_icons[i]], 512, DEX_REGION_ICON(i)};
    gpu_tile_obj_alloc_tag_and_upload(&current);
    struct Template region_icon_template = {
        .tiles_tag = DEX_REGION_ICON(i),
        .pal_tag = DEX_REGION_PAL(pokeicon_pal_indices[region_icons[i]]),
        .oam = &region_icon_oam,
        .animation = &anim_image_empty,
        .graphics = &current,
        .rotscale = &rotscale_empty,
        .callback = oac_nullsub,
    };
    template_instanciate_forward_search(&region_icon_template, region_icons_x_offset[i], region_icons_y_offset[i], 0);
}

void region_load_border() {
    gpu_tile_obj_decompress_alloc_tag_and_upload(&region_select_tiles);
    gpu_pal_obj_alloc_tag_and_apply(&region_select_pal);
    (void)template_instanciate_forward_search(&region_select_template, 100, 100, 0);
}

void region_loop(u8 tid) {
    (void)tid;
    switch (pokedex_context->state) {
    case 0:
        bgid_send_tilemap(2);

        for (u8 i = 0; i < 7; ++i) {
            rboxid_clear_pixels(i, 0);
            rboxid_print(i, FONT_DEX_STD, region_text_x_offset[i], region_text_y_offset[i], &pdex_text_color, 0,
                         pdex_str_regions[i + 1]);
            rboxid_update_tilemap_and_tileset(i);
        }

        region_load_border();
        region_load_icon_palettes();
        for(u8 i = 0; i < 21; ++i)
            region_load_icon(i);
        
        palette_bg_faded_fill_black();
        pokedex_context->state++;
        break;
    case 1:
        gpu_sync_bg_show(0);
        gpu_sync_bg_hide(1);
        gpu_sync_bg_hide(3);

        gpu_sync_bg_show(2);
        fade_screen(0xFFFFFFFF, PDEX_FADEIN_SPD, 16, 0, 0x0000);
        pokedex_context->state++;
        break;
    case 2:
        if (!pal_fade_control.active)
            pokedex_context->state++;
        break;
    case 3:
        switch (super.buttons_new) {
        case KEY_RIGHT:
            if (pokedex_context->region_selected < 6)
                pokedex_context->region_selected++;
            break;
        case KEY_DOWN:
            if (pokedex_context->region_selected < 3)
                pokedex_context->region_selected += 3;
            break;
        case KEY_LEFT:
            if (pokedex_context->region_selected > 0)
                pokedex_context->region_selected--;
            break;
        case KEY_UP:
            if ((pokedex_context->region_selected > 2) && (pokedex_context->region_selected < 6))
                pokedex_context->region_selected -= 3;
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }
}

void region_select_load(void) {
    pdex_vram_setup();

    pokedex_context = malloc_and_clear(sizeof(struct PdexCtx));

    region_select_load_gfx();
    task_add(region_loop, 0);
    set_callback2(pdex_cb_handler);
}