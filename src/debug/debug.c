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
 * @file debug.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Operate with the sots debug engine, very temporary
 */

/* === INCLUDE === */

#include <types.h>
#include <callback.h>
#include <lcd.h>
#include <debug.h>
#include <memory.h>
#include <assets/ascii.h>
#include <battle_test.h>
#include <math.h>
#include <fade.h>

/* === STRUCTURES === */

struct assert_memory
{
    char* file;
    int line;
    char* expression;
};

/* === STATICS === */
struct assert_memory* assert_global = (struct assert_memory*)0x0203FEC4;
static struct print_engine* print_memory = (struct print_engine*)(0x0203FFF0);

/* === PROTOTYPES === */

/**
 * @brief convert int to char
 * @param i integer
 * @param ref buffer to output to
 */
void debug_int_to_char(u32 i, char* ref);

/**
 * @get length of integer
 * @param i integer
 * @return length
 */
u32 debug_dec_len(u32 i);

/**
 * @brief update debug environment
 */
void debug_update();

/**
 * @brief reset scrolling (from overworld e.g.)
 */
void debug_reset_scrolling();

/**
 * @brief start a unit test function
 */
void debug_init_unit_test();

/**
 * @brief handle for the debug scene
 */
void debug_scene();

/**
 * @brief convert character to byte
 * @param character character
 * @return byte from character
 */
u8 char_to_byte(char character);

/**
 * @brief print a character on the debug environment
 * @param line line to print to
 * @param row row to print to
 * @param character character to print
 * @param color color to print in
 */
void debug_print_char(u16 line, u16 row, char character, u8 color);

/**
 * @brief print a string to the debug environment
 * @param line line to print to
 * @param row row to start
 * @param color color to print in
 * @param pBuf string buffer to print (null terminated)
 */
void debug_print_string(u16 line, u16 row, u8 color, char* pBuf);

/**
 * @brief build power
 * @param n integer to power
 * @param power exponent
 * @return n^power
 */
u32 debug_power(u32 n, u32 power);

void debug_init_stage_one();
void debug_init_stage_two();

/**
 * @brief set bg color of debug environment
 * @param color color to set to
 */
void debug_set_bg(u16 color) {
    u16* bgc = (u16*) 0x020375f8;
    *bgc = color;
    return;
}

/* === STATIC STRUCTURES === */

static struct bg_config debug_bg_config[4] = {
    {0, 0, 0x19, 0, 0, 0},
    {1, 1, 0x1A, 0, 0, 1},
    {2, 2, 0x1B, 0, 0, 2},
    {3, 3, 0x1C, 0, 0, 3}
};

/* === IMPLEMENTATIONS === */

void as_assert(char* expression, char* file, int line)
{
    assert_global->file = file;
    assert_global->line = line;
    assert_global->expression = expression;
    
    set_callback2(debug_assert_scene);
    vblank_handler_set(debug_update);
    superstate.multi_purpose_state_tracker = 0;
}

void debug_scene() {
    if (superstate.multi_purpose_state_tracker == 0) {
        debug_init_stage_one();
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 1) {
        debug_init_stage_two();
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 2) {
        debug_init_unit_test();
        superstate.multi_purpose_state_tracker++;
    }
    return;
}

void debug_some_test() {
    set_callback2(debug_scene);
    vblank_handler_set(debug_update);
    superstate.multi_purpose_state_tracker = 0;
    
    return;
}

void debug_reset_scrolling() {
    lcd_io_set_func(0x12, 0x0);
    lcd_io_set_func(0x14, 0x0);
    lcd_io_set_func(0x16, 0x0);
    lcd_io_set_func(0x18, 0x0);
    lcd_io_set_func(0x1A, 0x0);
    lcd_io_set_func(0x1C, 0x0);
    lcd_io_set_func(0x1E, 0x0);

    return;
}

void debug_init_unit_test() {
    test_speed();
}

void debug_print_string(u16 line, u16 row, u8 color, char* pBuf) {
    while (*pBuf) {
        debug_print_char(line, row++, *pBuf++, color);
    }
    return;
}

void debug_print(char* str) {
    while (*str) {
        if(print_memory->row > 29)
        {
            print_memory->line++;
            print_memory->row = 0;
        }
        if (*str == '\n') {
            print_memory->line++;
            print_memory->row = 0;
        } if (*str == '\xFE') {
            str++;
            u8 c = *str;
            if (c > 2)
                c = 0;
            print_memory->color = c;
        } else {
            debug_print_char(print_memory->line, print_memory->row, *str, print_memory->color);
            print_memory->row++;
        }
        str++;
    }
    return;
}

