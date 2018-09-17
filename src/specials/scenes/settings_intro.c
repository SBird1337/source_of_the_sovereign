#include <pokeagb/pokeagb.h>
#include <scene_intro/genderChoose.h>
#include <scene_intro/gameModeChoose.h>
#include <scene.h>
#include <agb_debug.h>
#include <constants/pkmns.h>
#include <songlist.h>

extern u8 settings_gender_script[];
extern u8 settings_gender_script_sure[];
extern u8 settings_name_sure[];
extern u8 intro_choose_difficulty[];
extern u8 intro_sure_difficulty[];

const struct TextboxTemplate settings_gender_box[] = {
    {.bg_id = 0, .x = 2, .y = 15, .width = 26, .height = 4, .pal_id = 15, .charbase = 0x198},
};

const struct Coords16 male_position = {.x=100, .y=80};
const struct Coords16 female_position = {.x=205, .y=80};

const struct Coords16 difficulty_positions[3] = {{.x=85,.y=95}, {.x=155,.y=90}, {.x=230,.y=84}};

void launch_tutorial(void);

#define SELECTED_IDX 7
#define BINDEX_MALE 1
#define BINDEX_FEMALE 2

#define BINDEX_EASY 1
#define BINDEX_MED 2
#define BINDEX_HARD 3

#define INNER_COLOR rgb82rgb5(0x80,0x80,0x80)
#define OUTER_COLOR rgb82rgb5(0x60,0x60,0x60)

#define INNER_COLOR_SEL rgb82rgb5(0xA6,0xA6,0xA6)
#define OUTER_COLOR_SEL INNER_COLOR

#define OUTER1_IDX 8
#define OUTER2_IDX 10
#define OUTER3_IDX 12
#define INNER1_IDX 9
#define INNER2_IDX 11
#define INNER3_IDX 13

#define EASY_MON PKMN_PICHU
#define MED_MON PKMN_PIKACHU
#define HARD_MON PKMN_RAICHU

const union Color lighterPalette[] = {OUTER_COLOR_SEL, INNER_COLOR_SEL};
const union Color darkerPalette[] = {OUTER_COLOR, INNER_COLOR};

extern pchar name_rival_male[5];
extern pchar name_rival_female[5];

void settings_launch(void);
void settings_mode_launch(void);

void settings_switch_tinted(u8 baseIndex, u8 tid) {
    u8 currentPal = objects[tasks[tid].priv[baseIndex]].final_oam.palette_num;
    objects[tasks[tid].priv[baseIndex]].final_oam.palette_num = tasks[tid].priv[baseIndex+2];
    tasks[tid].priv[baseIndex+2]=currentPal;
}

void settings_switch_mode_tinted(u8 baseIndex, u8 tid) {
    u8 currentPal = objects[tasks[tid].priv[baseIndex]].final_oam.palette_num;
    objects[tasks[tid].priv[baseIndex]].final_oam.palette_num = tasks[tid].priv[baseIndex+3];
    tasks[tid].priv[baseIndex+3]=currentPal;
}

