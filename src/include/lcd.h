/****************************************************************************
 * Copyright (C) 2015-2016 by the SotS Team                                 *
 *                                                                          *
 * This file is part of Sovereign of the Skies.                             *
 *                                                                          *
 *   Sovereign of the Skies is free software: you can redistribute it       *
 *   and/or modify it                                                       *
 *   under the terms of the GNU Lesser General Public License as published  *
 *   by the Free Software Foundation, either version 3 of the License, or   *
 *   (at your option) any later version provided you include a copy of the  *
 *   licence and this header.                                               *
 *                                                                          *
 *   Sovereign of the Skies is distributed in the hope that it will be      *
 *   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 *                                                                          *
 *   You should have received a copy of the GNU Lesser General Public       *
 *   License along with Sovereign of the Skies.                             *
 *   If not, see <http://www.gnu.org/licenses/>.                            *
 ****************************************************************************/

/**
 * @file lcd.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Operations on the GBA Screen
 * 
 * This header contains methods to manipulate and update the lcd screen,
 * for interacting with the object entity engine
 * @see objects.h
 */


#ifndef LCD_H_
#define LCD_H_

/* === STRUCTURES === */

struct bg_config {
    u32 id : 2;
    u32 char_base : 2;
    u32 map_base : 5;
    u32 size : 2;
    u32 colormode : 1;
    u32 priority : 2;
};

struct map_entry {
    u16 tile : 10;
    u16 hflip : 1;
    u16 vflip : 1;
    u16 pal : 4;
};

union t_map_entry {
    u16 short_map;
    struct map_entry entry;
};

struct color {
    u16 r : 5;
    u16 g : 5;
    u16 b : 5;
};

/* === EXTERN METHODS === */

/**
 * @brief copy tileset or tilemap to bg
 * @param bg_id bg id to copy tileset to
 * @param source tileset source
 * @param byte_size tileset size
 * @param start_tile start tile to copy to
 * @param mode 1 = copy tileset 2 = copy tilemap
 * @return 
 */
extern u8 gpu_copy_to_vram_by_bgid(u8 bg_id, void* source, u16 byte_size, u16 start_tile, u8 mode);

/**
 * @brief reset bg configs and init bgs
 */
extern void gpu_init_bgs();

/**
 * @brief drop all tilesets from bg ( ? )
 * @param bg background to drop tilesets from
 */
extern void gpu_tile_bg_drop_all_sets(u8 bg);

/**
 * @setup bg vram
 * @param mirror not so sure about that
 * @param configs pointer to config array (4 entries)
 * @param count number of entries
 */
extern void gpu_bg_vram_setup(u8 mirror, struct bg_config* configs, u8 count);

/**
 * @brief set tilemap of bg in the bg structure
 * @param bg_id bg to set tilemap for
 * @param tilemap pointer to tilemap
 */
extern void virtual_bg_set_tilemap(u8 bg_id, void* tilemap);

/**
 * @brief set tilemap of bg to NULL in bg structure
 * @param bg_id bg to set tilemap for
 */
extern void virtual_bg_nullify_tilemap(u8 bg_id);

/**
 * @brief get tilemap of bg in bg structure
 * @param bg_id bg to get tilemap for
 * @return pointer to tilemap, might be null
 */
extern void* virtual_bg_get_tilemap(u8 bg_id);

/**
 * @brief sends virtual tilemap to vram
 * @param bg_id bg id to send tilemap for
 */
extern void virtual_bg_send_tilemap(u8 bg_id);

/**
 * @brief TODO DOCUMENT
 */
extern void gpu_pal_apply();


/**
 * @brief decompress palette and copy to f/u buffers
 * @param src palette source (lz compressed)
 * @param start palette start (in bytes)
 * @param end palette count (in entries, I think)
 */
void pal_decompress_slice_to_faded_and_unfaded(void* src, u16 start, u16 end);

/**
 * @brief show bg
 * @param id bg id
 */
void gpu_bg_show(u8 id);

/**
 * @brief hide bg
 * @param id bg id
 */
void gpu_bg_hide(u8 id);

/**
 * @brief sync bg visibility and mode, execute during vblank to avoid artifacts
 */
void gpu_sync_bg_visibility_and_mode();

/**
 * @brief set I/O
 * @param id device ID
 * @param value value to set I/O device to
 */
void lcd_io_set_func(u8 id, u16 value);

/**
 * @brief upload palettes from buffer to palette memory
 */
void gpu_pal_upload();

/**
 * @brief free pal tag
 * @param tag tag to free
 */
void gpu_pal_free_by_tag(u16 tag);

/**
 * @brief get from I/O
 * @param id device ID
 * @return I/O value
 */
u16 lcd_io_get(u8 id);

/* === MACROS AND DEFINES === */

/* TODO: Implement without macros */
#define palette_faded_buffer ((struct color*) 0x020375F8)
#define palette_unfaded_buffer ((struct color*) 0x020371F8)

#endif
