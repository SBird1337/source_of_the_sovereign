#include <battle.h>

void battle_end_of_turn() {
    for (int i = 0; i < 4; ++i) {
        if (battle_participants[i].type1 == TYPE_EGG)
            battle_participants[i].type1 = TYPE_FLYING;
        if (battle_participants[i].type2 == TYPE_EGG)
            battle_participants[i].type2 = TYPE_FLYING;
    }
    return;
}