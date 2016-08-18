#include <bpre.h>
#include <debug.h>
#include <assets/ascii.h>

void set_background(u16 color) {
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
        set_background(0x0000);
        superstate.multi_purpose_state_tracker++;
    } else if (superstate.multi_purpose_state_tracker == 2) {
        init_unit_test();
        superstate.multi_purpose_state_tracker++;
    }
    return;
}

void some_test() {
    set_callback2(debug_scene);
    superstate.multi_purpose_state_tracker = 0;

    return;
}

void reset_scrolling_debug() {
    lcd_io_set_func(0x14, 0x0);
    lcd_io_set_func(0x16, 0x0);
    lcd_io_set_func(0x18, 0x0);
    lcd_io_set_func(0x1A, 0x0);
    lcd_io_set_func(0x1C, 0x0);
    lcd_io_set_func(0x1E, 0x0);

    return;
}

void init_unit_test() {
    print("Hello\nWorld!\xFE\x2\nHello\nWorld!");
}

void print_string(u16 line, u16 row, u8 color, char* pBuf) {
    while (*pBuf) {
        print_character(line, row++, *pBuf++, color);
    }
    return;
}

void print(char* str) {
    while(*str)
    {
        if(*str== '\n')
        {
            print_memory->line++;
            print_memory->row = 0;
        }
        else if(*str == '\xFE')
        {
            str++;
            u8 c = *str;
            if(c > 2)
                c = 0;
            print_memory->color=c;
        }
        else
        {
            print_character(print_memory->line, print_memory->row, *str, print_memory->color);
            print_memory->row++;
        }
        str++;
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
    u16* ptr = (u16*) (0x0600C800 + (position * 2));
    *ptr = map_entry.short_map;
    return;
}

u8 char_to_byte(char character) {
    if (character >= 0x20 && character <= 0x7E)
        return character - 0x20;
    else
        return 3;
}