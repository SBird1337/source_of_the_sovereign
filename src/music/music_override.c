#include <bpre.h>
#include <config.h>

void music_override(u16 songid) {
    int skip = 0;
    if (flag_check(FLAG_ENABLE_MUSIC_OVERRIDES)) {
        u16 from1, from2, from3, to1, to2, to3;
        if ((from1 = *var_access(VAR_FROM_1)) == songid) {
            to1 = *var_access(VAR_TO_1);
            if (to1 == MUS_SKIP_PLAY) {
                skip = 1;
            } else if (to1 != MUS_NO_OVERRIDE) {
                songid = to1;
            }
        } else if ((from2 = *var_access(VAR_FROM_2)) == songid) {
            to2 = *var_access(VAR_TO_2);
            if (to2 == MUS_SKIP_PLAY) {
                skip = 1;
            } else if (to2 != MUS_NO_OVERRIDE) {
                songid = to2;
            }
        } else if ((from3 = *var_access(VAR_FROM_3)) == songid) {
            to3 = *var_access(VAR_TO_3);
            if (to3 == MUS_SKIP_PLAY) {
                skip = 1;
            } else if (to3 != MUS_NO_OVERRIDE) {
                songid = to3;
            }
        }
    }

    if (skip == 0) {
        MPlayStart_rev01(mplay_table[_songtable[songid].ms].ma, _songtable[songid].so);
    } else {
        MPlayContinue(mplay_table[_songtable[songid].ms].ma);
    }
}
