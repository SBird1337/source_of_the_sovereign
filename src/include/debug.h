#ifndef DEBUG_H
#define DEBUG_H

struct print_engine{
    u8 line;
    u8 row;
    u8 color;
};

static struct print_engine* print_memory = (struct print_engine*)(0x0203FFF0);

void some_test();
void reset_scrolling_debug();
void init_unit_test();
void debug_scene();
u8 char_to_byte(char character);
void print_character(u16 line, u16 row, char character, u8 color);
void print_string(u16 line, u16 row, u8 color, char* pBuf);

#endif /* DEBUG_H */

