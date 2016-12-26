/****************************************************************************
 * Copyright (C) 2015-2016 by the SotS Team                                 *
 *                                                                          *
 * This file is part of Sovereign of the Skies.                             *
 *                                                                          *
 *   Sovereign of the Skies is free software: you can redistribute it       *
 *   and/or modify it                                                       *
 *   under the terms of the GNU Lesser General Public License as published  *
 *   by the Free Software Foundation, either version 3 of the License, or   *
 *   (at your option) any later version provided you include a copy of the  *
 *   licence and this header.                                               *
 *                                                                          *
 *   Sovereign of the Skies is distributed in the hope that it will be      *
 *   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 *                                                                          *
 *   You should have received a copy of the GNU Lesser General Public       *
 *   License along with Sovereign of the Skies.                             *
 *   If not, see <http://www.gnu.org/licenses/>.                            *
 ****************************************************************************/

/**
 * @file music_override.c
 * @author ipatix
 * @date 15 dec 2016
 * @brief Play some custom music
 * 
 */

/* === INCLUDES === */

#include <sound.h>
#include <game_engine.h>
#include <config.h>

/* === PROTTYPES === */
/**
 * @brief overrides a music routine to load music ids from a custom variable
 * @param songid song_id to be overridden
 */
void music_override(u16 songid);

/* === IMPLEMENTATIONS === */
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
