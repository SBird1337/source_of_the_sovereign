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
 * @file camera_move.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Scene to update the camera
 * 
 * This provides implementations to move the game camera
 */

/* === INCLUDES === */

#include <game_engine.h>
#include "camera_move.h"
#include <callback.h>
#include <fade.h>
#include <config.h>
#include <lcd.h>

/* === PROTOTYPES === */

/**
 * @brief special to handle the camera update scene
 */
void cam_cb_move_camera();

/**
 * @brief vblank screen update method for the camera scene
 */
void cam_update_screen();

/* === STRUCTURES === */

struct cam_point {
  u16 x;
  u16 y;
};

/* === STATIC STRUCTURES === */

struct cam_point** sav_data_map = (struct cam_point**)(0x03005008);

/* === IMPLEMENTATIONS === */

void cam_update_screen()
{
	fade_update();
	task_exec();
	objc_exec();
	obj_sync();
	gpu_pal_upload();
	obj_gpu_sprites_upload();
}

void cam_sp_move_camera()
{
  set_callback2(cam_cb_move_camera);
  fade_screen(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
  vblank_handler_set(cam_update_screen);
}

void cam_cb_move_camera()
{
    if((fade_controller.mix_color & 0x8000) == 0)
    {
      u16 camera_x = *var_access(CAMERA_VAR_X);
      u16 camera_y = *var_access(CAMERA_VAR_Y);

      (*sav_data_map)->x = camera_x;
      (*sav_data_map)->y = camera_y;
      //camera_move_and_redraw(camera_x, camera_y);
      set_callback2(callback_overworld);
    }
}
