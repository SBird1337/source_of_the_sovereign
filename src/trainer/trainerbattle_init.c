#include <pokeagb/pokeagb.h>
#include <agb_debug.h>
#include <trainer_rival_encounters.h>
#include <pymap_constants.h>

void battle_intro_launch(u8 environment) {
    TaskCallback introTask;
    if (battle_type_flags & BATTLE_FLAG_LINK) {
        introTask = (TaskCallback)(0x080BCC4C | 1);
    } else if (battle_type_flags & 0x1000 && build_edition_identifier != 2) {
        introTask = (TaskCallback)(0x080BC6C8 | 1);
    } else {
        introTask = task00_battle_intro_by_env[environment];
    }
    struct Task *livingTask = &tasks[task_add(introTask, 0)];
    for (u8 i = 0; i <= 6; ++i)
        livingTask->priv[i] = 0;
    livingTask->priv[1] = environment;
}

union TrainerPokemonPtr battle_trainer_get_rival(u8 chosenStarterValue, u8 encounterNumber, enum TrainerPartyFlag flag) {
    u8 partyCount = rival_encounters[encounterNumber].partyCount;
    u8 structureSize = 0;
    switch(flag)
    {
        case TRAINER_PARTY_NONE:
            structureSize = sizeof(struct TrainerPokemonBase);
            break;
        case TRAINER_PARTY_HELD_ITEM:
            structureSize = sizeof(struct TrainerPokemonItem);
            break;
        case TRAINER_PARTY_MOVESET:
            structureSize = sizeof(struct TrainerPokemonMoves);
            break;
        case TRAINER_PARTY_HELD_ITEM_MOVESET:
            structureSize = sizeof(struct TrainerPokemonItemMoves);
            break;
        default:
            structureSize = sizeof(struct TrainerPokemonBase);
            break;
    }

    return (union TrainerPokemonPtr)(rival_encounters[encounterNumber].partyArray.undefinedStructure + (chosenStarterValue * partyCount * structureSize));
}

union TrainerPokemonPtr battle_trainer_get_rival_or_null(u8 tid) {
    for(u16 i = 0; i < RIVAL_ENCOUNTER_COUNT; ++i) {
        if(rival_encounters[i].trainerId == tid) {
            return battle_trainer_get_rival(var_load(VAR_STARTER_PLAYER_POKEMON), i, trainer_data[tid].flags);
        }
    }
    union TrainerPokemonPtr nullPokemon = {.undefinedStructure = NULL};
    return nullPokemon;
}