void settings_loop(u8 id) {
    switch(tasks[id].priv[0]){
        case 0:
            bgid_send_tilemap(2);
            bgid_send_tilemap(0);
            rboxid_clear_pixels(0, 0);
            palette_bg_faded_fill_black();
            tasks[id].priv[0]++;
        break;
        case 1:
            gpu_sync_bg_show(0);
            gpu_sync_bg_hide(1);
            gpu_sync_bg_hide(3);

            gpu_sync_bg_show(2);
            settings_switch_tinted(BINDEX_FEMALE, id);
            gpu_pal_apply(&lighterPalette[0], OUTER1_IDX, 4);
            gpu_pal_apply(&darkerPalette[0], OUTER2_IDX, 4);
            objects[tasks[id].priv[1]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[2]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[1]].pos1 = male_position;
            objects[tasks[id].priv[2]].pos1 = female_position;
            fade_screen(0xFFFFFFFF, 1, 16, 0, 0x0000);
            m4aSongNumStart(SEQ_BGM_MENU);
            tasks[id].priv[0]++;
        break;
        case 2:
            if (!pal_fade_control.active)
                tasks[id].priv[0]++;
        break;
        case 3:
            script_env_init_script(&settings_gender_script[0]);
            tasks[id].priv[0]++; 
        break;
        case 4:
            if(script_env_1.mode == SCRIPT_EXECUTE_MODE_PAUSED)
                tasks[id].priv[0]++;
        break;
        case 5:
            if(super.buttons_new & KEY_LEFT){
                if(tasks[id].priv[SELECTED_IDX] == 1) {
                    tasks[id].priv[SELECTED_IDX] = 0;
                    m4aSongNumStart(5);
                    settings_switch_tinted(BINDEX_FEMALE, id);
                    settings_switch_tinted(BINDEX_MALE, id);
                    gpu_pal_apply(&lighterPalette[0], OUTER1_IDX, 4);
                    gpu_pal_apply(&darkerPalette[0], OUTER2_IDX, 4);
                }
            }
            if(super.buttons_new & KEY_RIGHT){
                if(tasks[id].priv[SELECTED_IDX] == 0) {
                    tasks[id].priv[SELECTED_IDX] = 1;
                    m4aSongNumStart(5);
                    settings_switch_tinted(BINDEX_FEMALE, id);
                    settings_switch_tinted(BINDEX_MALE, id);
                    gpu_pal_apply(&lighterPalette[0], OUTER2_IDX, 4);
                    gpu_pal_apply(&darkerPalette[0], OUTER1_IDX, 4);
                }
            }
            if(super.buttons_new & KEY_A) {
                tasks[id].priv[0]++;
                m4aSongNumStart(5);
            }

        break;
        case 6:
            if(tasks[id].priv[SELECTED_IDX] == 1)
                var_set(0x800D, 1);
            else
                var_set(0x800D, 0);
            script_env_init_script(&settings_gender_script_sure[0]);
            tasks[id].priv[0]++;
        break;
        case 7:
            if(script_env_1.mode == SCRIPT_EXECUTE_MODE_PAUSED) {
                if(var_load(0x800D) == 0)
                    tasks[id].priv[0] = 3;
                else
                    tasks[id].priv[0]++;
            }
            break;
        case 8:
            if(tasks[id].priv[SELECTED_IDX] == 1) {
                saveblock2->gender = GENDER_FEMALE;
                pstrcpy(saveblock1->rival_name, &name_rival_male[0]);
            }
            else {
                saveblock2->gender = GENDER_MALE;
                pstrcpy(saveblock1->rival_name, &name_rival_female[0]);
            }
            tasks[id].priv[0]++;
            break;
        case 9:
            var_set(0x8000, 1);
            scene_free_bg_maps();
            task_del(id);
            name_chooser_enter(0, &saveblock2->name[0], saveblock2->gender, 0, 0, settings_launch);
        default:
        break;
    }
}

