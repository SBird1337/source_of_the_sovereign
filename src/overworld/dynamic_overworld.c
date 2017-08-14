#include <pokeagb/pokeagb.h>

enum PalStoreType{
    UNUSED,
    NPC,
    REFLECTION,
    OTHER
};

struct PalStoreEntry{
    enum PalStoreType type;
    u8 reference_count;
    u16 tag; 
};

extern struct PalStoreEntry stored_palettes[16];

u8 dynamic_npc_load_palette(u16 tag)
{

}

