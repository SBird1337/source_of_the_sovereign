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
            res = 480;
            break;
        case 1:
            res = 480;
            break;
        case 2:
            res = 480;
            break;
        case 3:
            res = 471;
            break;
        case 4:
            res = 471;
            break;
        case 5:
            res = 480;
            break;
        case 6:
            res = 487;
            break;
        case 7:
            res = 476;
            break;
        case 8:
            res = 471;
            break;
        case 9:
            res = 471;
            break;
        case 10:
            res = 480;
            break;
        case 11:
            res = 480;
            break;
        case 12:
            res = 480;
            break;
        case 13:
            res = 480;
            break;
        case 14:
            res = 488;
            break;
        case 15:
            res = 475;
            break;
        case 16:
            res = 475;
            break;
        case 17:
            res = 470;
            break;
        case 18:
            res = 495;
            break;
        case 19:
            res = 480;
            break;
        case 20:
            res = 475;
            break;
        case 21:
            res = 481;
            break;
        case 22:
            res = 471;
            break;
        case 23:
            res = 471;
            break;
        case 24:
            res = 473;
            break;
        case 25:
            res = 473;
            break;
        case 26:
            res = 480;
            break;
        case 27:
            res = 480;
            break;
        case 28:
            res = 491;
            break;
        case 29:
            res = 488;
            break;
        case 30:
            res = 488;
            break;
        case 31:
            res = 488;
            break;
        case 32:
            res = 491;
            break;
        case 33:
            res = 490;
            break;
        case 34:
            res = 472;
            break;
        case 35:
            res = 472;
            break;
        case 36:
            res = 471;
            break;
        case 37:
            res = 492;
            break;
        case 38:
            res = 492;
            break;
        case 39:
            res = 490;
            break;
        case 40:
            res = 472;
            break;
        case 41:
            res = 491;
            break;
        case 42:
            res = 480;
            break;
        case 43:
            res = 493;
            break;
        case 44:
            res = 495;
            break;
        case 45:
            res = 495;
            break;
        case 46:
            res = 472;
            break;
        case 47:
            res = 473;
            break;
        case 48:
            res = 472;
            break;
        case 49:
            res = 480;
            break;
        case 50:
            res = 470;
            break;
        case 51:
            res = 470;
            break;
        case 52:
            res = 470;
            break;
        case 53:
            res = 494;
            break;
        case 54:
            res = 494;
            break;
        case 55:
            res = 494;
            break;
        case 56:
            res = 494;
            break;
        case 57:
            res = 494;
            break;
        case 58:
            res = 494;
            break;
        case 59:
            res = 494;
            break;
        case 60:
            res = 494;
            break;
        case 61:
            res = 494;
            break;
        case 62:
            res = 494;
            break;
        case 63:
            res = 473;
            break;
        case 64:
            res = 473;
            break;
        case 65:
            res = 470;
            break;
        case 66:
            res = 470;
            break;
        case 67:
            res = 490;
            break;
        case 68:
            res = 491;
            break;
        case 69:
            res = 490;
            break;
        case 70:
            res = 490;
            break;
        case 71:
            res = 491;
            break;
        case 72:
            res = 480;
            break;
        case 73:
            res = 495;
            break;
        case 74:
            res = 490;
            break;
        case 75:
            res = 474;
            break;
        case 76:
            res = 476;
            break;
        case 77:
            res = 476;
            break;
        case 78:
            res = 477;
            break;
        case 79:
            res = 477;
            break;
        case 80:
            res = 496;
            break;
        case 81:
            res = 475;
            break;
        case 82:
            res = 475;
            break;
        case 83:
            res = 472;
            break;
        case 84:
            res = 471;
            break;
        case 85:
            res = 494;
            break;
        case 86:
            res = 490;
            break;
        case 87:
            res = 486;
            break;
        case 88:
            res = 478;
            break;
        case 89:
            res = 472;
            break;
        case 90:
            res = 484;
            break;
        case 91:
            res = 472;
            break;
        case 92:
            res = 481;
            break;
        case 93:
            res = 485;
            break;
        case 94:
            res = 472;
            break;
        case 95:
            res = 472;
            break;
        case 96:
            res = 472;
            break;
        case 97:
            res = 470;
            break;
        case 98:
            res = 496;
            break;
        case 99:
            res = 480;
            break;
        case 100:
            res = 480;
            break;
        case 101:
            res = 481;
            break;
        case 102:
            res = 481;
            break;
        case 103:
            res = 495;
            break;
        case 104:
            res = 475;
            break;
        case 105:
            res = 471;
            break;
        case 106:
            res = 490;
            break;
        case 107:
            res = 495;
            break;
        case 108:
            res = 481;
            break;
        case 109:
            res = 495;
            break;
        case 110:
            res = 495;
            break;
        case 111:
            res = 482;
            break;
        case 112:
            res = 482;
            break;
        case 113:
            res = 483;
            break;
        case 114:
            res = 495;
            break;
        case 115:
            res = 472;
            break;
        case 116:
            res = 495;
            break;
        case 117:
            res = 482;
            break;
        case 118:
            res = 483;
            break;
        case 119:
            res = 483;
            break;
        default:
            res = SEQ_FRLG_E_1;
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
            case 88:
                res = 527;
                break;
            case 90:
                res = 528;
                break;
            case 93:
                res = 524;
                break;
            case 111:
                res = 532;
                break;
            case 112:
                res = 529;
                break;
            case 113:
                res = 530;
                break;
            case 117:
                res = 532;
                break;
            case 118:
                res = 530;
                break;
            case 119:
                res = 531;
                break;
            default:
                res = 522;
                break;
        }
    } else {
        res = 523;
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
            res = 526;
            break;
        case POKE_DEOXYS:
            res = 525;
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