u8 battle_trainer_build_party(struct Pokemon *party, u16 tid) {
    if(tid == 0x400)
        return 0;
    //ignore some type of battles like old man or trainer tower where the party is determined otherwise
    dprintf("battle_type_flags: %x, tid: %d\n", battle_type_flags, tid);
    if ((battle_type_flags & 0x80908) == 8) {
        party_opponent_purge();
        for(u8 i = 0; i < trainer_data[tid].party_size; ++i) {
            u32 personalityValue;
            if(trainer_data[tid].is_double)
                personalityValue = 0x80;
            else if (trainer_data[tid].gender & 0x80)
                personalityValue = 0x78;
            else
                personalityValue = 0x88;
            u32 nameHash = 0;
            for(u8 j = 0; trainer_data[tid].name[j] != 0xFF; ++j){
                nameHash += trainer_data[tid].name[j];
            }
            //has custom items etc
            switch(trainer_data[tid].flags)
            {
                case TRAINER_PARTY_NONE:
                {
                    //nothing
                    const struct TrainerPokemonBase *pokeData = battle_trainer_get_rival_or_null(tid).noItemDefaultMoves;
                    if(pokeData == NULL)
                        pokeData = trainer_data[tid].party.noItemDefaultMoves;
                    dprintf("making pokemon with species: %d, struct: 0x%x\n", pokeData[i].species, pokeData);
                    for(u8 j = 0; pokemon_names[pokeData[i].species][j] != 0xFF; ++j) {
                        nameHash += pokemon_names[pokeData[i].species][j];
                    }
                    
                    personalityValue += nameHash << 8;
                    u8 iv = pokeData[i].iv * 31 / 255;

                    //no idea about the last 2 parameters, just do what the game does I guess
                    pokemon_make_full(&party[i], pokeData[i].species, pokeData[i].level, iv, true, personalityValue, 2, 0);
                    break;
                }
                case TRAINER_PARTY_MOVESET:
                {
                    const struct TrainerPokemonMoves *pokeData = battle_trainer_get_rival_or_null(tid).noItemCustomMoves;
                    if(pokeData == NULL)
                        pokeData = trainer_data[tid].party.noItemCustomMoves;
                        
                    dprintf("making pokemon with species: %d\n", pokeData[i].species);
                    //custom moveset
                    for(u8 j = 0; pokemon_names[pokeData[i].species][j] != 0xFF; ++j)
                        nameHash += pokemon_names[pokeData[i].species][j];
                    personalityValue += nameHash << 8;
                    u8 iv = pokeData[i].iv * 31 / 255;
                    pokemon_make_full(&party[i], pokeData[i].species, pokeData[i].level, iv, true, personalityValue, 2, 0);
                    for(u8 j = 0; j < 4; ++j) {
                        pokemon_setattr(&party[i], REQUEST_MOVE1 + j, (void*)&pokeData[i].moves[j]);
                        pokemon_setattr(&party[i], REQUEST_PP1 + j, (void*)&pokemon_moves[pokeData[i].moves[j]].pp);
                    }
                    break;
                }
                case TRAINER_PARTY_HELD_ITEM:
                {
                    //custom item
                    
                    const struct TrainerPokemonItem *pokeData = battle_trainer_get_rival_or_null(tid).itemDefaultMoves;
                    if(pokeData == NULL)
                        pokeData = trainer_data[tid].party.itemDefaultMoves;

                    dprintf("making pokemon with species: %d\n", pokeData[i].species);
                    for(u8 j = 0; pokemon_names[pokeData[i].species][j] != 0xFF; ++j)
                        nameHash += pokemon_names[pokeData[i].species][j];
                    personalityValue += nameHash << 8;
                    u8 iv = pokeData[i].iv * 31 / 255;
                    pokemon_make_full(&party[i], pokeData[i].species, pokeData[i].level, iv, true, personalityValue, 2, 0);
                    
                    pokemon_setattr(&party[i], REQUEST_HELD_ITEM, (void*)&pokeData[i].Item);
                    break;
                }
                case TRAINER_PARTY_HELD_ITEM | TRAINER_PARTY_MOVESET:
                {
                    //custom all the things
                    const struct TrainerPokemonItemMoves *pokeData = battle_trainer_get_rival_or_null(tid).customItemCustomMoves;
                    if(pokeData == NULL)
                        pokeData = trainer_data[tid].party.customItemCustomMoves;

                    dprintf("making pokemon with species: %d\n", pokeData[i].species);  
                    for(u8 j = 0; pokemon_names[pokeData[i].species][j] != 0xFF; ++j)
                        nameHash += pokemon_names[pokeData[i].species][j];
                    personalityValue += nameHash << 8;
                    u8 iv = pokeData[i].iv * 31 / 255;
                    pokemon_make_full(&party[i], pokeData[i].species, pokeData[i].level, iv, true, personalityValue, 2, 0);
                    
                    pokemon_setattr(&party[i], REQUEST_HELD_ITEM, (void*)&pokeData[i].Item);
                    for(u8 j = 0; j < 4; ++j) {
                        pokemon_setattr(&party[i], REQUEST_MOVE1 + j, (void*)&pokeData[i].moves[j]);
                        pokemon_setattr(&party[i], REQUEST_PP1 + j, (void*)&pokemon_moves[pokeData[i].moves[j]].pp);
                    }
                    break;
                }
                
            }
        }
        battle_type_flags |= trainer_data[tid].is_double;
    }
    (void) party;
    return trainer_data[tid].party_size;
}