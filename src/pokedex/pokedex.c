#include <agb_debug.h>
#include <constants/pkmns.h>
#include <pokeagb/pokeagb.h>
#include <pokedex/pdexBall.h>
#include <pokedex/pdexBg.h>
#include <pokedex/pdexSelectHalf.h>

#define PDEX_LAST_SHOWN PKMN_AMIGENTO

#define PDEX_FADEIN_SPD 1

#define TB_TITLE 0
#define TB_PKMN 1
#define TB_SEEN 2
#define TB_CAUGHT 3
#define TB_MAIN 4

#define FONT_DEX_STD 1
#define TB_STD_LEN 10
#define TB_STD_LEN_PX (TB_STD_LEN * 8)
#define TB_BOT_LEN 9
#define TB_BOT_LEN_PX (TB_BOT_LEN * 8)
#define TB_STD_CENTER(t) (((TB_STD_LEN_PX - t) >> 1) + 2)
#define TB_STD_RIGHT(t) ((TB_BOT_LEN_PX - t))

#define OBJID_HIDE(objid) objects[objid].final_oam.affine_mode = 2
#define OBJID_SHOW(objid) objects[objid].final_oam.affine_mode = 0

#define TB_SEEN_Y (6)
#define TB_CAUGHT_Y 3

#define DEX_PKMN_TAG 0x1300
#define DEX_BALL_TAG 0x1301
#define DEX_CURSOR_TAG 0x1302

#define MAX3_COUNT_DIGITS(n) (n >= 100 ? 3 : (n >= 10 ? 2 : 1))

#define CPUFSCPY 0
#define CPUFSSET 1
#define CPUModeFS(size, mode) ((size >> 2) | (mode << 24))

void pdex_load(void);
void pdex_vblank_handler(void);
void pdex_loop(u8 tid);
void pdex_cb_handler(void);

extern const pchar pdex_str_title[];
extern const pchar pdex_str_seen[];
extern const pchar pdex_str_caught[];
extern const pchar pdex_str_empty[];

static const u8 pdex_y_offset[] = {19, 34, 49, 64, 79, 94, 109, 124, 139};

const u16 pdex_text_pal[] = {rgb5(255, 0, 255), rgb5(255, 255, 255), rgb5(0, 0, 0),     rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255)};

struct TextColor pdex_text_color = {0, 1, 2};

struct TextboxTemplate pdex_boxes[] = {
    {.bg_id = 0, .x = 11, .y = 0, .width = 10, .height = 2, .pal_id = 15, .charbase = 1},
    {.bg_id = 0, .x = 2, .y = 2, .width = 10, .height = 2, .pal_id = 15, .charbase = 21},
    {.bg_id = 0, .x = 3, .y = 14, .width = 9, .height = 3, .pal_id = 15, .charbase = 41},
    {.bg_id = 0, .x = 3, .y = 17, .width = 9, .height = 2, .pal_id = 15, .charbase = 59},

    {.bg_id = 1, .x = 16, .y = 0, .width = 11, .height = 32, .pal_id = 15, .charbase = 77},

    {.bg_id = 0xFF},
};

const struct BgConfig pdex_bg_config[4] = {
    {
        .padding = 0,
        .b_padding = 0,
        .priority = 0,
        .palette = 0,
        .size = 0,
        .map_base = 29,
        .character_base = 0,
        .bgid = 0,
    },
    {
        .padding = 0,
        .b_padding = 0,
        .priority = 1,
        .palette = 0,
        .size = 0,
        .map_base = 28,
        .character_base = 0,
        .bgid = 1,
    },
    {
        .padding = 0,
        .b_padding = 0,
        .priority = 2,
        .palette = 0,
        .size = 0,
        .map_base = 30,
        .character_base = 3,
        .bgid = 2,
    },
    {
        .padding = 0,
        .b_padding = 0,
        .priority = 3,
        .palette = 0,
        .size = 1,
        .map_base = 31,
        .character_base = 3,
        .bgid = 3,
    },
};

s16 pdex_get_y_offset(s8 n) {
    s8 modOffset = n + pokedex_context->hardware_scroll_amount;
    s8 wrapOffset = 0;
    dprintf("mod_offset: %d\n", modOffset);
    if (modOffset < -1) {
        modOffset += 17;
        wrapOffset = 1;
    }

    if (modOffset > 15) {
        wrapOffset = -1;
        modOffset -= 17;
    }
    return (19 + (15 * modOffset)) + wrapOffset + (pokedex_context->overdo_amount);
}