void settings_loop_after_name(u8 id) {
    switch(tasks[id].priv[0]){
        case 0:
            bgid_send_tilemap(2);
            bgid_send_tilemap(0);
            rboxid_clear_pixels(0, 0);
            palette_bg_faded_fill_black();
            tasks[id].priv[0]++;
        break;
        case 1:
            gpu_sync_bg_show(0);
            gpu_sync_bg_hide(1);
            gpu_sync_bg_hide(3);

            gpu_sync_bg_show(2);
            if(saveblock2->gender == GENDER_MALE) {
                settings_switch_tinted(BINDEX_FEMALE, id);
                gpu_pal_apply(&lighterPalette[0], OUTER1_IDX, 4);
                gpu_pal_apply(&darkerPalette[0], OUTER2_IDX, 4);
                tasks[id].priv[SELECTED_IDX] = 0;
            }
            else {
                settings_switch_tinted(BINDEX_MALE, id);
                gpu_pal_apply(&lighterPalette[0], OUTER2_IDX, 4);
                gpu_pal_apply(&darkerPalette[0], OUTER1_IDX, 4);
                tasks[id].priv[SELECTED_IDX] = 1;
            }

            objects[tasks[id].priv[1]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[2]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[1]].pos1 = male_position;
            objects[tasks[id].priv[2]].pos1 = female_position;
            fade_screen(0xFFFFFFFF, 1, 16, 0, 0x0000);
            tasks[id].priv[0]++;
        break;
        case 2:
            if (!pal_fade_control.active)
                tasks[id].priv[0]++;
        break;
        case 3:
            if(saveblock2->name[0] == 0){
                if(saveblock2->gender == GENDER_MALE){
                    pstrcpy(saveblock2->name, name_rival_male);
                } else {
                    pstrcpy(saveblock2->name, name_rival_female);
                }
            }
            script_env_init_script(&settings_name_sure[0]);
            tasks[id].priv[0]++;
        break;
        case 4:
            if(script_env_1.mode == SCRIPT_EXECUTE_MODE_PAUSED) {
                if(var_load(0x800D) == 1) {
                    tasks[id].priv[0]++;
                    fade_screen(0xFFFFFFFF, 0, 0, 16, 0x0000);
                } else {
                    saveblock2->name[0] = 0;
                    scene_free_bg_maps();
                    task_del(id);
                    name_chooser_enter(0, &saveblock2->name[0], saveblock2->gender, 0, 0, settings_launch);
                }

            }
        break;
        case 5:
            if(!pal_fade_control.active) {
                tasks[id].priv[0]++;
                var_set(0x8001, 1);
                scene_free_bg_maps();
                task_del(id);
                settings_mode_launch();
            }
        default:
        break;
    }
}

void settings_set_stuff_before_start(void) {
    //set some stuff if needed
}

