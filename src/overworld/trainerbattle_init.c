#include <pokeagb/pokeagb.h>

void battle_intro_launch(u8 environment) {
    TaskCallback introTask;
    if (battle_type_flags & BATTLE_FLAG_LINK) {
        introTask = (TaskCallback)(0x080BCC4C | 1);
    } else if (battle_type_flags & 0x1000 && build_edition_identifier != 2) {
        introTask = (TaskCallback)(0x080BC6C8 | 1);
    } else {
        introTask = task00_battle_intro_by_env[environment];
    }
    struct Task *livingTask = &tasks[task_add(introTask, 0)];
    for (u8 i = 0; i <= 6; ++i)
        livingTask->priv[i] = 0;
    livingTask->priv[1] = environment;
}