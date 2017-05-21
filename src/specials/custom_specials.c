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
 * @file custom_specials.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Special 0x68 implementation to read from LASTRESULT and execute
 * 
 */

/* === INCLUDES === */

#include "cutscene_meteor.h"
#include "camera_move.h"
#include <callback.h>
#include <debug.h>
#include <game_engine.h>
#include <config.h>
#include <math.h>

/* === PROTOTYPES === */

/**
 * @brief test routine to switch dns
 */
void sp_dns_switch();

/**
 * @brief clear some flags at the beginning of the game
 */
void sp_init_script();


/**
 * @brief callasm to call a var-based routine as defined
 */
void sp_special_casm();

/**
 * @brief clears some variables at the end of a script
 */
void sp_clear_variables();

/**
 * @brief generate a random number, store in last result
 */
void sp_random_number();


void get_text_pointer_from_lookup();

void sp_check_tileset();

/* === STATICS === */

static callback special_routines[7] = {
    met_play,
    cam_sp_move_camera,
    sp_init_script,
    debug_some_test,
    sp_dns_switch,
    sp_random_number,
    sp_check_tileset
};

/* === IMPLEMENTATIONS === */

void sp_dns_switch()
{
    volatile u8* test_pointer = (u8*) (0x0203FAB0);
    *(test_pointer+1) = (*(test_pointer+1) == 3 ? 0 : (*(test_pointer+1)) + 1);
    *test_pointer = 1;
}

void sp_init_script()
{
  for(u16 i = 0x1000; i < 0x1800; ++i)
  {
    flag_clear(i);
  }
}

void sp_special_casm() //special 0x68
{
    u16* var_special = var_access(CALLASM_VAR);
    special_routines[*var_special]();
}

void sp_clear_variables()
{
    (void) var_set(MUGHSOT_1_TABLE, 0);
    (void) var_set(MUGHSOT_2_TABLE, 0);
    (void) var_set(MUGSHOT_1_X, 0);
    (void) var_set(MUGSHOT_2_X, 0);
    (void) var_set(MUGSHOT_1_Y, 0);
    (void) var_set(MUGSHOT_2_Y, 0);
    (void) var_set(TEXT_VAR, 0);
    return;
}

void sp_random_number()
{
    var_set(0x800D, (__aeabi_uidivmod(random(), var_get(0x8000))));
}