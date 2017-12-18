#include <pokeagb/pokeagb.h>
#include <agb_debug.h>
#include <tileset_animation/font.h>
#include <config.h>
#include <assert.h>

#define CANVAS_X_START (22)
#define CANVAS_Y_START (35)
#define CANVAS_X_SECOND (22)
#define CANVAS_Y_SECOND (36)

#define CANVAS_FIRST ((u8 *)(574 * 0x20 + 0x06000000))
#define CANVAS_SECOND ((u8 *)(592 * 0x20 + 0x06000000))

static const char *map_texts[] = {"--------", "← Carun City", "Route 2 >", "< Route 3", "< Urbania City", "Route 5 >", "< Route 6", NULL};

/*
 * Tile IDs:
 * 0x00: ABCDEFGH
 * 0x08: IJKLMNOP
 * 0x10: QRSTUVWX
 * 0x18: YZÄÖÜäöü
 * 0x20: abcdefgh
 * 0x28: ijklmnop
 * 0x30: qrstuvwx
 * 0x38: yz←→!?↑↓
 * 0x40: 01234567
 * 0x48: 89,.;:⚠ 
 */

static const u8 font_length_table[] = {
    6, 6, 6, 6, 6, 6, 6, 6,
    4, 5, 6, 5, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5, 5,
    2, 3, 5, 2, 8, 5, 5, 5,
    5, 4, 4, 4, 5, 6, 8, 5,
    5, 5, 8, 8, 2, 4, 6, 6,
    6, 4, 6, 6, 6, 6, 6, 6,
    6, 6, 3, 2, 3, 2, 8, 4,
};

static const u8 tile_id_table[] = {
    0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x0
    0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x8
    0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x10
    0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x18
    0x4F, 0x3C, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x20
    0x4E, 0x4E, 0x4E, 0x4E, 0x4A, 0x4E, 0x4B, 0x4E, // 0x28
    0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, // 0x30
    0x48, 0x49, 0x4D, 0x4C, 0x4E, 0x4E, 0x4E, 0x3D, // 0x38

    0x4E, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, // 0x40
    0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, // 0x48
    0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, // 0x50
    0x17, 0x18, 0x19, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x58
    0x4E, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, // 0x60
    0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, // 0x68
    0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, // 0x70
    0x37, 0x38, 0x39, 0x4E, 0x4E, 0x4E, 0x4E, 0x4E, // 0x78
};

static u8 iterate_tilenum(const char **iterator) {
    u8 c = *((*iterator)++);
    if (c <= 0x7F) {
        return tile_id_table[c];
    } else {
        if (c == 0xE2) {
            // arrow symbols in utf-8
            c = *((*iterator)++);
            if (c == 0x86) {
                c = *((*iterator)++);
                if (c == 0x90) {
                    return 0x3A; // ←
                } else if (c == 0x91) {
                    return 0x3E; // ↑
                } else if (c == 0x92) {
                    return 0x3B; // →
                } else if (c == 0x93) {
                    return 0x3F; // ↓
                } else {
                    return 0x4E;
                }
            } else {
                return 0x4E;
            }
        } else if (c == 0xC3) {
            // umlaute in utf-8
            c = *((*iterator)++);
            if (c == 0x84) {
                return 0x1A; // Ä
            } else if (c == 0x96) {
                return 0x1B; // Ö
            } else if (c == 0x9C) {
                return 0x1C; // Ü
            } else if (c == 0xA4) {
                return 0x1D; // ä
            } else if (c == 0xB6) {
                return 0x1E; // ö
            } else if (c == 0xBC) {
                return 0x1F;
            } else {
                return 0x4E;
            }
        } else {
            return 0x4E; // invalid symbol
        }
    }
}

static const size_t tile8x8size = 0x20;

