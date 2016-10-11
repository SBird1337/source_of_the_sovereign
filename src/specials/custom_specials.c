#include <bpre.h>
#include "cutscene_meteor.h"
#include "camera_move.h"
#include <debug.h>

void dns_switch()
{
    volatile u8* test_pointer = (u8*) (0x0203FAB0);
    *(test_pointer+1) = (*(test_pointer+1) == 3 ? 0 : (*(test_pointer+1)) + 1);
    *test_pointer = 1;
}

void init_script()
{
  for(u16 i = 0x1000; i < 0x1800; ++i)
  {
    clear_flag(i);
  }
}

static callback special_routines[5] = {
	play_meteor,
	sp_move_camera,
	init_script,
        some_test,
        dns_switch,
};


void special_asm() //special 0x68
{
	u16* var_special = var_access(CALLASM_VAR);
	special_routines[*var_special]();
}
