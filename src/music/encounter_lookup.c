#include <songlist.h>
#include <game_engine.h>

u16 trainer_intro_music_id_to_song(u8 introid) {
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
