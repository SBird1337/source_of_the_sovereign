/****************************************************************************
 * Copyright (C) 2015-2017 by the SotS Team                                 *
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

/* 
 * File:   save_one.h
 * Author: Sturmvogel
 *
 * Created on May 2, 2017
 * @brief Provides structures for save file access
*/

#ifndef SAVE_ONE_H
#define SAVE_ONE_H

#include <types.h>

/* === STRUCTURES === */

/* === STRUCTURES === */
struct lt_point
{
    u16 x;
    u16 y;
};

struct lt_warpdata
{
    u8 bank;
    u8 map;
    u8 warpid;
    u8 unknown;
    u16 enter_x;
    u16 enter_y;
};

struct sav_struct
{
    struct lt_point position;
    struct lt_warpdata location;
};

extern struct sav_struct *sav_one;

#endif /* SAVE_ONE_H */
