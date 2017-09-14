#include <pokeagb/pokeagb.h>
#include <tileset_animation/font.h>
#include <config.h>

#define CANVAS_X_START (22)
#define CANVAS_Y_START (35)
#define CANVAS_X_SECOND (22)
#define CANVAS_Y_SECOND (36)

#define CANVAS_FIRST ((u8 *)(574 * 0x20 + 0x06000000))
#define CANVAS_SECOND ((u8 *)(592 * 0x20 + 0x06000000))

static const char *map_texts[] = {"--------", "< Carun City", "Route 2 >", "< Route 3", "< Urbania City", "Route 5 >", "< Route 6", NULL};

s16 char_to_tile_index(char chr) {
    if (chr >= 'A' && chr <= 'P')
        return chr - 'A';
    if (chr >= 'Q' && chr <= 'Z')
        return (16 * 2) + (chr - 'Q');
    if (chr >= '0' && chr <= '9')
        return (16 * 8) + (chr - '0');
    if (chr >= 'a' && chr <= 'p')
        return (16 * 4) + (chr - 'a');
    if (chr >= 'q' && chr <= 'z')
        return (16 * 6) + (chr - 'q');
    if (chr == '<')
        return char_to_tile_index('z') + 1;
    if (chr == '>')
        return char_to_tile_index('z') + 2;
    if (chr == ' ')
        return char_to_tile_index('9') + 1;
    return -1;
}

void draw_text_on_canvas(const char *txt) {

    u16 current_tile = 0;
    while (*txt) {
        s16 tile = char_to_tile_index(*txt);
        if (tile != -1) {
            void *first = CANVAS_FIRST + (current_tile * 0x20);
            void *second = CANVAS_SECOND + (current_tile * 0x20);
            memcpy(first, fontTiles + (tile * 0x20), 0x20);
            memcpy(second, fontTiles + (16 * 0x20) + (tile * 0x20), 0x20);
        }
        txt++;
        current_tile++;
    }
}

u8 get_pixel(u8 x, u8 y, u16 *start) {
    u16 block = start[16 * (x / 4) + 2 * y + ((x % 4) / 2)];
    if (x % 2 == 0)
        return block & 0xFF;

    return (block >> 8);
}

void set_pixel(u8 x, u8 y, u16 *start, u16 pixel) {
    pixel &= 0xFF;
    u16 *addr = &start[16 * (x / 4) + 2 * y + ((x % 4) / 2)];
    if (x % 2 == 0)
        *addr = (*addr & 0xFF00) | (pixel);
    else
        *addr = (*((u8 *)addr)) | (pixel << 8);
}

#define ANIMATION_FRAME_SPEED 2

/* TODO: Compile RELEASE Versions of the game with higher optimization flags */

#define TEXT_ANIM_TILE_ROW(c, x, y) (((u32 *)c)[x * 8 + y])

void text_animator(u16 current_frame) {
    if ((current_frame % ANIMATION_FRAME_SPEED) == 0) {
        for (int y = 0; y < 8; ++y) {
            u32 outer_pixel_upper = CANVAS_FIRST[y * 4];
            u32 outer_pixel_lower = CANVAS_SECOND[y * 4];

            for (int x = 17; x >= 0; --x) {
                // tile:     AB-CD-EF-GH-|-NX      BC-DE-FG-HN
                // mem:      BA-DC-FE-HG-|-XN ---> CB-ED-GF-NH
                // register: HG-FE-DC-BA           NH-GF-ED-CB

                u32 upper_row = TEXT_ANIM_TILE_ROW(CANVAS_FIRST, x, y);
                u32 new_outer_pixel_upper = upper_row;

                upper_row  = (upper_row >> 4) | (outer_pixel_upper << 28);
                TEXT_ANIM_TILE_ROW(CANVAS_FIRST, x, y) = upper_row;
                outer_pixel_upper = new_outer_pixel_upper;

                u32 lower_row = TEXT_ANIM_TILE_ROW(CANVAS_SECOND, x, y);
                u32 new_outer_pixel_lower = lower_row;

                lower_row = (lower_row >> 4) | (outer_pixel_lower << 28);
                TEXT_ANIM_TILE_ROW(CANVAS_SECOND, x, y) = lower_row;
                outer_pixel_lower = new_outer_pixel_lower;
            }
        }
    }
}

void anim_init_text(void) {
    blockset_one_current_tile = 0;
    blockset_one_max_tile = 0x280;
    blockset_one_animator = NULL;
    u16 text = var_load(TEXT_ANIMATION_VAR);
    if (text != 0) {
        draw_text_on_canvas(map_texts[text]);
        blockset_one_animator = text_animator;
    }
}