void pdex_main_box_species_fill(s8 n, u16 species, bool seen, bool caught) {
    s16 y = pdex_get_y_offset(n);
    dprintf("trying to print box to y: %d\n", y);
    rboxid_fill_rectangle(TB_MAIN, 0, 0, y, 11 * 8, 15);
    const pchar *stringToPrint = (seen || caught) ? &pokemon_names[species][0] : &pdex_str_empty[0];
    const pchar stringWhitespace[] = {0x0, 0xFF};
    fmt_int_10(string_buffer, pokedex_context->cursor_position_top + n, 2, 3);
    pstrcat(string_buffer, &stringWhitespace[0]);
    pstrcat(string_buffer, stringToPrint);
    rboxid_print(TB_MAIN, FONT_DEX_STD, 4, y, &pdex_text_color, 0, string_buffer);
}

void pdex_update_balls(void) {
    for (u8 i = 0; i < 9; ++i) {
        if (pokedex_context->lookup[i + pokedex_context->cursor_position_top].caught)
            OBJID_SHOW(pokedex_context->ball_oams[i]);
        else
            OBJID_HIDE(pokedex_context->ball_oams[i]);
    }
}

void pdex_update_page_full() {
    rboxid_clear_pixels(TB_MAIN, 0);
    for (s8 i = pokedex_context->cursor_position_top; i < pokedex_context->cursor_position_top + 9; ++i) {
        pdex_main_box_species_fill(i - pokedex_context->cursor_position_top, pokedex_context->lookup[i].species,
                                   pokedex_context->lookup[i].seen, pokedex_context->lookup[i].caught);
    }
    pdex_update_balls();
    rboxid_update_tilemap_and_tileset(TB_MAIN);
}

void pdex_load_sc(void) {
    rboxid_clear_pixels(TB_SEEN, 0);
    rboxid_clear_pixels(TB_CAUGHT, 0);
    u32 seen = pokedex_count(false) + 10;
    u32 caught = pokedex_count(true);
    pchar seenBuffer[4];
    pchar caughtBuffer[4];
    fmt_int_10(seenBuffer, seen, 0, MAX3_COUNT_DIGITS(seen));
    fmt_int_10(caughtBuffer, caught, 0, MAX3_COUNT_DIGITS(caught));

    u32 twidthSeen = font_get_width_of_string(FONT_DEX_STD, seenBuffer, 0x0000);
    u32 twidthCaught = font_get_width_of_string(FONT_DEX_STD, caughtBuffer, 0x0000);

    rboxid_print(TB_SEEN, FONT_DEX_STD, 0, TB_SEEN_Y, &pdex_text_color, 0, &pdex_str_seen[0]);
    rboxid_print(TB_CAUGHT, FONT_DEX_STD, 0, TB_CAUGHT_Y, &pdex_text_color, 0, &pdex_str_caught[0]);

    rboxid_print(TB_SEEN, FONT_DEX_STD, TB_STD_RIGHT(twidthSeen), TB_SEEN_Y + 1, &pdex_text_color, 0, seenBuffer);
    rboxid_print(TB_CAUGHT, FONT_DEX_STD, TB_STD_RIGHT(twidthCaught), TB_CAUGHT_Y + 1, &pdex_text_color, 0,
                 caughtBuffer);

    rboxid_update_tilemap_and_tileset(TB_SEEN);
    rboxid_update_tilemap_and_tileset(TB_CAUGHT);
}

const struct OamData pdex_oam_pkmn = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 3,
};

void pdex_pokemon_load(u16 species) {
    /* this is very temporary */
    rboxid_clear_pixels(TB_PKMN, 0);
    u32 twidth = font_get_width_of_string(FONT_DEX_STD, &pokemon_names[species][0], 0x0000);
    rboxid_print(TB_PKMN, FONT_DEX_STD, TB_STD_CENTER(twidth), 3, &pdex_text_color, 0, &pokemon_names[species][0]);
    if (pokedex_context->pokemon_oam != -1) {
        lz77UnCompVram(pokemon_graphics_front[species].data,
                       ((void *)(objects[pokedex_context->pokemon_oam].final_oam.tile_num * 32) + ADDR_VRAM + 0x10000));
        gpu_pal_apply_compressed(pokemon_palette_normal[species].data,
                                 16 * (objects[pokedex_context->pokemon_oam].final_oam.palette_num + 16), 32);
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
        pokedex_context->pokemon_oam = (s8)template_instanciate_forward_search(&pkmnTemplate, 10, 10, 0);

        objects[pokedex_context->pokemon_oam].pos1.x = 55;
        objects[pokedex_context->pokemon_oam].pos1.y = 80;
    }
    rboxid_update_tilemap_and_tileset(TB_PKMN);
}

