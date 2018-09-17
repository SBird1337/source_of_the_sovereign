#include <scene_intro/blackboard.h>
#include <pokeagb/pokeagb.h>
#include <scene.h>

#define BLACKBOARD_TEXT_SPEED 1

extern pchar *blackboard_text[];

const struct TextboxTemplate blackboard_box[] = {
    {.bg_id = 0, .x = 2, .y = 5, .width = 28, .height = 10, .pal_id = 15, .charbase = 1},
};

const u16 blackboard_text_pal[] = 
                            {rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(000, 163, 131), rgb5(255, 255, 255),
                             rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255),
                             rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255),
                             rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255), rgb5(255, 255, 255)};

void blackboard_loop(u8 id) {
    switch(tasks[id].priv[0]){
        case 0:
            bgid_send_tilemap(2);
            rboxid_clear_pixels(0, 0);
            palette_bg_faded_fill_black();
            tasks[id].priv[0]++;
        break;
        case 1:
            gpu_sync_bg_show(0);
            gpu_sync_bg_hide(1);
            gpu_sync_bg_hide(3);

            gpu_sync_bg_show(2);
            fade_screen(0xFFFFFFFF, 1, 16, 0, 0x0000);
            tasks[id].priv[0]++;
        break;
        case 2:
            if (!pal_fade_control.active)
                tasks[id].priv[0]++;
            break;
        break;
        case 3:
            rboxid_print(0, 1, 0, 0, &scene_default_text_color, BLACKBOARD_TEXT_SPEED,
                         blackboard_text[0]);
            tasks[id].priv[0]++;
        break;
        case 4:
            if(!dialogid_was_acknowledged(0)) {
                fade_screen(0xFFFFFFFF, 1, 0, 16, 0x0000);
                tasks[id].priv[0]++;
            }
        break;
        case 5:
            if(!pal_fade_control.active){
                task_del(id);
                scene_free_bg_maps();
                set_callback2(c2_exit_to_overworld_1_continue_scripts_and_music);
                set_callback1(c1_overworld);
            }
        break;
        default:
        break;
    }
}

void blackboard_load_gfx(void){
    rbox_init_from_templates(&blackboard_box[0]);
    lz77UnCompVram(blackboardTiles, (void *)0x0600C000);
    LZ77UnCompWram(blackboardMap, bgid_get_tilemap(2));
    gpu_pal_apply_compressed(blackboardPal, 0, 32);
    gpu_pal_apply(blackboard_text_pal, 15 * 16, 32);
    bgid_mark_for_sync(0);
}

void blackboard_start(void) {
    scene_vram_default_init();
    bgid_set_tilemap(0, malloc(0x800));
    bgid_set_tilemap(2, malloc(0x800));
    blackboard_load_gfx();
    u8 tid = task_add(blackboard_loop, 0);
    tasks[tid].priv[0] = 0;
    set_callback2(scene_default_cb_handler);
}