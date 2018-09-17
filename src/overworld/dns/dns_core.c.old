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
 * @file dns_core.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief interact with the dns system
 *
 */

/* === INCLUDE === */
#include <dns_core.h>
#include <memory.h>
#include <lcd.h>
#include <callback.h>

/* === PROTOTYPES === */

/**
 * @brief hacked overworld callback to update palettes
 */
void dns_cb_overworld_hacked();

/**
 * @brief get current time of day type
 * @return enum containing respective day type
 */
enum dns_rtc_time_type dns_get_time_of_day();

/**
 * @brief load virtual pal of npc
 * @param dst destination to load to
 * @param tag tag to load
 * @param slot slot to load
 * @param shade shade immediatly if true
 */
void dns_npc_load_virtual_pal(struct color* dst, u16 tag, u8 slot, u8 shade);

/**
 * @brief allocate a virtual pal and load it
 * @return pointer to allocated color array
 */
struct color* dns_alloc_virtual_pal_and_load();

/**
 * @brief update palettes
 */
void dns_update_palettes();

/**
 * @brief load pal of overworld animation i.e. grass
 * @param oe_script_pointer pointer to oe_script controlling the animation
 */
void dns_overworld_anim_load_pal(void** oe_script_pointer);

/**
 * @brief load blockset to virtual space
 * @param blockset pointer to blockset to load
 * @param start start range
 * @param len end range
 * @param destination virtual destination to load to
 */
void dns_blockset_load_virtual_palette_and_shade(struct blockset* blockset, u16 start, u16 len, struct color* destination);

/**
 * @brief load blockset into palram and shade it
 * @param blockset pointer to blockset to load
 * @param start start range
 * @param len end range
 */
void dns_blockset_load_palette_to_gpu_and_shade(struct blockset* blockset, u16 start, u16 len);

/**
 * @brief load second pal of mapheader given
 * @param data_header pointer to mapdata header
 */
void dns_mapdata_load_palette_two(struct mapdata_header* data_header);

/**
 * @brief load second pal of mapheader given
 * @param data_header pointer to mapdata header
 */
void dns_mapdata_load_palette_one(struct mapdata_header* data_header);

/**
 * @brief apply light effects to given color array
 * @param blockset pointer to blockset
 * @param secondary is the blockset a secondary blockset
 * @param buffer color buffer to apply lighting to
 */
void dns_apply_lighting(void* blockset, u8 secondary, struct color* buffer);

/**
 * @brief apply shaders to color buffer
 * @param pal pal to apply shader to
 * @param fade_copy copy to unfaded immediatly if true
 * @param buffer color buffer
 */
void dns_apply_shaders(u8 pal, u8 fade_copy, struct color* buffer);

/**
 * @brief copy slot to faded buffer
 * @param slot palette slot
 */
void dns_copy_unfaded(u8 slot);

/**
 * @brief should the map allow shading?
 * @param current_type maptype to check for
 * @return 
 */
u8 dns_should_shade(enum map_type current_type);

/**
 * @brief get color shade struct from time of day
 * @param current_time current time of day
 * @return color_shade struct with respective information
 */
struct color_shade dns_get_shade_from_time(enum dns_rtc_time_type current_time);

/**
 * @brief blend color a over color b
 * @param a first color
 * @param b second color
 * @param alpha alpha value
 * @return blended color
 */
struct color dns_alpha_blend(struct color a, struct color b, u8 alpha);

/**
 * @brief patch hack for npc and pal slot
 * @param tag tag to apply hack to
 * @param pal_slot pal slot to apply hack to
 */
void dns_pal_patch_for_npc(u16 tag, u8 pal_slot);

/* === STATICS === */

static struct pal_replace lightmap[] = {
    {(void*) 0x082D4AAC, 9, 10, {
            31, 31, 0
        }}

    ,
    {(void*) 0x082D4AAC, 9, 9, {
            31, 31, 0
        }}

    ,
    {(void*) 0x082D4AAC, 9, 8, {
            31, 31, 0
        }}
};

static struct color_shade color_shade_day = {
    {0, 0, 0}, 255
};
static struct color_shade color_shade_night = {
    {0, 6, 16}, 120
};

static struct color_shade color_shade_evening = {
    {12, 7, 17}, 120
};

static struct color_shade color_shade_morning = {
    {6, 16, 6}, 150
};

/* === IMPLEMENTATIONS === */

void dns_cb_overworld_hacked() {
    script_something();
    task_exec();
    objc_exec();
    camera_update();
    foo_115798();
    foo_5ae28();
    obj_sync();
    fade_update();
    foo_6ffbc();
    tilemaps_sync();

    volatile u8* test_pointer = (u8*) (0x0203FAB0);
    if (*test_pointer == 1 && (fade_controller.mix_color & 0x8000) == 0) {
        dns_update_palettes();
        *test_pointer = 0;
    }
}

