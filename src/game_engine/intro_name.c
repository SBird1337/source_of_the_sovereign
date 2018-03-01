#include <agb_debug.h>
#include <pokeagb/pokeagb.h>

extern pchar name_rival_male[5];
extern pchar name_rival_female[5];

void name_set_hero_rival(bool naming_turn_rival, u8 name_rival) {
    if (!naming_turn_rival) {
        pstrcpy(&saveblock2->name[0],
                (saveblock2->gender == GENDER_MALE) ? &name_rival_male[0] : &name_rival_female[0]);
    } else {
        (void)name_rival;
        pstrcpy(&saveblock1->rival_name[0],
                (saveblock2->gender == GENDER_MALE) ? &name_rival_female[0] : &name_rival_male[0]);
    }
}