#ifndef OE_ANIMATION_H
#define OE_ANIMATION_H

#include <types.h>

struct oe_state
{
    u32 to_x___local_id;
    u32 to_y___local_mapnumber;
    u32 height_lsr_4___local_mapbank;
    u32 field_C;
    u32 local_id_and_mapnumber;
    u32 local_mapbank;
    u32 sav1_location;
    u32 field_1C;
};
extern struct oe_state current_oe_state;

//TODO: find correct return type
u32 oe_exec(u8 animation_number);

#endif /* OE_ANIMATION_H */

