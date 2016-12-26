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
 * @file debug.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Operate with the sots debug engine, very temporary
 */

#ifndef DEBUG_H
#define DEBUG_H

/* === MACROS === */
#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)
#define assert(EX)  if(!EX) {as_assert(STRINGIFY(EX), __FILE__, __LINE__);}

struct print_engine{
    
    u8 line;
    u8 row;
    u8 color;
};

/**
 * @brief temporary method to initiate a debug process / unit test
 */
void debug_some_test();

/**
 * @brief set bg color
 * @param color color to set bg to
 */
void debug_set_bg(u16 color);

/**
 * @brief clean debug screen from any text and reset cursor
 */
void debug_clean();

/**
 * @brief print string onto debug environment at current position with parsing
 * @param str string to print
 */
void debug_print(char* str);

/**
 * @brief wait for button press
 * @param field bitfield to specify buttom combination
 */
void debug_wait_for_btn(u16 field);

/**
 * @brief print in format to debug environment
 * @param str string with format
 * @param arg argument to print (only one, not an array)
 */
void debug_printf(char* str, int arg);

/**
 * @brief handle for the assert scene
 */
void debug_assert_scene();

void as_assert(char* expression, char* file, int line);

#endif /* DEBUG_H */

