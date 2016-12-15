#include <bpre.h>
#include "camera_move.h"

struct point** sav_data_map = (struct point**)(0x03005008);

struct point {
  u16 x;
  u16 y;
};

void update_screen_cam()
{
	fade_update();
	task_exec();
	objc_exec();
	obj_sync();
	gpu_pal_upload();
	obj_gpu_sprites_upload();
}

void sp_move_camera()
{
  set_callback2(sp_move_camera_callback);
  fade_screen(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
  vblank_handler_set(update_screen_cam);
}

void sp_move_camera_callback()
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
