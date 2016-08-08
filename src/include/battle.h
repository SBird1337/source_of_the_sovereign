#include <battle_structs.h>
#include <custom_structs.h>
#include <battle_locations.h>
#include <pkmn_types.h>
#include <abilities.h>
#include <moves.h>

#ifndef BATTLE_H_
#define BATTLE_H_

u8 get_side_from_bank(u8 bank);

void battle_script_push();

#endif