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

 /**
 * @file player_interaction.c
 * @author Sturmvogel
 * @date 21 may 2017
 * @brief define tables for walking and behavior scripts
 */

#include <types.h>

extern const void *falling_script_baum_des_lebens;

void* script_walk_table[] =
{
    (void*)NULL
};

const void* behavior_walk_table[] =
{
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    (const  void*)NULL,
    &falling_script_baum_des_lebens,
    &falling_script_baum_des_lebens,
};