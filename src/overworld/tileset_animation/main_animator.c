#include <agb_debug.h>
#include <pokeagb/pokeagb.h>
#include <tileset_animation/flowers_mag.h>
#include <tileset_animation/flowers_ora.h>
#include <tileset_animation/smoke.h>
#include <tileset_animation/water_deep.h>
#include <tileset_animation/water_normal.h>
#include <tileset_animation/water_sea.h>
#include <tileset_animation/water_edge.h>
#include <tileset_animation/water_stone.h>
#include <tileset_animation/waterfall.h>

#define NUM_MAX_ANIMATIONS 16

struct TilesetAnimationState {
    u16 cur_frame[NUM_MAX_ANIMATIONS];
    u16 cur_tile[NUM_MAX_ANIMATIONS];
};

static struct TilesetAnimationState *anim_state = (struct TilesetAnimationState *)0x203FAB4;

struct TilesetAnimation {
    u16 tile_start;
    u16 frame_length;
    u16 tile_length;
    u16 frame_count;
    const void *image;
};

#define AS_WATER 15

const struct TilesetAnimation hesperia_second_animations[] = {
    {.tile_start = 0x10C, .frame_length = 14, .tile_length = 4, .frame_count = 10, .image = flowers_magTiles},
    {.tile_start = 0x110, .frame_length = 14, .tile_length = 4, .frame_count = 15, .image = flowers_oraTiles},
    {.tile_start = 0x114, .frame_length = 7, .tile_length = 4, .frame_count = 8, .image = smokeTiles},
    {.tile_start = 0x13C, .frame_length = 7, .tile_length = 4, .frame_count = 4, .image = water_stoneTiles},
    {.tile_start = 0x118, .frame_length = 4, .tile_length = 36, .frame_count = 8, .image = waterfallTiles},
    {.tile_start = 0x140, .frame_length = AS_WATER, .tile_length = 36, .frame_count = 8, .image = water_normalTiles},
    {.tile_start = 0x168, .frame_length = AS_WATER, .tile_length = 4, .frame_count = 8, .image = water_seaTiles},
    {.tile_start = 0x16C, .frame_length = AS_WATER, .tile_length = 4, .frame_count = 8, .image = water_deepTiles},
    {.tile_start = 0x164, .frame_length = AS_WATER, .tile_length = 4, .frame_count = 8, .image = water_edgeTiles},
    {.tile_start = 0, .frame_length = 0, .tile_length = 0, .frame_count = 0, .image = (void *)0xFFFFFFFF},
};

void animate_from_structure(const struct TilesetAnimation *anim, u16 tile_skip) {
    void *vram_address = (void *)(0x06000000 + (tile_skip * 0x20));
    u8 cur_anim = 0;
    while (anim[cur_anim].image != (void *)0xFFFFFFFF && cur_anim < NUM_MAX_ANIMATIONS) {
        void *current_vram = (u8*)vram_address + (0x20 * anim[cur_anim].tile_start);

        if (anim_state->cur_frame[cur_anim] == 0) {
            memcpy(current_vram,
                   (u8*)anim[cur_anim].image + (0x20 * anim[cur_anim].tile_length * anim_state->cur_tile[cur_anim]),
                   anim[cur_anim].tile_length * 0x20);
        }

        anim_state->cur_frame[cur_anim] += 1;
        if (anim_state->cur_frame[cur_anim] >= anim[cur_anim].frame_length) {
            anim_state->cur_frame[cur_anim] = 0;
            anim_state->cur_tile[cur_anim] += 1;
            if (anim_state->cur_tile[cur_anim] >= anim[cur_anim].frame_count) {
                anim_state->cur_tile[cur_anim] = 0;
            }
        }

        cur_anim++;
    }
    if (cur_anim >= NUM_MAX_ANIMATIONS) {
        dprintf("Warning! Animation State array not big enough to play all animations\n"
                "Please increase the limit in %s\n",
                __FILE__);
    }
}

void main_animator(u16 current_frame) { (void)current_frame; }

extern struct MapBlockset maptileset128;
extern struct MapBlockset maptileset0;

void main_second_animator(u16 current_frame) {
    (void)current_frame;
    animate_from_structure(hesperia_second_animations, 0x280);
}

void main_animator_init(void) {
    blockset_one_current_frame = 0;
    blockset_one_max_frame = 0x280;
    blockset_one_animator = main_animator;
}

void main_second_animator_init(void) {
    blockset_two_current_frame = 0;
    blockset_two_max_frame = 0x3624;
    blockset_two_animator = main_second_animator;

    for (int i = 0; i < NUM_MAX_ANIMATIONS; i++) {
        anim_state->cur_frame[i] = 0;
    }
}
