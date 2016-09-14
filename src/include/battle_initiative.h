#ifndef BATTLE_INITIATIVE_H
#define BATTLE_INITIATIVE_H

#include <types.h>

enum init_enum {ONE, TWO, TIE};

enum init_enum get_first_to_strike(u8 bank1, u8 bank2, u8 ignore_prio);
u16 get_speed(u8 bank);
#endif /* BATTLE_INITIATIVE_H */

