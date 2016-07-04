#ifndef CALLBACK_H_
#define CALLBACK_H_

#include <objects.h>
typedef void (*callback)();
typedef struct super {
	callback callback1;
	callback callback2;
	callback callback2backup;
	callback callback5_vblank;
	callback hblank_callback;
	u32 field_14;
	u32 field_18;
	u32 bit_to_wait_for;
	u32 *ptr_vblank_counter;
	u32 field_24;
	u16 buttons_held;
	u16 buttons_new;
	u16 buttons_held_remapped;
	u16 buttons_new_remapped;
	u16 buttons_new_and_key_repeat;
	u32 keypad_countdown;
	u32 unused_padding;
	sprite sprites[128];
	u8 multi_purpose_state_tracker;
	u8 gpu_sprites_upload_skip;
 } super;
extern super superstate;
void set_callback2(callback address);
void vblank_handler_set(callback address);



void callback_overworld();

#endif