void draw_text_on_canvas(const char *txt) {
    u32 *video_mem_a = (u32 *)CANVAS_FIRST;
    u32 *video_mem_b = (u32 *)CANVAS_SECOND;

    u32 rendered_tile_a[8];
    u32 rendered_tile_b[8];

    u32 cur_tile_index = 0;

    while (*txt) {
        const u8 sym = iterate_tilenum(&txt);
        const u32 tile_index = (((sym >> 4) << 5) | (sym & 0xF)) * tile8x8size;
        const u8 sym_width = font_length_table[sym];
        u32 *cur_source_tile_a = (u32 *)(fontTiles + tile_index);
        u32 *cur_source_tile_b = (u32 *)((u8 *)cur_source_tile_a + tile8x8size * 16);
        if (cur_tile_index == 0) {
            for (int i = 0; i < 8; i++) {
                u32 pxl_row_a = *cur_source_tile_a++;
                pxl_row_a <<= (4 * (8 - sym_width));
                pxl_row_a >>= (4 * (8 - sym_width));
                rendered_tile_a[i] = pxl_row_a;

                u32 pxl_row_b = *cur_source_tile_b++;
                pxl_row_b <<= (4 * (8 - sym_width));
                pxl_row_b >>= (4 * (8 - sym_width));
                rendered_tile_b[i] = pxl_row_b;
            }
        } else if (cur_tile_index + sym_width >= 8) {
            for (int i = 0; i < 8; i++) {
                u32 pxl_row_a = *cur_source_tile_a++;
                pxl_row_a <<= (4 * cur_tile_index);
                rendered_tile_a[i] |= pxl_row_a;        // <-- differs to line above

                u32 pxl_row_b = *cur_source_tile_b++;
                pxl_row_b <<= (4 * cur_tile_index);
                rendered_tile_b[i] |= pxl_row_b;        // <-- differs to line above
            }
        } else {
            for (int i = 0; i < 8; i++) {
                u32 pxl_row_a = *cur_source_tile_a++;
                pxl_row_a <<= (4 * (8 - sym_width));
                pxl_row_a >>= (4 * (8 - cur_tile_index - sym_width));
                rendered_tile_a[i] |= pxl_row_a;        // <-- differs to line above

                u32 pxl_row_b = *cur_source_tile_b++;
                pxl_row_b <<= (4 * (8 - sym_width));
                pxl_row_b >>= (4 * (8 - cur_tile_index - sym_width));
                rendered_tile_b[i] |= pxl_row_b;        // <-- differs to line above
            }
        }

        cur_tile_index += sym_width;

        // one tile fully rendered, emit to video mem
        if (cur_tile_index >= 8) {
            for (int i = 0; i < 8; i++) {
                *video_mem_a++ = rendered_tile_a[i];
                *video_mem_b++ = rendered_tile_b[i];
            }
            cur_tile_index -= 8;
            if (cur_tile_index > 0) {
                cur_source_tile_a = (u32 *)(fontTiles + tile_index);
                cur_source_tile_b = (u32 *)((u8 *)cur_source_tile_a + tile8x8size * 16);
                for (int i = 0; i < 8; i++) {
                    u32 pxl_row_a = *cur_source_tile_a++;
                    pxl_row_a <<= (4 * (8 - sym_width));
                    pxl_row_a >>= (4 * (8 - cur_tile_index));
                    rendered_tile_a[i] = pxl_row_a;

                    u32 pxl_row_b = *cur_source_tile_b++;
                    pxl_row_b <<= (4 * (8 - sym_width));
                    pxl_row_b >>= (4 * (8 - cur_tile_index));
                    rendered_tile_b[i] = pxl_row_b;
                }
            }
        }
    }

    // check if there is rendered tiles which aren't in video mem yet
    //assert(cur_tile_index < 8);
    if (cur_tile_index > 0) {
        const u8 sym = 0x4F;
        const u32 tile_index = (((sym >> 4) << 5) | (sym & 0xF)) * tile8x8size;
        u32 *cur_source_tile_a = (u32 *)(fontTiles + tile_index);
        u32 *cur_source_tile_b = (u32 *)((u8 *)cur_source_tile_a + tile8x8size * 16);

        for (int i = 0; i < 8; i++) {
            u32 pxl_row_a = *cur_source_tile_a++;
            pxl_row_a <<= (4 * cur_tile_index);
            rendered_tile_a[i] |= pxl_row_a;        // <-- differs to line above

            u32 pxl_row_b = *cur_source_tile_b++;
            pxl_row_b <<= (4 * cur_tile_index);
            rendered_tile_b[i] |= pxl_row_b;        // <-- differs to line above
        }

        for (int i = 0; i < 8; i++) {
            *video_mem_a++ = rendered_tile_a[i];
            *video_mem_b++ = rendered_tile_b[i];
        }
    }
}

#define ANIMATION_FRAME_SPEED ((unsigned int)2)

_Static_assert(ANIMATION_FRAME_SPEED && !(ANIMATION_FRAME_SPEED & (ANIMATION_FRAME_SPEED - 1)),
        "Text Banner animation speed is not power of 2");
// check if the speed is a power of two so no division get's created

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
    blockset_one_current_frame = 0;
    blockset_one_max_frame = 0x280;
    blockset_one_animator = NULL;
    u16 text = var_load(TEXT_ANIMATION_VAR);
    if (text != 0) {
        draw_text_on_canvas(map_texts[text]);
        blockset_one_animator = text_animator;
    }
}
