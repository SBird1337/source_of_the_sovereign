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

#include "camera_move.h"
//#include "cutscene_meteor.h"
#include <config/core.h>
#include <pokeagb/pokeagb.h>

/* === TYPES === */
typedef void (*special_func)();

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

void sp_show_item(void);

extern void sp_batchmaptile(void);

void get_text_pointer_from_lookup();

void sp_check_tileset();

void sp_set_rival(void);

void hide_item_unload_gfx(void);

extern void sp_crystal_fade(void);

extern pchar name_rival_male[5];
extern pchar name_rival_female[5];

/* === STATICS === */

static special_func special_routines[12] = {
    NULL,         cam_sp_move_camera, sp_init_script,  NULL, NULL,
    sp_random_number, sp_check_tileset,   sp_batchmaptile, sp_crystal_fade, sp_set_rival,
    sp_show_item, hide_item_unload_gfx
};

/* === IMPLEMENTATIONS === */

void sp_set_rival(void) {
    if (saveblock2->gender == GENDER_MALE) {
        pstrcpy(&(saveblock1->rival_name[0]), &name_rival_female[0]);
        pstrcpy(&(saveblock2->name[0]), &name_rival_male[0]);
    } else {
        pstrcpy(&(saveblock1->rival_name[0]), &name_rival_male[0]);
        pstrcpy(&(saveblock2->name[0]), &name_rival_female[0]);
    }
}

void sp_init_script() {
    for (u16 i = 0x1000; i < 0x1800; ++i)
        flag_clear(i);
    for (u16 i = 0x5000; i <= 0x5100; ++i)
        var_set(i, 0);
}

void sp_special_casm() // special 0x68
{
    u16 *var_special = var_access(CALLASM_VAR);
    special_routines[*var_special]();
}

void sp_clear_variables() {
    (void)var_set(MUGHSOT_1_TABLE, 0);
    (void)var_set(MUGHSOT_2_TABLE, 0);
    (void)var_set(MUGSHOT_1_X, 0);
    (void)var_set(MUGSHOT_2_X, 0);
    (void)var_set(MUGSHOT_1_Y, 0);
    (void)var_set(MUGSHOT_2_Y, 0);
    (void)var_set(TEXT_VAR, 0);
    return;
}

void sp_random_number() { var_set(0x800D, (rand() % var_load(0x8000))); }