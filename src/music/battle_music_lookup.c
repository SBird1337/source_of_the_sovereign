#include <songlist.h>
#include <game_engine.h>
#include <bpre.h>
#include <battle_structs.h>
#include <battle_common.h>
#include <pokemon.h>
#include <agb_debug.h>
#include <sound.h>
#include <config.h>

#define SONG_ID_SKIP_PLAY 0xFFFF

#define skip_song flag_check(FLAG_SKIP_BATTLE_MUSIC)

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

// replaces 0x08044090
void mhk_current_map_music_set_default_for_battle(u16 songid) {
    if (skip_song)
        return;
    if (songid == 0) {
        songid = mhk_song_id_for_battle();
        if (songid != SONG_ID_SKIP_PLAY) {
            current_map_music_set_to_zero();
            MPlayAllStop();
            current_map_music_set(songid);
        }
    } else {
        current_map_music_set_to_zero();
        MPlayAllStop();
        current_map_music_set(songid);
    }
}

void mhk_trainer_battle_play_defeat(void) {
    if (skip_song)
        return;
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

    song_play_for_text(song);
}

void mhk_wild_poke_def_music(void) {
    if (!skip_song) {
        song_play_for_text(SEQ_BGM_VIC_POKE);
    }
}

// this seems to work by special 0x138 only
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

// hook from loc_80159D0
void mhk_fadeout(void) {
    void (*sub_8070E44)(u8) = (void (*)(u8))(0x08070E44|1);
    sub_8070E44(3); // no idea what these values do
    if (!skip_song) {
        current_map_music_fadeout(5); // same here
    }
}
