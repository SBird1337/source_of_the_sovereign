#include <battle.h>

#ifndef BATTLE_HELP_H_
#define BATTLE_HELP_H_

u8 get_item_effect(u8 bank, u8 check_negating_effects);
u16 damage_type_effectiveness_update(u8 attacking_type, u8 defending_type, u8 atk_bank, u8 def_bank, u16 chained_effect, u8 airstatus);
u16 apply_type_effectiveness(u16 chained_effect, u8 move_type, u8 target_bank, u8 atk_bank, u8 airstatus);
u16 type_effectiveness_calc(u16 move, u8 move_type, u8 atk_bank, u8 def_bank, u8 effects_handling_and_recording);
u8 has_type(u8 bank, u8 type);
u8 cant_poison(u8 bank, u8 self_inflicted);
u8 count_party_pokemon(u8 bank);
#endif