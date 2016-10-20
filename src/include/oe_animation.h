#ifndef OE_ANIMATION_H
#define OE_ANIMATION_H

#include <bpre.h>

struct oe_state
{
    u32 to_x___local_id;
    u32 to_y___local_mapnumber;
    u32 height_lsr_4___local_mapbank;
    u32 field_C;
    u32 local_id_and_mapnumber;
    u32 local_mapbank;
    void* sav1_location;
    u32 field_1C;
};
extern struct oe_state current_oe_state;

struct npc_state
{
    u8 bitfield;
    u8 field_1;
    u8 field_2;
    u8 field_3;
    u8 oam_id;
    u8 type_id;
    u8 running_behavior;
    u8 is_trainer;
    u8 local_id;
    u8 local_mapnumber;
    u8 local_mapbank;
    u8 height;
    struct coords16 stay_around;
    struct coords16 to;
    struct coords16 from;
    u8 direction;
    u8 movement_area;
    u8 field_1A;
    u8 oamid2;
    u8 an_index;
    u8 sight_distance;
    u8 tile_to;
    u8 tile_from;
    u8 unknown_1;
    u8 unknown_2;
    u8 field_22;
    u8 field_23;
};

#endif /* OE_ANIMATION_H */

