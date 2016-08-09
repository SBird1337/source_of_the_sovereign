#include <battle_structs.h>
#include <custom_structs.h>
#include <battle_locations.h>
#include <pkmn_types.h>
#include <abilities.h>
#include <moves.h>

#ifndef BATTLE_H_
#define BATTLE_H_

#define REQUEST_HELDITEM_BATTLE 0x2
#define REQUEST_STATUS_BATTLE 0x28

u8 get_side_from_bank(u8 bank);

void mark_buffer_bank_for_execution(u8 bank);
void prepare_setattributes_in_battle(u8 buffer, u8 data_request, u8 unkown, u8 data_to_add, void* ptr_to_attribute);

void battle_script_push();

#endif