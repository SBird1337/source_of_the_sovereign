#ifndef LCD_H_
#define LCD_H_

#include "objects.h"

struct bg_config
{
	u32 id : 2;
	u32 char_base : 2;
	u32 map_base : 5;
	u32 size: 2;
	u32 colormode : 1;
	u32 priority : 2;
};

u8 gpu_copy_to_vram_by_bgid(u8 bg_id, void* source, u16 byte_size, u16 start_tile, u8 mode);
void gpu_init_bgs();
void gpu_tile_bg_drop_all_sets(u8 bg);
void bg_vram_setup(u8 mirror, struct bg_config* configs, u8 count);
void bg_set_tilemap(u8 bg_id, void* tilemap);
void bg_nullify_tilemap(u8 bg_id);
void* bg_get_tilemap(u8 bg_id);
void bg_send_tilemap(u8 bg_id);
void wram_decompress(void* src, void* dst);
void pal_decompress_slice_to_faded_and_unfaded(void* src, u16 start, u16 end);
void gpu_bg_show(u8 id);
void gpu_bg_hide(u8 id);
void gpu_sync_bg_visibility_and_mode();
void lcd_io_set_func(u8 id, u16 value);
void gpu_pal_upload();
void gpu_sprites_upload();

void gpu_pal_obj_alloc_tag_and_apply(resource *pal);
void gpu_pal_free_by_tag(u16 tag);
void gpu_tile_obj_free_by_tag(u16 tag);
void obj_delete_and_free_tiles(object *obj);
void obj_delete_all();

u16 lcd_io_get(u8 id);

#define palette_unfaded_buffer ((void*)0x020371F8)
#define palette_faded_buffer ((void*)0x020375F8)

#endif
