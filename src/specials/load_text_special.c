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
 * @file load_text_special.c
 * @author Sturmvogel
 * @date 05 Jan 2016
 * @brief special 0x69 0x6A
 * 
 * Implements a new way to load text for more language compatability and code
 * interchangability.
 */

/* === INCLUDE === */
#include <types.h>
#include <game_engine.h>
#include <config/core.h>
#include <save_one.h>

/* === PROTOTYPES === */

/**
 * @brief load text according to bank, map and text_id
 */
void sp_load_text_map();

/**
 * @brief load text according to bank, map, person id and text_id
 */
void sp_load_text_person();

/* === GLOBALS === */

char* str_invalid_text_ref;
char***** text_lookup_table;   

void** loadpointer = (void**)((0x03000EB0 + 0x64));

/* === IMPLEMENTATIONS === */
void sp_load_text_map()
{
    u8 bank = sav_one->location.bank;
    u8 map = sav_one->location.map;
    for(int i = 0; i<=bank;++i)
    {
        if(text_lookup_table[i] == (char****)(0xDEADBEEF))
        {
            *loadpointer =str_invalid_text_ref;
            return;
        }
    }
    for(int i = 0; i<=map; ++i)
    {
        if(text_lookup_table[bank][i] == (char***)(0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    if(text_lookup_table[bank][map][0] == (char**)(0xDEADBEEF))
    {
        *loadpointer = str_invalid_text_ref;
        return;
    }
    u16 text_id = var_get(0x500C);
    for(int i = 0; i<= text_id; ++i)
    {
        if(text_lookup_table[bank][map][0][i] == (char*)(0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    *loadpointer = text_lookup_table[bank][map][0][text_id];
    return;
}

void sp_load_text_person()
{
    u8 bank = sav_one->location.bank;
    u8 map = sav_one->location.map;
    for(int i = 0; i<= bank; ++i)
    {
        if(text_lookup_table[i] == (char****)(0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    for(int i = 0; i<= map; ++i)
    {
        if(text_lookup_table[bank][i] == (char***) (0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    u16 person_id = var_get(0x800F);    // LASTTALKED
    for(int i = 0; i<= person_id; ++i)
    {
        if(text_lookup_table[bank][map][i] == (char**) (0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    u16 text_id = var_get(0x500C);   //TEXT_VAR
    for(int i = 0; i<= text_id; ++i)
    {
        if(text_lookup_table[bank][map][person_id][i] == (char*) (0xDEADBEEF))
        {
            *loadpointer = str_invalid_text_ref;
            return;
        }
    }
    *loadpointer = text_lookup_table[bank][map][person_id][text_id];
    return;
}