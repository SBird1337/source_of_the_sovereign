#include <pokeagb/pokeagb.h>

const struct OamData item_oam = {.size = 2};

void show_item_load_gfx(u16 item)
{
    struct SpriteTiles tiles = {.data = item_gfx_table[item].gfx, .size = 32*16, .tag = 0x1340};
    struct SpritePalette pal = {.data = item_gfx_table[item].pal, .tag = 0x1340};
    struct Template template = {
        .tiles_tag = 0x1340,
        .pal_tag = 0x1340,
        .oam = &item_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &tiles,
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };
    gpu_tile_obj_decompress_alloc_tag_and_upload(&tiles);
    gpu_pal_obj_alloc_tag_and_apply(&pal);
    template_instanciate_forward_search(&template, 100,100,0);
}