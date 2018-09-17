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
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Manage callbacks and tasks
 * 
 * This header file provides methods to interact with callbacks and
 * the task handler. It also defines the superstate structure,
 * which contains callback information, sprite pointers, kesypad etc.
 */

#ifndef CALLBACK_H_
#define CALLBACK_H_

#include <objects.h>

/* === TYPES === */

typedef void (*callback)();

/* === STRUCTURES === */

struct int_superstate {
	callback callback1;
	callback callback2;
	callback callback2backup;
	callback callback5_vblank;
	callback hblank_callback;
	u32 field_14;
	u32 field_18;
	u32 bit_to_wait_for;
	u32 *ptr_vblank_counter;
	u32 field_24;
	u16 buttons_held;
	u16 buttons_new;
	u16 buttons_held_remapped;
	u16 buttons_new_remapped;
	u16 buttons_new_and_key_repeat;
	u32 keypad_countdown;
	u32 unused_padding;
	struct obj_entity sprites[128];
	u8 multi_purpose_state_tracker;
	u8 gpu_sprites_upload_skip;
 };

/* === EXTERN STRUCTURES === */
 
extern struct int_superstate superstate;

/* === EXTERN METHODS === */

/**
 * @brief sets the second main callback
 * @param address callback which should be set
 */
extern void set_callback2(callback address);

/**
 * @brief sets the vblank callback
 * @param address callback which should be set
 */
extern void vblank_handler_set(callback address);

/**
 * @brief does everything the overworld needs to do
 */
extern void callback_overworld();

/**
 * @brief executes the task handler stack
 */
extern void task_exec();

#endif