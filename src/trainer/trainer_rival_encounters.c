#include <pokeagb/pokeagb.h>
#include <constants/pkmns.h>
#include "trainer_rival_encounters.h"


const struct TrainerPokemonBase rival_first_encounter[21][1] = {
    //Bisasam
    {
        {
            .species = PKMN_GLUMANDA,
            .level = 5
        },
    },

    //Glumanda
    {
        {
            .species = PKMN_SCHIGGY,
            .level = 5
        },
    },
    //Schiggy
    {
        {
            .species = PKMN_BISASAM,
            .level = 5
        },
    },
    //Endivie
    {
        {
            .species = PKMN_FEURIGEL,
            .level = 5
        },
    },

    //Feurigel
    {
        {
            .species = PKMN_KARNIMANI,
            .level = 5
        },
    },
    //Karnimani
    {
        {
            .species = PKMN_ENDIVIE,
            .level = 5
        },
    },
    //Geckarbor
    {
        {
            .species = PKMN_FLEMMLI,
            .level = 5
        },
    },

    //Flemmli
    {
        {
            .species = PKMN_HYDROPI,
            .level = 5
        },
    },
    //Hydropi
    {
        {
            .species = PKMN_GECKARBOR,
            .level = 5
        },
    },
    //Chelast
    {
        {
            .species = PKMN_PANFLAM,
            .level = 5
        },
    },

    //Panflam
    {
        {
            .species = PKMN_PLINFA,
            .level = 5
        },
    },
    //Plinfa
    {
        {
            .species = PKMN_CHELAST,
            .level = 5
        },
    },
    //Serpifeu
    {
        {
            .species = PKMN_FLOINK,
            .level = 5
        },
    },

    //Floink
    {
        {
            .species = PKMN_OTTARO,
            .level = 5
        },
    },
    //Ottaro
    {
        {
            .species = PKMN_SERPIFEU,
            .level = 5
        },
    },
    //Igamaro
    {
        {
            .species = PKMN_FYNX,
            .level = 5
        },
    },

    //Fynx
    {
        {
            .species = PKMN_FROXY,
            .level = 5
        },
    },
    //Froxy
    {
        {
            .species = PKMN_IGAMARO,
            .level = 5
        },
    },
    //Bauz
    {
        {
            .species = PKMN_FLAMIAU,
            .level = 5
        },
    },

    //Flamiau
    {
        {
            .species = PKMN_ROBBALL,
            .level = 5
        },
    },
    //Robball
    {
        {
            .species = PKMN_BAUZ,
            .level = 5
        },
    },
};

const struct RivalEncounter rival_encounters[RIVAL_ENCOUNTER_COUNT] = {
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 1}, //male easy
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 2}, //male medium
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 3}, //male hard
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 4}, //female easy
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 5}, //female medium
    {.partyCount = 1, .partyArray = {&rival_first_encounter[0][0]}, .trainerId = 6}, //female hard
};