#include <songlist.h>
#include <game_engine.h>
#include <bpre.h>
#include <battle_structs.h>
#include <battle_common.h>
#include <pokemon.h>

u16 mhk_intro_music_id_to_song(u8 introid) {
    u16 res = 0;

    switch (introid) {
        case 0:
        case 4:
        case 5:
        case 8:
        case 10:
        case 11:
        case 12:
        case 13:
            res = SEQ_FRLG_E_3;
            break;
        case 1:
        case 2:
        case 9:
            res = SEQ_FRLG_E_2;
            break;
        default:
            res = SEQ_FRLG_E_3;
            break;
    }

    return res;
}

// replaces sub_08043FD4
u16 mhk_song_id_for_battle(void) {
    u16 res = 0;

    if (battle_type_flags._battle_unk_3) {
        res = SEQ_BGM_VS_POKE;
    } else if (battle_type_flags._battle_unk_5 || battle_type_flags.battle_link) {
        res = SEQ_BGM_VS_RSE;
    } else if (battle_type_flags.battle_trainer) {
        switch (trainer_data[trainerbattle_flag_id].trainer_class) {
            case 90:
                res = SEQ_BGM_VS_CHAMP;
                break;
            case 84:
            case 87:
                res = SEQ_BGM_VS_LEADER;
                break;
            default:
                res = SEQ_BGM_VS_TRAINER;
                break;
        }
    } else {
        res = SEQ_BGM_VS_POKE;
    }

    return res;
}

void mhk_trainer_battle_play_defeat(void) {
    u16 song = 0;

    switch (trainer_data[trainerbattle_flag_id].trainer_class) {
        case 84:
        case 90:
            song = SEQ_BGM_VIC_LEADER;
            break;
        default:
            song = SEQ_BGM_VIC_TRAINER;
            break;
    }

    //song_play_for_text(song);
}

void mhk_wild_poke_def_music(void) {
    //song_play_for_text(SEQ_BGM_VIC_POKE);
}

u16 mhk_species_to_song(u16 species) {
    u16 res = 0;

    switch (species) {
        case POKE_MEWTWO:
            res = SEQ_BGM_VS_MEWTWO;
            break;
        case POKE_ARTICUNO:
        case POKE_ZAPDOS:
        case POKE_MOLTRES:
        case POKE_LUGIA:
        case POKE_HOOH:
            res = SEQ_BGM_VS_LEG1;
            break;
        case POKE_DEOXYS:
            res = SEQ_BGM_VS_DEOXYS;
            break;
        default:
            res = SEQ_BGM_VS_RSE;
            break;
    }

    return res;
}
