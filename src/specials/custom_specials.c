#include <bpre.h>
#include "cutscene_meteor.h"
#include "camera_move.h"
#include <debug.h>

void init_script()
{
  for(u16 i = 0x1000; i < 0x1800; ++i)
  {
    clear_flag(i);
  }
}

static callback special_routines[4] = {
	play_meteor,
	sp_move_camera,
	init_script,
        some_test,
};


void special_asm() //special 0x68
{
	u16* var_special = var_access(CALLASM_VAR);
	special_routines[*var_special]();
}
