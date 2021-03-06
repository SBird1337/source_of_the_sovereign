#include <pokeagb/pokeagb.h>

#define CPUFSCPY 0
#define CPUFSSET 1
#define CPUModeFS(size, mode) ((size >> 2) | (mode << 24))

const struct BgConfig scene_default_config[4] = {
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

void scene_default_vblank(void) {
    gpu_sprites_upload();
    copy_queue_process();
    gpu_pal_upload();
}

const struct TextColor scene_default_text_color = {0, 1, 2};

void scene_default_cb_handler(void) {
    if (pal_fade_control.active)
        process_palfade();
    else {
        task_exec();
        objc_exec();
        obj_sync_superstate();
        tilemaps_sync();
        remoboxes_upload_tilesets();
        rboxid_update_tilemap_and_tileset(0);
    }
}

void scene_free_bg_maps(void) {
    for (u8 i = 0; i < 3; ++i) {
        void *tmap = bgid_get_tilemap(i);
        if (tmap != NULL) {
            free(tmap);
            bgid_nullify_tilemap(i);
        }
    }
}

void scene_vram_init(SuperCallback vblank_handler, const struct BgConfig* config) {
    vblank_handler_set(NULL);
    pal_fade_control_and_dead_struct_reset();
    gpu_tile_bg_drop_all_sets(true);
    obj_and_aux_reset_all();
    gpu_tile_obj_tags_reset();
    gpu_pal_allocator_reset();
    rboxes_free();
    tasks_init();
    bg_vram_setup(0, config, 4);
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

    //windows

    lcd_io_set(REG_ID_WININ, WININ_BUILD(WIN_ENALL_NO_BLD,WIN_ENALL_NO_BLD));
    lcd_io_set(REG_ID_WINOUT, WINOUT_BUILD(WIN_ENALL_NO_BLD,WIN_ENALL_BLD));
    vblank_handler_set(vblank_handler);
    interrupts_enable(INTERRUPT_VBLANK);
}

void scene_vram_default_init(void) {
    scene_vram_init(scene_default_vblank, &scene_default_config[0]);
}