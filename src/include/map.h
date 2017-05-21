#ifndef MAP_H_
#define MAP_H_

#include <types.h>

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

u16 current_map_block_id_at(u16 x, u16 y);
void player_get_pos_to(u16* x, u16* y);
#endif //MAP_H_