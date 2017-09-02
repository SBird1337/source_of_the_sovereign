#ifndef FADE_H_
#define FADE_H_

typedef struct fade_control
{
	u16 bg_pal_field;
	u16 obj_pal_field;
	u16 scale;
	u16 mix_color;
	u8 field_8;
	u8 field_9;
	u8 field_A;
	u8 field_B;
} fade_control;

extern struct fade_control fade_controller;

void fade_screen(u32 bitmask, int v1, int v2, int v3, u16 color);
void fade_update();

#endif