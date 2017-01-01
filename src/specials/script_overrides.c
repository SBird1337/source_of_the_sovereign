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
 * @file script_overrides.c
 * @author Sturmvogel
 * @date 01 Jan 2016
 * @brief Override some internal script commands e.g. end
 *
 */


/* === INCLUDE === */

#include <game_engine.h>
#include <types.h>
#include <config.h>

/* === PROTOTYPES === */

/**
 * @brief set the script environment to end_of_script
 */
extern void script_mode_set_stopped();

/**
 * @brief command to end a script
 * @return always false (for the script environment)
 */
u8 s02_end();

/* === IMPLEMENTATIONS === */

u8 s02_end()
{
    var_set(MUGHSOT_1_TABLE, 0);
    var_set(MUGHSOT_2_TABLE, 0);
    var_set(MUGSHOT_1_X, 0);
    var_set(MUGSHOT_2_X, 0);
    var_set(MUGSHOT_1_Y, 0);
    var_set(MUGSHOT_2_Y, 0);
    var_set(TEXT_VAR, 0);
    script_mode_set_stopped();
    return false;
}