#include <bpre.h>
#include <debug.h>
#include <assets/ascii.h>
#include <battle_test.h>

void set_debug_background(u16 color) {
    u16* bgc = (u16*) 0x020375f8;
    *bgc = color;
    return;
}

void debug_scene() {
    if (superstate.multi_purpose_state_tracker == 0) {
        print_memory->row = 0;
        print_memory->line = 0;
        print_memory->color = 0;
        gpu_tile_bg_drop_all_sets(0);
        gpu_tile_bg_drop_all_sets(1);
        gpu_tile_bg_drop_all_sets(2);
        gpu_tile_bg_drop_all_sets(3);

        bg_vram_setup(0, standard_bg, 4);

        gpu_bg_show(0);
        gpu_bg_show(1);
        gpu_bg_show(2);
        gpu_bg_show(3);

        gpu_sync_bg_visibility_and_mode();
        reset_scrolling_debug();
        obj_delete_all();
        memset((void*) 0x06000000, 0, 0x17fe0);
        memset((void*) 0x020375F8, 0, 0x400);
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 1) {
        vram_decompress((void*) asciiTiles, (void*) 0x06000000);
        memcpy((void*) 0x020375F8, (void*) asciiPal, 0x60);
        set_debug_background(0x0000);
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 2) {
        init_unit_test();
        superstate.multi_purpose_state_tracker++;
    }
    return;
}

u8 some_test() {
    set_callback2(debug_scene);
    vblank_handler_set(debug_update);
    superstate.multi_purpose_state_tracker = 0;

    return 0;
}

void reset_scrolling_debug() {
    lcd_io_set_func(0x12, 0x0);
    lcd_io_set_func(0x14, 0x0);
    lcd_io_set_func(0x16, 0x0);
    lcd_io_set_func(0x18, 0x0);
    lcd_io_set_func(0x1A, 0x0);
    lcd_io_set_func(0x1C, 0x0);
    lcd_io_set_func(0x1E, 0x0);

    return;
}

void init_unit_test() {
    test_speed();
}

void print_string(u16 line, u16 row, u8 color, char* pBuf) {
    while (*pBuf) {
        print_character(line, row++, *pBuf++, color);
    }
    return;
}

void print(char* str) {
    while (*str) {
        if (*str == '\n') {
            print_memory->line++;
            print_memory->row = 0;
        } else if (*str == '\xFE') {
            str++;
            u8 c = *str;
            if (c > 2)
                c = 0;
            print_memory->color = c;
        } else {
            print_character(print_memory->line, print_memory->row, *str, print_memory->color);
            print_memory->row++;
        }
        str++;
    }
    return;
}

void printf(char* str, int arg) {
    while (*str) {
        if (*str == '\n') {
            print_memory->line++;
            print_memory->row = 0;
        } else if (*str == '\xFE') {
            str++;
            u8 c = *str;
            if (c > 2)
                c = 0;
            print_memory->color = c;
        } else if (*str == '%') {
            str++;
            if (*str == '%') {
                print_character(print_memory->line, print_memory->row, *str, print_memory->color);
                print_memory->row++;
            } else if (*str == 'd') {
                u32 len = dec_len(arg);
                char temp[dec_len(len + 1)];
                temp[len] = 0;
                int_to_char(arg, temp);
                print(temp);
            } else if (*str == 'c') {
                char print_char = (char) (arg);
                print_character(print_memory->line, print_memory->row, print_char, print_memory->color);
                print_memory->row++;
            }
        } else {
            print_character(print_memory->line, print_memory->row, *str, print_memory->color);
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

void wait_for_btn(u16 field) {
    volatile u16* control_io = (volatile u16*) (0x04000130);
    while (*control_io & field) {
    }
    return;
}

void print_character(u16 line, u16 row, char character, u8 color) {
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
    gpu_sprites_upload();
}

void int_to_char(u32 i, char* ref) {
    if (i == 0) {
        ref[0] = '0';
        return;
    }
    u32 len = dec_len(i);
    while (i > 0) {

        ref[len - 1] = '0' + (__aeabi_uidivmod(i, 10));
        i /= 10;
        len--;
    }

    return;
}

u32 power(u32 n, u32 power) {
    u32 out = 1;
    for (int i = 0; i < power; ++i) {
        out = out * n;
    }
    return out;
}

u32 dec_len(u32 i) {
    u32 len = 1;
    while ((i /= 10) > 0) {
        len++;
    }
    return len;
}