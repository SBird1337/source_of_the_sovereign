#ifndef BATTLE_INITIATIVE_H
#define BATTLE_INITIATIVE_H

#include <battle.h>
#include <bpre.h>

enum init_enum {ONE, TWO, TIE};

enum init_enum get_first_strike_bank(u8 bank1, u8 bank2, u8 ignore_prio);

#endif /* BATTLE_INITIATIVE_H */

