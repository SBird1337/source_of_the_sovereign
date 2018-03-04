#include "pokedex_common.h"
#include <constants/pkmns.h>
#include <pokeagb/pokeagb.h>

const u16 pdex_text_pal[] = {rgb5(255, 0, 255), rgb5(255, 255, 255), rgb5(0, 0, 0),     rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255),
                             rgb5(255, 0, 255), rgb5(255, 0, 255),   rgb5(255, 0, 255), rgb5(255, 0, 255)};

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

struct DexForm pdex_forms[FORM_COUNT] = 
{
    {.index = 19, .forms = {{814, PKMN_ALOLA_RATTFRATZ, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 20, .forms = {{815, PKMN_ALOLA_RATIKARL, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 26, .forms = {{816, PKMN_ALOLA_RAICHU, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 27, .forms = {{817, PKMN_ALOLA_SANDAN, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 28, .forms = {{818, PKMN_ALOLA_SANDAMER, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 37, .forms = {{819, PKMN_ALOLA_VULPIX, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 38, .forms = {{820, PKMN_ALOLA_VULNONA, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 50, .forms = {{821, PKMN_ALOLA_DIGDA, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 51, .forms = {{822, PKMN_ALOLA_DIGDRI, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 52, .forms = {{823, PKMN_ALOLA_MAUZI, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 53, .forms = {{824, PKMN_ALOLA_SNOBILIKAT, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 74, .forms = {{825, PKMN_ALOLA_KLEINSTEIN, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 75, .forms = {{826, PKMN_ALOLA_GEOROK, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 76, .forms = {{827, PKMN_ALOLA_GEOWAZ, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 88, .forms = {{828, PKMN_ALOLA_SLEIMA, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 89, .forms = {{829, PKMN_ALOLA_SLEIMOK, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 103, .forms = {{830, PKMN_ALOLA_KOKOWEI, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 105, .forms = {{831, PKMN_ALOLA_KNOGGA, ALOLA}, {0xFFFF, 0xFFFF, FORM_END}}},
    {.index = 0xFFFF, .forms = {{0xFFFF, 0xFFFF, FORM_END}}},
};

const struct OamData pdex_oam_pkmn = {
    .affine_mode = 0,
    .obj_mode = 0,
    .mosaic = false,
    .shape = 0,
    .size = 3,
};

struct TextColor pdex_text_color = {0, 1, 2};

void pdex_vblank_handler(void) {
    gpu_sprites_upload();
    copy_queue_process();
    gpu_pal_upload();
}

u8 pstr_lines(const pchar *str) {
    u8 lines = 1;
    while (*str != 0xFF) {
        if (*str == 0xFE)
            lines++;
        str++;
    }
    return lines;
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

void pdex_vram_free_bgmaps(void) {
    for (u8 i = 0; i < 3; ++i) {
        void *tmap = bgid_get_tilemap(i);
        if (tmap != NULL) {
            free(tmap);
            bgid_nullify_tilemap(i);
        }
    }
}

struct PdexLookup *pdex_fill_lookup(u16 dexIndex) {
    u16 species = pokedex_index_to_species(dexIndex);
    pokedex_context->lookup[dexIndex].species = species;
    pokedex_context->lookup[dexIndex].seen = dex_flag_pokedex_index(dexIndex, DEX_FLAG_CHECK_SEEN);
    pokedex_context->lookup[dexIndex].caught = dex_flag_pokedex_index(dexIndex, DEX_FLAG_CHECK_CAUGHT);
    return &pokedex_context->lookup[dexIndex];
}

struct PdexLookup *pdex_lazy_lookup_entry(u16 dexIndex) {
    if (pokedex_context->lookup[dexIndex].species != -1) {
        return &pokedex_context->lookup[dexIndex];
    } else {
        return pdex_fill_lookup(dexIndex);
    }
}

void pdex_free_memory(void) {
    if (pokedex_context->lookup != NULL)
        free(pokedex_context->lookup);
    free(pokedex_context);
}

void pdex_alloc_memory(void) {
    pokedex_context = malloc_and_clear(sizeof(struct PdexCtx));
    pokedex_context->lookup = malloc_and_clear((PDEX_LAST_ENTRY + 1) * sizeof(struct PdexLookup));
    memset(pokedex_context->lookup, 0xFF, (PDEX_LAST_ENTRY + 1) * sizeof(struct PdexLookup));
}

void pdex_vram_allocate_bgmaps(void) {
    bgid_set_tilemap(0, malloc(0x800));
    bgid_set_tilemap(1, malloc(0x800));
    bgid_set_tilemap(2, malloc(0x800));
}

void pdex_vram_setup(void) {
    vblank_handler_set(NULL);
    pal_fade_control_and_dead_struct_reset();
    gpu_tile_bg_drop_all_sets(true);
    obj_and_aux_reset_all();
    gpu_tile_obj_tags_reset();
    gpu_pal_allocator_reset();
    rboxes_free();
    tasks_init();
    bg_vram_setup(0, &pdex_bg_config[0], 4);
    u32 set = 0;
    CpuFastSet((void *)&set, (void *)0x06000000, CPUModeFS(0x10000, CPUFSSET));

    bgid_mod_x_offset(0, 0, 0);
    bgid_mod_y_offset(0, 0, 0);
    bgid_mod_x_offset(1, 0, 0);
    bgid_mod_y_offset(1, 0, 0);
    bgid_mod_x_offset(2, 0, 0);
    bgid_mod_y_offset(2, 0, 0);
    bgid_mod_x_offset(3, 0, 0);
    bgid_mod_y_offset(3, 0, 0);

    vblank_handler_set(pdex_vblank_handler);
    interrupts_enable(INTERRUPT_VBLANK);
    pdex_vram_allocate_bgmaps();
}