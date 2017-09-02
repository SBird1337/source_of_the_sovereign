#include <pokeagb/pokeagb.h>

#define CRYSTAL_MAX_INTENSITY 5
#define CRYSTAL_SPEED 1

void task_fade_flash(u8 id) {
    switch (tasks[id].priv[1]) {
    case 0:
        fade_screen(0xFFFFFFFF, CRYSTAL_SPEED, 0, CRYSTAL_MAX_INTENSITY, tasks[id].priv[0]);
        tasks[id].priv[1]++;
        break;
    case 1:
        if (!pal_fade_control.active) {
            fade_screen(0xFFFFFFFF, CRYSTAL_SPEED, CRYSTAL_MAX_INTENSITY, 0, tasks[id].priv[0]);
            tasks[id].priv[1]++;
        }
        break;
    case 2:
        if (!pal_fade_control.active) {
            task_del(id);
            script_env_2_enable_and_set_ctx_running();
        }
        break;
    }
}

void sp_crystal_fade(void) {
    u16 color = var_8000;
    u8 t_id = task_add(task_fade_flash, 1);
    tasks[t_id].priv[0] = color;
}