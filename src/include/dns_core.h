#ifndef DNS_CORE_H
#define DNS_CORE_H

#include <types.h>
#include <lcd.h>
#include <objects.h>
#include <fade.h>

enum dns_rtc_time_type {
    DAY,
    NIGHT,
    EVENING,
    MORNING
};

enum map_type {
    UNK_00,
    VILLAGE,
    CITY,
    ROUTE,
    CELLAR,
    UNDERWATER,
    UNK_07,
    UNK_08,
    INSIDE,
    SECRET_BASE
};

struct mapdata_header {
    u32 width;
    u32 height;
    void* border;
    void* data;
    struct blockset* blockset_one;
    struct blockset* blockset_two;
    u8 border_width;
    u8 border_height;
    u16 unknown;
};

struct mapheader {
    struct mapdata_header* data_header;
    void* events;
    void* scripts;
    void* connections;
    u16 music;
    u16 mapindex;
    u8 name;
    u8 cave;
    u8 weather;
    enum map_type maptype;
    u8 field18;
    u8 escape_rope;
    u8 showname;
    u8 battletype;
};

extern struct mapheader current_mapheader;

struct color_shade {
    struct color color;
    u8 alpha;
};

struct npc_palette {
    struct color* palette;
    u16 tag;
    u16 fill;
};

struct pal_replace {
    void* blockset;
    u8 pal;
    u8 index;
    struct color color;
};

struct blockset {
    u8 is_compressed;
    u8 is_secondary;
    u16 padding;
    void* tiles;
    void* palette;
    void* block_tiles;
    void* funcptr;
    void* behavior;
};

struct dynamic_pal {
    u8 type;
    u8 count;
    u16 tag;
};

#define dynamic_palettes ((struct dynamic_pal*) 0x0203FF00)

extern struct npc_palette* npc_palettes;
extern volatile u8 tint_filter;
extern void blockset_load_palette_to_gpu(void* blockset, u16 start, u16 len);
extern void load_palette_3(u16 start, u16 len);
extern void tint_palette(u8 pal_slot);
extern u8 gpu_pal_tags_index_of(u16 pal_tag);
extern void lz77u_wram(void* src, void* dst);
extern void* oe_read_word(void* oe_script_pointer);
extern void some_weather_func(u8 pal_index);
//care, this has to be manually patched to be u16
extern u16 npc_pal_idx_for_given_tag(u16 tag);
struct color_shade dns_get_shade_from_time(enum dns_rtc_time_type current_time);
enum dns_rtc_time_type dns_get_time_of_day();
void dns_update_palettes();

extern void mapdata_load_palettes_to_gpu(struct mapdata_header* data_header);

extern void script_something();
extern void camera_update();
extern void foo_115798();
extern void foo_5ae28();
extern void foo_6ffbc();
extern void tilemaps_sync();

#endif /* DNS_CORE_H */

