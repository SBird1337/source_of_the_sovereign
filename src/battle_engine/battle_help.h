#include <battle.h>

#ifndef BATTLE_HELP_H_
#define BATTLE_HELP_H_

u16 damage_type_effectiveness_update(u8 attacking_type, u8 defending_type, u8 atk_bank, u8 def_bank, u16 chained_effect, u8 airstatus);
u16 apply_type_effectiveness(u16 chained_effect, u8 move_type, u8 target_bank, u8 atk_bank, u8 airstatus);
u16 type_effectiveness_calc(u16 move, u8 move_type, u8 atk_bank, u8 def_bank, u8 effects_handling_and_recording);
#endif