enum dns_rtc_time_type dns_get_time_of_day() {
    volatile u8* time_pointer = (u8*) (0x0203FAB1);
    return *time_pointer;
}

void dns_npc_load_virtual_pal(struct color* dst, u16 tag, u8 slot, u8 shade) {
    u16 npc_map_entry = npc_pal_idx_for_given_tag(tag);
    memcpy(dst + (16 + slot)*16, npc_palettes[npc_map_entry].palette, 32);
    if (shade) {
        tint_palette(slot);
        dns_apply_shaders(slot + 16, 0, dst);
    }
}

struct color* dns_alloc_virtual_pal_and_load() {
    struct color* destination = malloc(0x400);
    dns_blockset_load_virtual_palette_and_shade(current_mapheader.data_header->blockset_one, 0x0, 0xE0, destination);
    dns_blockset_load_virtual_palette_and_shade(current_mapheader.data_header->blockset_two, 0x70, 0xC0, destination);
    
    dns_npc_load_virtual_pal(destination, 0x1120, 0, false);
    load_palette_3(0x0, 0xD0);
    for (int i = 0; i < 16; ++i) {
        if (dynamic_palettes[i].tag >= 0x1100) {
            dns_npc_load_virtual_pal(destination, dynamic_palettes[i].tag, i, true);
        } else if (dynamic_palettes[i].tag == 0x1004) {
            //oe_0001
            struct color* oe_pal_1 = (struct color*) (0x08398FA8);
            memcpy(destination + (16 + i) * 16, oe_pal_1, 32);
            dns_apply_shaders(16 + i, 0, destination);

        } else if (dynamic_palettes[i].tag == 0x1005) {
            //oe_0002
            struct color* oe_pal_2 = (struct color*) (0x08398FC8);
            memcpy(destination + (16 + i) * 16, oe_pal_2, 32);
            dns_apply_shaders(16 + 1, 0, destination);
        }
    }
    return destination;
}

void dns_update_palettes() {
    struct color* destination = dns_alloc_virtual_pal_and_load();
    gpu_pal_apply(destination, 0x0, 0x1A0);
    gpu_pal_apply(destination + 0x100, 0x100, 0x200);
    free(destination);
}

void dns_overworld_anim_load_pal(void** oe_script_pointer) {
    struct npc_palette* pal_to_apply = oe_read_word(oe_script_pointer);
    u16 current_idx = gpu_pal_tags_index_of(pal_to_apply->tag);

    struct color* temp_color = malloc(32);
    memcpy(temp_color, pal_to_apply->palette, 32);
    dns_apply_shaders(0, 0, temp_color);

    struct obj_resource temp_resource = {temp_color, pal_to_apply->tag, pal_to_apply->fill};
    obj_gpu_pal_alloc_tag_and_apply(&temp_resource);
    free(temp_color);
    if (current_idx != 0xFF) {
        current_idx = gpu_pal_tags_index_of(pal_to_apply->tag);
        tint_palette(current_idx);
    }
    current_idx = gpu_pal_tags_index_of(pal_to_apply->tag);
    some_weather_func(current_idx);
    *oe_script_pointer += 4;
    return;
}

void dns_blockset_load_virtual_palette_and_shade(struct blockset* blockset, u16 start, u16 len, struct color* destination) {
    if (blockset == 0)
        return;
    if (blockset->is_secondary) {
        if (blockset->is_secondary == 1) {
            memcpy(destination + start, blockset->palette + (start * 2), len);
            for (u8 i = 7; i < 7 + 6; ++i)
                dns_apply_shaders(i, 0, destination);
            dns_apply_lighting(blockset, 0, destination);
            //gpu_pal_apply((color_memory), start, len);
            //load_palette_3(start, len >> 1);
        } else {
            struct color* pal_buffer = (struct color*) (0x02037ACC);
            lz77u_wram(blockset->palette, pal_buffer);
            memcpy(destination + start, pal_buffer + (start * 2), len);
            for (u8 i = 7; i < 7 + 6; ++i)
                dns_apply_shaders(i, 0, destination);
            dns_apply_lighting(blockset, 0, destination);
            //gpu_pal_apply(pal_buffer, start, len);
            //load_palette_3(start, len >> 1);
        }
    } else {
        //struct color* color_memory = malloc(224);
        memcpy(destination, blockset->palette, len);
        for (u8 i = 0; i < 7; ++i)
            dns_apply_shaders(i, 0, destination);
        dns_apply_lighting(blockset, 0, destination);
        //gpu_pal_apply(color_memory, start, len);
        //load_palette_3(start, len >> 1);
        //free(color_memory);
    }
    return;
}

