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
 * @file callback.h
 * @author ipatix
 * @date 15 dec 2016
 * @brief Manage callbacks and tasks
 * 
 * This header file provides methods to interact with callbacks and
 * the task handler. It also defines the superstate structure,
 * which contains callback information, sprite pointers, kesypad etc.
 */

#ifndef SOUND_H_
#define SOUND_H_

#include "types.h"

typedef struct music_player_area music_player_area;
typedef struct music_player_track music_player_track;
typedef struct song_header song_header;

typedef struct
{
    music_player_area *ma;
    music_player_track *ta;
    u32 tn;
} m_play_table;

typedef struct
{
    song_header *so;
    u16 ms, me;
} song_table;

extern m_play_table mplay_table[];
extern song_table _songtable[];
void m4aSongNumStart(u16 songid);
void MPlayStart_rev01(music_player_area *ma, song_header *so);
void MPlayContinue(music_player_area *ma);
void MPlayAllStop(void);

// battle and map related stuff
void current_map_music_set(u16);
void current_map_music_set_to_zero(void);
void current_map_music_fadeout(u8);

#endif
