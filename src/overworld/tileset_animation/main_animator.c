#include <pokeagb/pokeagb.h>
#include <tileset_animation/smoke.h>

struct TilesetAnimation {
    u16 tile_start;
    u16 frame_length;
    u16 tile_length;
    u16 frame_count;
    const void *image;
};

const struct TilesetAnimation hesperia_second_animations[] = {
    {.tile_start = 0x114, .frame_length = 7, .tile_length = 4, .frame_count = 5, .image = smokeTiles},
    {.tile_start = 0, .frame_length = 0, .tile_length = 0, .frame_count = 0, .image = (void *)0xFFFFFFFF},
};

void animate_from_structure(const struct TilesetAnimation *anim, u16 tile_skip, u16 current_frame) {
    void *vram_address = (void *)(0x06000000 + (tile_skip * 0x20));
    u8 current_animation = 0;
    while (anim[current_animation].image != (void *)0xFFFFFFFF) {
        void *current_vram = vram_address + (0x20 * anim[current_animation].tile_start);
        u16 max_frame = anim[current_animation].frame_length * anim[current_animation].frame_count;
        u16 used_frame = current_frame % max_frame;
        used_frame /= anim[current_animation].frame_length;
        memcpy(current_vram, anim[current_animation].image + (0x20 * anim[current_animation].tile_length * used_frame),
               anim[current_animation].tile_length * 0x20);
        current_animation++;
    }
}

void main_animator(u16 current_frame) { (void)current_frame; }

extern struct MapBlockset maptileset128;
extern struct MapBlockset maptileset0;

void main_second_animator(u16 current_frame) {
    animate_from_structure(hesperia_second_animations, 0x280, current_frame);
}

void main_animator_init(void) {
    blockset_one_current_tile = 0;
    blockset_one_max_tile = 0x280;
    blockset_one_animator = main_animator;
}

void main_second_animator_init(void) {
    blockset_two_current_tile = 0;
    blockset_two_max_tile = 0x100;
    blockset_two_animator = main_second_animator;
}