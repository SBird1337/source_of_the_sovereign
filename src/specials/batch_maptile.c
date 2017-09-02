#include <pokeagb/pokeagb.h>

void sp_batchmaptile(void) {
    u16 tid_from = var_8000;
    u16 tid_to = var_8001;
    u8 collision_from = var_8002;
    u8 collision_to = var_8003;

    for (u8 x = 0; x < virtual_map_header.width; ++x) {
        for(u8 y = 0; y < virtual_map_header.height; ++y)
        {
            struct MapTile *current = &virtual_map_header.data[x + virtual_map_header.width * y];
            if(current->tile == tid_from && current->permission == collision_from)
            {
                current->tile = tid_to;
                current->permission = collision_to;
            }
        }
    }
}