#include <pokeagb/pokeagb.h>
#include <agb_debug.h>

#define SHOW_ITEM_TAG 0x1340

const struct OamData item_oam = {.size = 2, .shape = 0, .priority = 0};

/*
 * Need to fix the alignment to follow a 24x24 pattern
 * 
 * from
 * 
 * # # # #
 * # # # #
 * # X X X
 * X X X X
 * 
 * to
 * 
 * # # # X
 * # # # X
 * # # # X
 * X X X X
 * 
 * where # is a valid data tile
 */
void item_fix_alignment(u8* buffer, u8* dst)
{
    memcpy(32*0 + dst, 32*0 + buffer, 3*32);
    memcpy(32*4 + dst, 32*3 + buffer, 3*32);
    memcpy(32*8 + dst, 32*6 + buffer, 3*32);
}

void show_item_load_gfx(u16 item)
{
    u8* temp_buffer = malloc_and_clear(32*16);
    u8* item_gfx_buffer = malloc_and_clear(32*16);
    LZ77UnCompWram(item_gfx_table[item].gfx, temp_buffer);
    item_fix_alignment(temp_buffer, item_gfx_buffer);

    struct SpriteTiles tiles = {.data = item_gfx_buffer, .size = 32*16, .tag = SHOW_ITEM_TAG};
    struct SpritePalette pal = {.data = item_gfx_table[item].pal, .tag = SHOW_ITEM_TAG};

    struct Template template = {
        .tiles_tag = 0x1340,
        .pal_tag = 0x1340,
        .oam = &item_oam,
        .animation = SPRITE_NO_ANIMATION,
        .graphics = &tiles,
        .rotscale = SPRITE_NO_ROTSCALE,
        .callback = oac_nullsub
    };

    gpu_tile_obj_alloc_tag_and_upload(&tiles); //has already been decompressed above
    gpu_pal_decompress_alloc_tag_and_upload(&pal); //this has not
    var_800A = template_instanciate_forward_search(&template, 210,140,0);
    free(temp_buffer);
    free(item_gfx_buffer);
}

void hide_item_unload_gfx(void)
{
    obj_delete_and_free(&objects[var_800A]);
    gpu_pal_free_by_tag(SHOW_ITEM_TAG);
}

void sp_show_item(void)
{
    dprintf("entering sp_show_item");
    show_item_load_gfx(var_load(0x8001));
}