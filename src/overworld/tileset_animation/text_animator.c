#include <pokeagb/pokeagb.h>
#include <tileset_animation/font.h>

#define CANVAS_X_START (22)
#define CANVAS_Y_START (35)
#define CANVAS_X_SECOND (22)
#define CANVAS_Y_SECOND (36)

#define CANVAS_FIRST (u8 *)(574 * 0x20 + 0x06000000)
#define CANVAS_SECOND (u8 *)(592 * 0x20 + 0x06000000)

static const char *map_texts[] = {"--------","< Carun City", "Route 2 >", NULL};

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
        *addr = (*((u8*)addr)) | (pixel << 8);
}

#define ANIMATION_FRAME_SPEED 2

void text_animator(u16 current_frame) {
    if ((current_frame % ANIMATION_FRAME_SPEED) == 0) {
        u8 outer_pixels[16] = {
            *(CANVAS_FIRST + 0),   *(CANVAS_FIRST + 4),   *(CANVAS_FIRST + 8),   *(CANVAS_FIRST + 12),
            *(CANVAS_FIRST + 16),  *(CANVAS_FIRST + 20),  *(CANVAS_FIRST + 24),  *(CANVAS_FIRST + 28),
            *(CANVAS_SECOND + 0),  *(CANVAS_SECOND + 4),  *(CANVAS_SECOND + 8),  *(CANVAS_SECOND + 12),
            *(CANVAS_SECOND + 16), *(CANVAS_SECOND + 20), *(CANVAS_SECOND + 24), *(CANVAS_SECOND + 28)};

        for (u8 i = 0; i < 71; ++i) {
            for (u8 j = 0; j < 8; ++j) {
                set_pixel(i, j, (u16 *)CANVAS_FIRST, get_pixel(i + 1, j, (u16 *)CANVAS_FIRST));
                set_pixel(i, j, (u16 *)CANVAS_SECOND, get_pixel(i + 1, j, (u16 *)CANVAS_SECOND));
            }
        }

        for (u8 y = 0; y < 8; ++y) {
            set_pixel(71, y, (u16 *)CANVAS_FIRST, outer_pixels[y]);
            set_pixel(71, y, (u16 *)CANVAS_SECOND, outer_pixels[y + 8]);
        }
    }
}

void anim_init_text(void) {
    blockset_one_current_tile = 0;
    blockset_one_max_tile = 0x280;
    blockset_one_animator = text_animator;
    if(var_8000 != 0)
        draw_text_on_canvas(map_texts[var_8000]);
}