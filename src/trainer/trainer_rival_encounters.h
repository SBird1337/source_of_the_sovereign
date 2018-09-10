#ifndef TRAINER_RIVAL_ENC_H_
#define TRAINER_RIVAL_ENC_H_

#include <pokeagb/pokeagb.h>

#define RIVAL_ENCOUNTER_COUNT 6

struct RivalEncounter {
    u8 partyCount;
    const union TrainerPokemonPtr partyArray;
    u8 trainerId;
};

const struct RivalEncounter rival_encounters[RIVAL_ENCOUNTER_COUNT];

#endif