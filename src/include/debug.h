#ifndef DEBUG_H
#define DEBUG_H

struct print_engine{
    u8 line;
    u8 row;
    u8 color;
};

static struct print_engine* print_memory = (struct print_engine*)(0x0203FFF0);

void set_debug_background(u16 color);
void debug_clean();
void wait_for_btn(u16 field);
void int_to_char(u32 i, char* ref);
u32 dec_len(u32 i);
void debug_update();
u8 some_test();
void reset_scrolling_debug();
void init_unit_test();
void debug_scene();
u8 char_to_byte(char character);
void print_character(u16 line, u16 row, char character, u8 color);
void print_string(u16 line, u16 row, u8 color, char* pBuf);
void print(char* str);
u32 power(u32 n, u32 power);
void printf(char* str, int arg);

#endif /* DEBUG_H */