void settings_mode_loop(u8 id) {
    switch(tasks[id].priv[0])
    {
        case 0:
            bgid_send_tilemap(2);
            bgid_send_tilemap(0);
            rboxid_clear_pixels(0, 0);
            palette_bg_faded_fill_black();
            tasks[id].priv[0]++;
        break;
        case 1:
            gpu_sync_bg_show(0);
            gpu_sync_bg_hide(1);
            gpu_sync_bg_hide(3);
            gpu_sync_bg_show(2);
            tasks[id].priv[SELECTED_IDX] = 1;
            settings_switch_mode_tinted(BINDEX_EASY, id);
            settings_switch_mode_tinted(BINDEX_HARD, id);
            gpu_pal_apply(&darkerPalette[0], OUTER1_IDX, 4);
            gpu_pal_apply(&lighterPalette[0], OUTER2_IDX, 4);
            gpu_pal_apply(&darkerPalette[0], OUTER3_IDX, 4);
            objects[tasks[id].priv[1]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[2]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[3]].final_oam.affine_mode = 0;
            objects[tasks[id].priv[1]].pos1 = difficulty_positions[0];
            objects[tasks[id].priv[2]].pos1 = difficulty_positions[1];
            objects[tasks[id].priv[3]].pos1 = difficulty_positions[2];
            fade_screen(0xFFFFFFFF, 1, 16,0, 0x0000);
            tasks[id].priv[0]++;
        break;
        case 2:
            script_env_init_script(&intro_choose_difficulty[0]);
            tasks[id].priv[0]++;
        break;
        case 3:
            if(script_env_1.mode == SCRIPT_EXECUTE_MODE_PAUSED)
                tasks[id].priv[0]++;
        break;
        case 4:
            if(super.buttons_new & KEY_LEFT) {
                if(tasks[id].priv[SELECTED_IDX] > 0) {
                    settings_switch_mode_tinted(BINDEX_EASY + tasks[id].priv[SELECTED_IDX], id);
                    gpu_pal_apply(&darkerPalette[0], OUTER1_IDX + 2*tasks[id].priv[SELECTED_IDX], 4);
                    tasks[id].priv[SELECTED_IDX]--;
                    settings_switch_mode_tinted(BINDEX_EASY + tasks[id].priv[SELECTED_IDX], id);
                    gpu_pal_apply(&lighterPalette[0], OUTER1_IDX + 2*tasks[id].priv[SELECTED_IDX], 4);
                    m4aSongNumStart(5);
                }
            }
            if(super.buttons_new & KEY_RIGHT) {
                if(tasks[id].priv[SELECTED_IDX] < 2) {
                    settings_switch_mode_tinted(BINDEX_EASY + tasks[id].priv[SELECTED_IDX], id);
                    gpu_pal_apply(&darkerPalette[0], OUTER1_IDX + 2*tasks[id].priv[SELECTED_IDX], 4);
                    tasks[id].priv[SELECTED_IDX]++;
                    settings_switch_mode_tinted(BINDEX_EASY + tasks[id].priv[SELECTED_IDX], id);
                    gpu_pal_apply(&lighterPalette[0], OUTER1_IDX + 2*tasks[id].priv[SELECTED_IDX], 4);
                    m4aSongNumStart(5);
                }
            }
            if(super.buttons_new & KEY_A) {
                m4aSongNumStart(5);
                var_set(0x8002, tasks[id].priv[SELECTED_IDX]);
                switch(tasks[id].priv[SELECTED_IDX])
                {
                    case 0:
                        var_set(0x8003, EASY_MON);
                    break;
                    case 1:
                        var_set(0x8003, MED_MON);
                    break;
                    case 2:
                        var_set(0x8003, HARD_MON);
                    break;
                    default:
                    dprintf("assert 0 reached!\n");
                }
                script_env_init_script(&intro_sure_difficulty[0]);
                tasks[id].priv[0]++;
            }
        break;
        case 5:
            if(script_env_1.mode == SCRIPT_EXECUTE_MODE_PAUSED)
                tasks[id].priv[0]++;
        break;
        case 6:
            if(var_load(0x800D) == 1) {
                settings_set_stuff_before_start();
                set_callback2(c2_new_game);
            } else {
                tasks[id].priv[0] = 2;
            }
        break;
        default:
        break;
    }
}

void* settings_load_tinted_palette(struct SpritePalette *pal) {
    union Color *tintedPal = malloc(32);
    LZ77UnCompWram(pal->data, tintedPal);
    for(u8 i = 0; i<16;++i){
        tintedPal[i].components.r = tintedPal[i].components.r / 3;
        tintedPal[i].components.g = tintedPal[i].components.g / 3;
        tintedPal[i].components.b = tintedPal[i].components.b / 3;
    }
    return tintedPal;
}

const struct OamData trainer_pkmn_oam = {.size = 3, .affine_mode = 2, .priority=1};

#define TRAINER_MALE 135
#define TRAINER_FEMALE 136

void settings_load_gfx(void) {
    lz77UnCompVram(genderChooseTiles, (void *)0x0600C000);
    LZ77UnCompWram(genderChooseMap, bgid_get_tilemap(2));

    gpu_pal_apply_compressed(genderChoosePal, 0, 32);
}

void settings_mode_load_gfx(void) {
    lz77UnCompVram(gameModeChooseTiles, (void *)0x0600C000);
    LZ77UnCompWram(gameModeChooseMap, bgid_get_tilemap(2));
    gpu_pal_apply_compressed(gameModeChoosePal,0,32);
}

