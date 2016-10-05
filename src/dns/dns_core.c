#include <bpre.h>

enum time_type {
    DAY,
    NIGHT
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
    void* blockset_one;
    void* blockset_two;
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

extern struct npc_palette* npc_palettes;
extern volatile u8 tint_filter;
void apply_shaders(u8 pal, u8 fade_copy);
struct color alpha_blend(struct color a, struct color b, u8 alpha);
extern void blockset_load_palette_to_gpu(void* blockset, u16 start, u16 len);
extern void gpu_pal_apply(struct color* src, u16 dst, u16 len);
extern void tint_palette(u8 pal_slot);
extern u8 gpu_pal_tags_index_of(u16 pal_tag);
void copy_unfaded(u8 slot);
u8 is_current_map_dn_valid(enum map_type current_type);
//care, this has to be manually patched to be u16
extern u16 npc_pal_idx_for_given_tag(u16 tag);
struct color_shade get_color_from_time(enum time_type current_time);
enum time_type get_time_of_day();
void apply_lighting(void* blockset, u8 copy);

enum time_type get_time_of_day() {
    return NIGHT;
}

static struct pal_replace lightmap[] = {
    {(void*) 0x082D4AAC, 9, 10, {31, 31, 0}},
    {(void*) 0x082D4AAC, 9, 9, {31, 31, 0}},
    {(void*) 0x082D4AAC, 9, 8, {31, 31, 0}}
};

static struct color_shade color_shade_day = {
    {0, 0, 0}, 255
};
static struct color_shade color_shade_night = {
    {0, 6, 16}, 120
};

void mapdata_load_palette_two(struct mapdata_header* data_header) {
    blockset_load_palette_to_gpu(data_header->blockset_two, 0x70, 0xC0);
    for (u8 i = 7; i < 7 + 6; ++i)
        apply_shaders(i, 0);
    apply_lighting(data_header->blockset_two, 0);
    return;
}

void mapdata_load_palette_one(struct mapdata_header* data_header) {
    blockset_load_palette_to_gpu(data_header->blockset_one, 0x0, 0xE0);
    for (u8 i = 0; i < 7; ++i)
        apply_shaders(i, 0);
    apply_lighting(data_header->blockset_one, 0);
    return;
}

void apply_lighting(void* blockset, u8 copy) 
{
    for (int i = 0; i < (sizeof (lightmap) / sizeof (lightmap[0])); ++i) {
        if (blockset == lightmap[i].blockset) {
            palette_unfaded_buffer[lightmap[i].pal * 16 + lightmap[i].index] = lightmap[i].color;
        }
    }
    return;
}

void apply_shaders(u8 pal, u8 fade_copy) {
    if (tint_filter != 0)
        return;
    if (!is_current_map_dn_valid(current_mapheader.maptype))
        return;
    for (int i = pal * 16; i < (pal * 16) + 16; ++i) {
        struct color_shade current_shade = get_color_from_time(get_time_of_day());
        palette_unfaded_buffer[i] = alpha_blend(palette_unfaded_buffer[i], current_shade.color, current_shade.alpha);
    }
    if (fade_copy)
        copy_unfaded(pal);
}

void copy_unfaded(u8 slot) {
    for (int i = slot * 16; i < (slot * 16) + 16; ++i) {
        palette_faded_buffer[i] = palette_unfaded_buffer[i];
    }
}

u8 is_current_map_dn_valid(enum map_type current_type) {
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

struct color_shade get_color_from_time(enum time_type current_time) {
    switch (current_time) {
        case NIGHT:
            return color_shade_night;
        case DAY:
        default:
            return color_shade_day;
    }
}

struct color alpha_blend(struct color a, struct color b, u8 alpha) {
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

void pal_patch_for_npc(u16 tag, u8 pal_slot) {
    u16 npc_map_entry = npc_pal_idx_for_given_tag(tag);
    gpu_pal_apply(npc_palettes[npc_map_entry].palette, (pal_slot + 16) * 16, 32);
    tint_palette(pal_slot);
    apply_shaders(pal_slot + 16, 1);
}
/*use fade in animation, load palettes according to current fade state*/