void debug_printf(char* str, int arg) {
    while (*str) {
        if(print_memory->row > 29)
        {
            print_memory->line++;
            print_memory->row = 0;
        }
        if (*str == '\n') {
            print_memory->line++;
            print_memory->row = 0;
        } if (*str == '\xFE') {
            str++;
            u8 c = *str;
            if (c > 2)
                c = 0;
            print_memory->color = c;
        } else if (*str == '%') {
            str++;
            if (*str == '%') {
                debug_print_char(print_memory->line, print_memory->row, *str, print_memory->color);
                print_memory->row++;
            } else if (*str == 'd') {
                u32 len = debug_dec_len(arg);
                char temp[debug_dec_len(len + 1)];
                temp[len] = 0;
                debug_int_to_char(arg, temp);
                debug_print(temp);
            } else if (*str == 'c') {
                char print_char = (char) (arg);
                debug_print_char(print_memory->line, print_memory->row, print_char, print_memory->color);
                print_memory->row++;
            }
        } else {
            debug_print_char(print_memory->line, print_memory->row, *str, print_memory->color);
            print_memory->row++;
        }
        str++;
    }
}

void debug_clean() {
    memset((void*) 0x0600C800, 0, 0x800);
    print_memory->row = 0;
    print_memory->line = 0;
    print_memory->color = 0;
    return;
}

void debug_wait_for_btn(u16 field) {
    volatile u16* control_io = (volatile u16*) (0x04000130);
    while (*control_io & field) {
    }
    return;
}

void debug_init_stage_one()
{
    print_memory->row = 0;
    print_memory->line = 0;
    print_memory->color = 0;
    gpu_tile_bg_drop_all_sets(0);
    gpu_tile_bg_drop_all_sets(1);
    gpu_tile_bg_drop_all_sets(2);
    gpu_tile_bg_drop_all_sets(3);

    gpu_bg_vram_setup(0, debug_bg_config, 4);

    gpu_bg_show(0);
    gpu_bg_show(1);
    gpu_bg_show(2);
    gpu_bg_show(3);

    gpu_sync_bg_visibility_and_mode();
    debug_reset_scrolling();
    obj_delete_all();
    memset((void*) 0x06000000, 0, 0x17fe0);
    memset((void*) 0x020375F8, 0, 0x400);
}

void debug_init_stage_two()
{
    vram_decompress((void*) asciiTiles, (void*) 0x06000000);
    memcpy((void*) 0x020375F8, (void*) asciiPal, 0x60);
    debug_set_bg(0x0000);
}

void debug_assert_scene() {
    if (superstate.multi_purpose_state_tracker == 0) {
        debug_init_stage_one();
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 1) {
        debug_init_stage_two();
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 2) {
        debug_print("Assertion Failed: ");
        debug_print(assert_global->expression);
        debug_print("\n\nFile: ");
        debug_print(assert_global->file);
        debug_printf("\n\nLine: %d", assert_global->line);
        superstate.multi_purpose_state_tracker++;
    }
    /* Loop Endlessly in this stage */
    return;
}

void debug_print_char(u16 line, u16 row, char character, u8 color) {
    if (color > 2)
        color = 0;
    u16 position = (32 * line) + row;
    union t_map_entry map_entry;
    map_entry.entry.tile = char_to_byte(character);
    map_entry.entry.pal = color;
    u16* ptr = (u16*) (0x0600c800 + (position * 2));
    *ptr = map_entry.short_map;
    return;
}

u8 char_to_byte(char character) {
    if (character >= 0x20 && character <= 0x7E)
        return character - 0x20;
    else
        return 3;
}

void debug_update() {
    fade_update();
    task_exec();
    objc_exec();
    obj_sync();
    gpu_pal_upload();
    obj_gpu_sprites_upload();
}

void debug_int_to_char(u32 i, char* ref) {
    if (i == 0) {
        ref[0] = '0';
        return;
    }
    u32 len = debug_dec_len(i);
    while (i > 0) {

        ref[len - 1] = '0' + (__aeabi_uidivmod(i, 10));
        i /= 10;
        len--;
    }

    return;
}

u32 debug_power(u32 n, u32 power) {
    u32 out = 1;
    for (int i = 0; i < power; ++i) {
        out = out * n;
    }
    return out;
}

u32 debug_dec_len(u32 i) {
    u32 len = 1;
    while ((i /= 10) > 0) {
        len++;
    }
    return len;
}