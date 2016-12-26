#ifndef BATTLE_H_
#define BATTLE_H_

#include <types.h>

#define REQUEST_HELDITEM_BATTLE 0x2
#define REQUEST_STATUS_BATTLE 0x28

u8 get_side_from_bank(u8 bank);
u16 battle_turn_random;
void mark_buffer_bank_for_execution(u8 bank);
void prepare_setattributes_in_battle(u8 buffer, u8 data_request, u8 unkown, u8 data_to_add, void* ptr_to_attribute);
u8 item_get_quality(u8 item_id);
u8 get_item_x12_battle_function(u16 item_id);
void battle_script_push();

#endif