void settings_mode_spawn_main_task(void) {

    struct Template first_pkmn_sprite = {
        .tiles_tag = 0x1337,
        .pal_tag = 0x1337,
        .oam = &trainer_pkmn_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &pokemon_graphics_front[EASY_MON],
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };
    struct Template second_pkmn_sprite = {
        .tiles_tag = 0x1338,
        .pal_tag = 0x1338,
        .oam = &trainer_pkmn_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &pokemon_graphics_front[MED_MON],
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };
    struct Template third_pkmn_sprite = {
        .tiles_tag = 0x1339,
        .pal_tag = 0x1339,
        .oam = &trainer_pkmn_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &pokemon_graphics_front[HARD_MON],
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };
    struct SpritePalette firstPal = {.tag = 0x1337, .data = pokemon_palette_normal[EASY_MON].data};
    struct SpritePalette secondPal = {.tag = 0x1338, .data = pokemon_palette_normal[MED_MON].data};
    struct SpritePalette thirdPal = {.tag = 0x1339, .data = pokemon_palette_normal[HARD_MON].data};
    struct SpriteTiles firstTiles = {.tag = 0x1337, .data = pokemon_graphics_front[EASY_MON].data, .size = 64*32};
    struct SpriteTiles secondTiles = {.tag = 0x1338, .data = pokemon_graphics_front[MED_MON].data, .size = 64*32};
    struct SpriteTiles thirdTiles = {.tag = 0x1339, .data = pokemon_graphics_front[HARD_MON].data, .size = 64*32};

    gpu_pal_decompress_alloc_tag_and_upload(&firstPal);
    gpu_tile_obj_decompress_alloc_tag_and_upload(&firstTiles);
    gpu_pal_decompress_alloc_tag_and_upload(&secondPal);
    gpu_tile_obj_decompress_alloc_tag_and_upload(&secondTiles);
    gpu_pal_decompress_alloc_tag_and_upload(&thirdPal);
    gpu_tile_obj_decompress_alloc_tag_and_upload(&thirdTiles);

    void* firstTintedPal = settings_load_tinted_palette(&firstPal);
    void* secondTintedPal = settings_load_tinted_palette(&secondPal);
    void* thirdTintedPal = settings_load_tinted_palette(&thirdPal);
    struct SpritePalette firstTinted = {.tag = firstPal.tag + 3, .data = firstTintedPal};
    struct SpritePalette secondTinted = {.tag = secondPal.tag + 3, .data = secondTintedPal};
    struct SpritePalette thirdTinted = {.tag = thirdPal.tag + 3, .data = thirdTintedPal};

    gpu_pal_obj_alloc_tag_and_apply(&firstTinted);
    gpu_pal_obj_alloc_tag_and_apply(&secondTinted);
    gpu_pal_obj_alloc_tag_and_apply(&thirdTinted);
    free(firstTintedPal);
    free(secondTintedPal);
    free(thirdTintedPal);
    u8 firstIdx = gpu_pal_tags_index_of(firstTiles.tag + 3);
    u8 secondIdx = gpu_pal_tags_index_of(secondTiles.tag + 3);
    u8 thirdIdx = gpu_pal_tags_index_of(thirdTiles.tag + 3);

    u8 first = template_instanciate_forward_search(&first_pkmn_sprite, 50,50, 1);
    u8 second = template_instanciate_forward_search(&second_pkmn_sprite, 100,50,1);
    u8 third = template_instanciate_forward_search(&third_pkmn_sprite, 100,50,1);

    u8 tid = task_add(settings_mode_loop, 0);
    dprintf("task added\n");
    tasks[tid].priv[0] = 0;
    tasks[tid].priv[1] = first;
    tasks[tid].priv[2] = second;
    tasks[tid].priv[3] = third;
    tasks[tid].priv[4] = firstIdx;
    tasks[tid].priv[5] = secondIdx;
    tasks[tid].priv[6] = thirdIdx;
}