struct SpriteTiles pdex_ball_tiles = {pdexBallTiles, 128, DEX_BALL_TAG};
struct SpritePalette pdex_ball_pal = {pdexBallPal, DEX_BALL_TAG};
const struct OamData pdex_ball_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 1,
};

const struct Template pdex_ball_template = {
    .tiles_tag = DEX_BALL_TAG,
    .pal_tag = DEX_BALL_TAG,
    .oam = &pdex_ball_oam,
    .animation = &anim_image_empty,
    .graphics = &pdex_ball_tiles,
    .rotscale = &rotscale_empty,
    .callback = oac_nullsub,
};

void pdex_pokeballs_init(void) {
    gpu_tile_obj_decompress_alloc_tag_and_upload(&pdex_ball_tiles);
    gpu_pal_obj_alloc_tag_and_apply(&pdex_ball_pal);
    for (u8 i = 0; i < 9; ++i) {
        pokedex_context->ball_oams[i] =
            template_instanciate_forward_search(&pdex_ball_template, 124, 8 + pdex_y_offset[i], 1);
    }
}

void pdex_oac_cursor_follow(struct Object *obj) { obj->pos1.y = objects[pokedex_context->cursor_main_oam].pos1.y; }

void pdex_oac_cursor_main(struct Object *obj) {
    obj->pos1.y = 13 + pdex_y_offset[pokedex_context->cursor_position_internal];
}

struct SpriteTiles pdex_cursor_tiles = {pdexSelectHalfTiles, 1024, DEX_CURSOR_TAG};
struct SpritePalette pdex_cursor_pal = {pdexSelectHalfPal, DEX_CURSOR_TAG};
const struct OamData pdex_cursor_oam = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 1,
    .size = 3,
};

const struct Template pdex_ball_main_template = {
    .tiles_tag = DEX_CURSOR_TAG,
    .pal_tag = DEX_CURSOR_TAG,
    .oam = &pdex_cursor_oam,
    .animation = &anim_image_empty,
    .graphics = &pdex_cursor_tiles,
    .rotscale = &rotscale_empty,
    .callback = pdex_oac_cursor_main,
};

const struct Template pdex_ball_follow_template = {
    .tiles_tag = DEX_CURSOR_TAG,
    .pal_tag = DEX_CURSOR_TAG,
    .oam = &pdex_cursor_oam,
    .animation = &anim_image_empty,
    .graphics = &pdex_cursor_tiles,
    .rotscale = &rotscale_empty,
    .callback = pdex_oac_cursor_follow,
};

void pdex_cursor_init(void) {
    gpu_tile_obj_decompress_alloc_tag_and_upload(&pdex_cursor_tiles);
    gpu_pal_obj_alloc_tag_and_apply(&pdex_cursor_pal);
    pokedex_context->cursor_main_oam = template_instanciate_forward_search(&pdex_ball_main_template, 144, 32, 0);
    pokedex_context->cursor_follow_oam =
        template_instanciate_forward_search(&pdex_ball_follow_template, 144 + 48, 32, 0);
    objects[pokedex_context->cursor_follow_oam].final_oam.h_flip = true;
}

void pdex_data_setup(void) {
    /* fill the LUT */
    /* TODO: get data from various pokedex lists */
    bool first = false;
    for (u32 i = 0; i <= PDEX_LAST_SHOWN; ++i) {
        u16 species = pokedex_index_to_species(i);
        if (species > 0) {
            pokedex_context->lookup[i].species = species;
            pokedex_context->lookup[i].seen = dex_flag_pokedex_index(i, DEX_FLAG_CHECK_SEEN);
            pokedex_context->lookup[i].caught = dex_flag_pokedex_index(i, DEX_FLAG_CHECK_CAUGHT);
            if (!first && (pokedex_context->lookup[i].seen)) {
                pokedex_context->first_seen = i;
                pokedex_context->cursor_position_top = i;
                first = true;
            }
        }
    }
}