void dns_blockset_load_palette_to_gpu_and_shade(struct blockset* blockset, u16 start, u16 len) {
    if (blockset == 0)
        return;
    if (blockset->is_secondary) {
        if (blockset->is_secondary == 1) {
            struct color* color_memory = malloc(224);
            memcpy(color_memory, blockset->palette + 0xE0, 224);
            for (u8 i = 0; i < 7; ++i)
                dns_apply_shaders(i, 0, color_memory);
            dns_apply_lighting(blockset, 1, color_memory);
            gpu_pal_apply((color_memory), start, len);
            load_palette_3(start, len >> 1);
            free(color_memory);
        } else {
            struct color* pal_buffer = (struct color*) (0x02037ACC);
            lz77u_wram(blockset->palette, pal_buffer);
            for (u8 i = 7; i < 7 + 6; ++i)
                dns_apply_shaders(i, 0, pal_buffer);
            dns_apply_lighting(blockset, 0, pal_buffer);
            gpu_pal_apply(pal_buffer, start, len);
            load_palette_3(start, len >> 1);
        }
    } else {
        struct color* color_memory = malloc(224);
        memcpy(color_memory, blockset->palette, 224);
        for (u8 i = 0; i < 7; ++i)
            dns_apply_shaders(i, 0, color_memory);
        dns_apply_lighting(blockset, 0, color_memory);
        gpu_pal_apply(color_memory, start, len);
        load_palette_3(start, len >> 1);
        free(color_memory);
    }
    return;
}

void dns_mapdata_load_palette_two(struct mapdata_header* data_header) {
    //struct color* destination = malloc(0x200);
    //blockset_load_virtual_palette_and_shade(data_header->blockset_two, 0x70, 0xC0, destination);
    //gpu_pal_apply(destination, 0x70, 0xC0);
    //load_palette_3(0x70, 0xC0 >> 1);
    dns_blockset_load_palette_to_gpu_and_shade(data_header->blockset_two, 0x70, 0xC0);
    return;
}

void dns_mapdata_load_palette_one(struct mapdata_header* data_header) {
    //struct color* destination = malloc(0x200);
    //blockset_load_virtual_palette_and_shade(data_header->blockset_one, 0x0, 0xE0, destination);
    //gpu_pal_apply(destination, 0x0, 0xE0);
    //load_palette_3(0x0, 0xE0 >> 1);

    dns_blockset_load_palette_to_gpu_and_shade(data_header->blockset_one, 0x0, 0xE0);
    return;
}

void dns_apply_lighting(void* blockset, u8 secondary, struct color* buffer) {
    if (dns_get_time_of_day() != NIGHT)
        return;
    for (unsigned int i = 0; i < (sizeof (lightmap) / sizeof (lightmap[0])); ++i) {
        if (blockset == lightmap[i].blockset) {
            buffer[(lightmap[i].pal - (secondary ? 7 : 0)) * 16 + lightmap[i].index] = lightmap[i].color;
        }
    }
    return;
}

void dns_apply_shaders(u8 pal, u8 fade_copy, struct color* buffer) {
    if (tint_filter != 0)
        return;
    if (!dns_should_shade(current_mapheader.maptype))
        return;
    for (int i = pal * 16; i < (pal * 16) + 16; ++i) {
        struct color_shade current_shade = dns_get_shade_from_time(dns_get_time_of_day());
        buffer[i] = dns_alpha_blend(buffer[i], current_shade.color, current_shade.alpha);
    }
    if (fade_copy)
        dns_copy_unfaded(pal);
}

void dns_copy_unfaded(u8 slot) {
    for (int i = slot * 16; i < (slot * 16) + 16; ++i) {
        palette_faded_buffer[i] = palette_unfaded_buffer[i];
    }
}

u8 dns_should_shade(enum map_type current_type) {
    switch (current_type) {
        case VILLAGE:
        case CITY:
        case ROUTE:
            return 1;
        default:
            return 0;
    }
    return 0;
}

struct color_shade dns_get_shade_from_time(enum dns_rtc_time_type current_time) {
    switch (current_time) {
        case NIGHT:
            return color_shade_night;
        case EVENING:
            return color_shade_evening;
        case MORNING:
            return color_shade_morning;
        case DAY:

        default:
            return color_shade_day;
    }
}

struct color dns_alpha_blend(struct color a, struct color b, u8 alpha) {
    if (alpha == 255)
        return a;
    if (alpha == 0)
        return b;
    struct color output;
    u8 inverted_alpha = 255 - alpha;

    output.r = ((a.r * alpha + b.r * inverted_alpha) / 255);
    output.b = ((a.b * alpha + b.b * inverted_alpha) / 255);
    output.g = ((a.g * alpha + b.g * inverted_alpha) / 255);
    return output;
}


void dns_pal_patch_for_npc(u16 tag, u8 pal_slot) {
    u16 npc_map_entry = npc_pal_idx_for_given_tag(tag);
    gpu_pal_apply(npc_palettes[npc_map_entry].palette, (pal_slot + 16) * 16, 32);
    tint_palette(pal_slot);
    dns_apply_shaders(pal_slot + 16, 1, palette_unfaded_buffer);
}
/*use fade in animation, load palettes according to current fade state*/
