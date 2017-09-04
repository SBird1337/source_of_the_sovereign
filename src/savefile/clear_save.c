#include <pokeagb/pokeagb.h>

extern void sp_init_script(void);

void clear_sav1(void)
{
    memset(&stdsav1, 0, sizeof(struct SaveBlock1));
    sp_init_script();
}