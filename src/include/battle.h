#include <battle_structs.h>
#include <custom_structs.h>
#include <battle_locations.h>
#include <pkmn_types.h>
#include <abilities.h>
#include <moves.h>
#include <item_effects.h>
#include <items.h>
#include <pokemon.h>
#include <battle_abilities.h>

#ifndef BATTLE_H_
#define BATTLE_H_

#define REQUEST_HELDITEM_BATTLE 0x2
#define REQUEST_STATUS_BATTLE 0x28

struct stat_fractions{
    u8 dividend;
    u8 divisor;
};

struct stat_fractions stat_buffs[] = { {2, 8}, {2, 7}, {2, 6}, {2, 5}, {2, 4}, {2, 3}, {2, 2}, {3, 2}, {4, 2}, {5, 2}, {6, 2}, {7, 2}, {8, 2} };

u8 get_side_from_bank(u8 bank);
u16 battle_turn_random;

void mark_buffer_bank_for_execution(u8 bank);
void prepare_setattributes_in_battle(u8 buffer, u8 data_request, u8 unkown, u8 data_to_add, void* ptr_to_attribute);
u8 item_get_quality(u8 item_id);
u8 get_item_x12_battle_function(u16 item_id);
void battle_script_push();

#endif