void pdex_hardware_scroll(bool up) {
    /* somewhat hacky wraparound scrolling, works though */
    /* TODO: Fix the one pixel off */
    if (up) {
        if (pokedex_context->hardware_scroll_amount > -16) {
            bgid_mod_y_offset(1, -(15 << 8), 1);
            pokedex_context->hardware_scroll_amount--;
        } else {
            pokedex_context->hardware_scroll_amount = 0;
            // pokedex_context->overdo_amount++;
            bgid_mod_y_offset(1, 0, 0);
            bgid_mod_y_offset(1, (256 * pokedex_context->overdo_amount), 1);
        }
    } else {

        if (pokedex_context->hardware_scroll_amount < 16) {
            bgid_mod_y_offset(1, 15 << 8, 1);
            pokedex_context->hardware_scroll_amount++;
        } else {
            pokedex_context->hardware_scroll_amount = 0;
            // pokedex_context->overdo_amount--;
            bgid_mod_y_offset(1, 0, 0);
            bgid_mod_y_offset(1, (256 * pokedex_context->overdo_amount), 1);
        }
    }
}

void pdex_fill_previous_slot(void) {
    u16 pIndex = pokedex_context->cursor_position_top - 1;
    pdex_main_box_species_fill(-1, pokedex_context->lookup[pIndex].species, pokedex_context->lookup[pIndex].seen,
                               pokedex_context->lookup[pIndex].caught);
}

void pdex_fill_next_slot(void) {
    u16 pIndex = pokedex_context->cursor_position_top + 9;
    pdex_main_box_species_fill(9, pokedex_context->lookup[pIndex].species, pokedex_context->lookup[pIndex].seen,
                               pokedex_context->lookup[pIndex].caught);
}

void pdex_try_advance(u8 reverse) {
    if (reverse) {
        if (pokedex_context->cursor_position_internal > 0) {
            pokedex_context->cursor_position_internal--;
        } else if ((pokedex_context->cursor_position_top) > (pokedex_context->first_seen)) {
            pdex_fill_previous_slot();
            pokedex_context->cursor_position_top--;

            pdex_hardware_scroll(true);
        }
    } else {
        if (pokedex_context->cursor_position_internal < 8) {
            pokedex_context->cursor_position_internal++;
        } else if (pokedex_context->cursor_position_top < (PDEX_LAST_SHOWN - 8)) {
            pdex_fill_next_slot();
            pokedex_context->cursor_position_top++;
            pdex_hardware_scroll(false);
        }
    }

    u16 pkIndexToLoad = pokedex_context->cursor_position_internal + pokedex_context->cursor_position_top;
    if (pokedex_context->lookup[pkIndexToLoad].seen || pokedex_context->lookup[pkIndexToLoad].caught)
        pdex_pokemon_load(pokedex_context->lookup[pkIndexToLoad].species);
    else
        pdex_pokemon_load(0);
    pdex_update_balls();
}

void pdex_loop(u8 tid) {
    (void)tid;
    switch (pokedex_context->state) {
    case 0:
        pokedex_context->state++;
        break;
    case 1:
        for (u8 i = 0; i < 4; ++i)
            bgid_send_tilemap(i);
        rboxid_clear_pixels(TB_TITLE, 0);
        rboxid_print(TB_TITLE, FONT_DEX_STD, 0, 0, &pdex_text_color, 0, &pdex_str_title[0]);
        rboxid_update_tilemap_and_tileset(TB_TITLE);

        pdex_data_setup();
        pdex_cursor_init();

        pdex_pokeballs_init();
        pdex_pokemon_load(pokedex_context->lookup[pokedex_context->first_seen].species);
        pdex_load_sc();
        pdex_update_page_full();

        palette_bg_faded_fill_black();
        pokedex_context->state++;
        break;
    case 2:
        gpu_sync_bg_show(0);
        gpu_sync_bg_show(1);
        gpu_sync_bg_hide(3);

        gpu_sync_bg_show(2);
        fade_screen(0xFFFFFFFF, PDEX_FADEIN_SPD, 16, 0, 0x0000);
        pokedex_context->state++;

        break;
    case 3:
    if ((super.buttons_held & KEY_DOWN)) {
        pokedex_context->held_frames++;
        if (pokedex_context->held_frames == 10) {
            pdex_try_advance(false);
            pokedex_context->held_frames = 0;
        }
    } else if ((super.buttons_held & KEY_UP)) {
        pokedex_context->held_frames++;
        if (pokedex_context->held_frames == 10) {
            pdex_try_advance(true);
            pokedex_context->held_frames = 0;
        }
    } else if ((super.buttons_new & KEY_DOWN)) {
        pokedex_context->held_frames = 0;
        pdex_try_advance(false);
    } else if ((super.buttons_new & KEY_UP)) {
        pokedex_context->held_frames = 0;
        pdex_try_advance(true);
    }
    break;
default:
    break;
}
}