void settings_spawn_main_task(void) {

    struct Template trainer_sprite_male = {
        .tiles_tag = trainer_battle_sprites[TRAINER_MALE].tag,
        .pal_tag = trainer_battle_palettes[TRAINER_MALE].tag,
        .oam = &trainer_pkmn_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &trainer_battle_sprites[TRAINER_MALE],
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };

    struct Template trainer_sprite_female = {
        .tiles_tag = trainer_battle_sprites[TRAINER_FEMALE].tag,
        .pal_tag = trainer_battle_palettes[TRAINER_FEMALE].tag,
        .oam = &trainer_pkmn_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &trainer_battle_sprites[TRAINER_FEMALE],
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };
    gpu_pal_decompress_alloc_tag_and_upload(&trainer_battle_palettes[TRAINER_MALE]);
    gpu_tile_obj_decompress_alloc_tag_and_upload(&trainer_battle_sprites[TRAINER_MALE]);
    gpu_pal_decompress_alloc_tag_and_upload(&trainer_battle_palettes[TRAINER_FEMALE]);
    gpu_tile_obj_decompress_alloc_tag_and_upload(&trainer_battle_sprites[TRAINER_FEMALE]);

    void* maleTintedPal = settings_load_tinted_palette(&trainer_battle_palettes[TRAINER_MALE]);
    void* femaleTintedPal = settings_load_tinted_palette(&trainer_battle_palettes[TRAINER_FEMALE]);
    struct SpritePalette maleTinted = {.tag = trainer_battle_sprites[TRAINER_MALE].tag + 2, .data = maleTintedPal};
    struct SpritePalette femaleTinted = {.tag = trainer_battle_sprites[TRAINER_FEMALE].tag + 2, .data = femaleTintedPal};
    gpu_pal_obj_alloc_tag_and_apply(&maleTinted);
    gpu_pal_obj_alloc_tag_and_apply(&femaleTinted);
    free(maleTintedPal);
    free(femaleTintedPal);
    u8 maleIdx = gpu_pal_tags_index_of(trainer_battle_sprites[TRAINER_MALE].tag + 2);
    u8 femaleIdx = gpu_pal_tags_index_of(trainer_battle_sprites[TRAINER_FEMALE].tag + 2);

    u8 male = template_instanciate_forward_search(&trainer_sprite_male, 50,50, 1);
    u8 female = template_instanciate_forward_search(&trainer_sprite_female, 100,50,1);
    u8 tid;
    if(var_load(0x8000))
        tid = task_add(settings_loop_after_name,0);
    else
        tid = task_add(settings_loop, 0);
    
    tasks[tid].priv[0] = 0;
    tasks[tid].priv[1] = male;
    tasks[tid].priv[2] = female;
    tasks[tid].priv[3] = maleIdx;
    tasks[tid].priv[4] = femaleIdx;
}

void settings_intro_c2(void) {
    process_palfade();
    task_exec();
    objc_exec();
    obj_sync_superstate();
    tilemaps_sync();
    script_execute_maybe();
}

void settings_launch(void) {
    scene_vram_default_init();
    lcd_io_set(REG_ID_DISPCNT, DISPCNT_OBJ | DISPCNT_OAM_1D);
    rbox_init_from_templates(&settings_gender_box[0]);
    remo_reset_acknowledgement_flags();
    bgid_set_tilemap(0, malloc(0x800));
    bgid_set_tilemap(2, malloc(0x800));
    settings_load_gfx();
    settings_spawn_main_task();
    set_callback2(settings_intro_c2);
}

void settings_mode_launch(void) {
    scene_vram_default_init();
    lcd_io_set(REG_ID_DISPCNT, DISPCNT_OBJ | DISPCNT_OAM_1D);
    rbox_init_from_templates(&settings_gender_box[0]);
    remo_reset_acknowledgement_flags();
    bgid_set_tilemap(0, malloc(0x800));
    bgid_set_tilemap(2, malloc(0x800));
    settings_mode_load_gfx();
    settings_mode_spawn_main_task();
    set_callback2(settings_intro_c2);
}