bool sm_pdex_init(void) {
    if (pal_fade_control.active)
        return false;
    audioDampenMaybe();
    sav1_secure_increment(0x29); // this is something the original dex routine does, probably for statistics
    /* maybe clean up safari stuff here if necessary */
    overworld_free_bgmaps();
    set_callback2(pdex_load);
    return true;
}

void pdex_vram_setup(void) {
    vblank_handler_set(NULL);
    pal_fade_control_and_dead_struct_reset();
    gpu_tile_bg_drop_all_sets(true);
    obj_and_aux_reset_all();
    gpu_tile_obj_tags_reset();
    gpu_pal_allocator_reset();
    rboxes_free();
    malloc_init((void *)0x2000000, 0x1C000);
    tasks_init();

    bg_vram_setup(0, &pdex_bg_config[0], 4);

    u8 *bgMap = malloc(0x800);
    u8 *strMap = malloc(0x800);
    bgid_set_tilemap(2, bgMap);
    bgid_set_tilemap(0, strMap);
    bgid_mark_for_sync(0);

    /*TODO: setup text boxes here */
    rbox_init_from_templates(&pdex_boxes[0]);
    u32 set = 0;
    CpuFastSet((void *)&set, (void *)0x06000000, CPUModeFS(0x10000, CPUFSSET));

    lz77UnCompVram(pdexBgTiles, (void *)0x0600C000);
    LZ77UnCompWram(pdexBgMap, bgMap);
    gpu_pal_apply_compressed(pdexBgPal, 0, 32);
    gpu_pal_apply(pdex_text_pal, 15 * 16, 32);

    /*setup window*/
    lcd_io_set(REG_ID_WIN0H, (128 << 8) | (216));
    lcd_io_set(REG_ID_WIN0V, ((20 << 8) | (152)));
    lcd_io_set(REG_ID_WININ, WIN_BG0 | WIN_BG1 | WIN_BG2 | WIN_BG3 | WIN_OBJ);
    lcd_io_set(REG_ID_WINOUT, WIN_BG0 | WIN_BG2 | WIN_BG3 | WIN_OBJ);

    vblank_handler_set(pdex_vblank_handler);
    interrupts_enable(INTERRUPT_VBLANK);
    bgid_mod_x_offset(0, 0, 0);
    bgid_mod_y_offset(0, 0, 0);
    bgid_mod_x_offset(1, 0, 0);
    bgid_mod_y_offset(1, 0, 0);
    bgid_mod_x_offset(2, 0, 0);
    bgid_mod_y_offset(2, 0, 0);
    bgid_mod_x_offset(3, 0, 0);
    bgid_mod_y_offset(3, 0, 0);
}

void pdex_load(void) {

    pdex_vram_setup();
    pokedex_context = malloc_and_clear(sizeof(struct PdexCtx));
    pokedex_context->pokemon_oam = -1;
    pokedex_context->lookup = malloc_and_clear((PDEX_LAST_SHOWN + 1) * sizeof(struct PdexLookup));
    task_add(pdex_loop, 0);
    set_callback2(pdex_cb_handler);
}

void pdex_vblank_handler(void) {
    gpu_sprites_upload();
    copy_queue_process();
    gpu_pal_upload();
}

void pdex_cb_handler(void) {
    if (pal_fade_control.active)
        process_palfade();
    else {
        task_exec();
        objc_exec();
        obj_sync_superstate();
        tilemaps_sync();
        remoboxes_upload_tilesets();
    }
}