/*#include <pokeagb/pokeagb.h>

typedef bool (*MovementCallback)(struct NpcState *npc, struct Object *obj);

#define an_stop ((MovementCallback)0x08067935)

bool movement_frame_set_general(struct NpcState *npc, struct Object *obj, u8 frame) {
    obj->anim_delay |= 0x40;
    obj->priv[2] = 1;
    npc_set_direction(npc, 1);
    npc_coords_shift_still(npc);
    obj_npc_animation_step(npc, obj, frame);
    return true;
}

bool an_fs_zero(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 0); }
bool an_fs_one(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 1); }
bool an_fs_two(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 2); }
bool an_fs_three(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 3); }
bool an_fs_four(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 4); }
bool an_fs_five(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 5); }
bool an_fs_six(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 6); }
bool an_fs_seven(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 7); }
bool an_fs_eight(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 8); }
bool an_fs_nine(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 9); }
bool an_fs_ten(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 10); }
bool an_fs_eleven(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 11); }
bool an_fs_twelve(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 12); }
bool an_fs_thirteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 13); }
bool an_fs_fourteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 14); }
bool an_fs_fifteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 15); }
bool an_fs_sixteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 16); }
bool an_fs_seventeen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 17); }
bool an_fs_eighteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 18); }
bool an_fs_nineteen(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 19); }
bool an_fs_twenty(struct NpcState *npc, struct Object *obj) { return movement_frame_set_general(npc, obj, 20); }

const MovementCallback mv_set_frame_zero[] = {an_fs_zero, an_stop};
const MovementCallback mv_set_frame_one[] = {an_fs_one, an_stop};
const MovementCallback mv_set_frame_two[] = {an_fs_two, an_stop};
const MovementCallback mv_set_frame_three[] = {an_fs_three, an_stop};
const MovementCallback mv_set_frame_four[] = {an_fs_four, an_stop};
const MovementCallback mv_set_frame_five[] = {an_fs_five, an_stop};
const MovementCallback mv_set_frame_six[] = {an_fs_six, an_stop};
const MovementCallback mv_set_frame_seven[] = {an_fs_seven, an_stop};
const MovementCallback mv_set_frame_eight[] = {an_fs_eight, an_stop};
const MovementCallback mv_set_frame_nine[] = {an_fs_nine, an_stop};
const MovementCallback mv_set_frame_ten[] = {an_fs_ten, an_stop};
const MovementCallback mv_set_frame_eleven[] = {an_fs_eleven, an_stop};
const MovementCallback mv_set_frame_twelve[] = {an_fs_twelve, an_stop};
const MovementCallback mv_set_frame_thirteen[] = {an_fs_thirteen, an_stop};
const MovementCallback mv_set_frame_fourteen[] = {an_fs_fourteen, an_stop};
const MovementCallback mv_set_frame_fifteen[] = {an_fs_fifteen, an_stop};
const MovementCallback mv_set_frame_sixteen[] = {an_fs_sixteen, an_stop};
const MovementCallback mv_set_frame_seventeen[] = {an_fs_seventeen, an_stop};
const MovementCallback mv_set_frame_eighteen[] = {an_fs_eighteen, an_stop};
const MovementCallback mv_set_frame_nineteen[] = {an_fs_nineteen, an_stop};
const MovementCallback mv_set_frame_twenty[] = {an_fs_twenty, an_stop};

const MovementCallback *movement_animations[] = {
    (MovementCallback *)0x083A6864,
    (MovementCallback *)0x083A686C,
    (MovementCallback *)0x083A6874,
    (MovementCallback *)0x083A687C,
    (MovementCallback *)0x083A6A30,
    (MovementCallback *)0x083A6A38,
    (MovementCallback *)0x083A6A40,
    (MovementCallback *)0x083A6A48,
    (MovementCallback *)0x083A68C8,
    (MovementCallback *)0x083A68D4,
    (MovementCallback *)0x083A68E0,
    (MovementCallback *)0x083A68EC,
    (MovementCallback *)0x083A6904,
    (MovementCallback *)0x083A68F8,
    (MovementCallback *)0x083A6910,
    (MovementCallback *)0x083A691C,
    (MovementCallback *)0x083A6928,
    (MovementCallback *)0x083A6934,
    (MovementCallback *)0x083A6940,
    (MovementCallback *)0x083A694C,
    (MovementCallback *)0x083A6964,
    (MovementCallback *)0x083A6970,
    (MovementCallback *)0x083A697C,
    (MovementCallback *)0x083A6988,
    (MovementCallback *)0x083A6994,
    (MovementCallback *)0x083A69A0,
    (MovementCallback *)0x083A69AC,
    (MovementCallback *)0x083A69B8,
    (MovementCallback *)0x083A69C4,
    (MovementCallback *)0x083A69D0,
    (MovementCallback *)0x083A69DC,
    (MovementCallback *)0x083A69E8,
    (MovementCallback *)0x083A69F4,
    (MovementCallback *)0x083A6A50,
    (MovementCallback *)0x083A6A5C,
    (MovementCallback *)0x083A6A68,
    (MovementCallback *)0x083A6A74,
    (MovementCallback *)0x083A6A80,
    (MovementCallback *)0x083A6A8C,
    (MovementCallback *)0x083A6A98,
    (MovementCallback *)0x083A6AA4,
    (MovementCallback *)0x083A6AB0,
    (MovementCallback *)0x083A6ABC,
    (MovementCallback *)0x083A6AC8,
    (MovementCallback *)0x083A6AD4,
    (MovementCallback *)0x083A6AE0,
    (MovementCallback *)0x083A6AEC,
    (MovementCallback *)0x083A6AF8,
    (MovementCallback *)0x083A6B04,
    (MovementCallback *)0x083A6B10,
    (MovementCallback *)0x083A6B1C,
    (MovementCallback *)0x083A6B28,
    (MovementCallback *)0x083A6B34,
    (MovementCallback *)0x083A6B40,
    (MovementCallback *)0x083A6B4C,
    (MovementCallback *)0x083A6B58,
    (MovementCallback *)0x083A6B64,
    (MovementCallback *)0x083A6B70,
    (MovementCallback *)0x083A6B7C,
    (MovementCallback *)0x083A6B88,
    (MovementCallback *)0x083A6B94,
    (MovementCallback *)0x083A6BA0,
    (MovementCallback *)0x083A6BAC,
    (MovementCallback *)0x083A6BB8,
    (MovementCallback *)0x083A6BC4,
    (MovementCallback *)0x083A6BD0,
    (MovementCallback *)0x083A6BDC,
    (MovementCallback *)0x083A6BE8,
    (MovementCallback *)0x083A6BF4,
    (MovementCallback *)0x083A6C00,
    (MovementCallback *)0x083A6C0C,
    (MovementCallback *)0x083A6C18,
    (MovementCallback *)0x083A6C24,
    (MovementCallback *)0x083A6C30,
    (MovementCallback *)0x083A6C6C,
    (MovementCallback *)0x083A6C74,
    (MovementCallback *)0x083A6C7C,
    (MovementCallback *)0x083A6C84,
    (MovementCallback *)0x083A6C8C,
    (MovementCallback *)0x083A6C98,
    (MovementCallback *)0x083A6CA4,
    (MovementCallback *)0x083A6CB0,
    (MovementCallback *)0x083A6CBC,
    (MovementCallback *)0x083A6CC8,
    (MovementCallback *)0x083A6CD4,
    (MovementCallback *)0x083A6CE0,
    (MovementCallback *)0x083A6CEC,
    (MovementCallback *)0x083A6CF8,
    (MovementCallback *)0x083A6D04,
    (MovementCallback *)0x083A6D10,
    (MovementCallback *)0x083A6D1C,
    (MovementCallback *)0x083A6D24,
    (MovementCallback *)0x083A6D30,
    (MovementCallback *)0x083A6D38,
    (MovementCallback *)0x083A6D40,
    (MovementCallback *)0x083A6D48,
    (MovementCallback *)0x083A6D50,
    (MovementCallback *)0x083A6D58,
    (MovementCallback *)0x083A6D60,
    (MovementCallback *)0x083A6D68,
    (MovementCallback *)0x083A6D70,
    (MovementCallback *)0x083A6D78,
    (MovementCallback *)0x083A6D80,
    (MovementCallback *)0x083A6D88,
    (MovementCallback *)0x083A6D94,
    (MovementCallback *)0x083A6DA4,
    (MovementCallback *)0x083A6DB4,
    (MovementCallback *)0x083A6DBC,
    (MovementCallback *)0x083A6DC4,
    (MovementCallback *)0x083A6DCC,
    (MovementCallback *)0x083A6DD4,
    (MovementCallback *)0x083A6DE0,
    (MovementCallback *)0x083A6DEC,
    (MovementCallback *)0x083A6DF4,
    (MovementCallback *)0x083A6DFC,
    (MovementCallback *)0x083A6E04,
    (MovementCallback *)0x083A6E0C,
    (MovementCallback *)0x083A6E18,
    (MovementCallback *)0x083A6E24,
    (MovementCallback *)0x083A6E30,
    (MovementCallback *)0x083A6E3C,
    (MovementCallback *)0x083A6E48,
    (MovementCallback *)0x083A6E54,
    (MovementCallback *)0x083A6E60,
    (MovementCallback *)0x083A6E9C,
    (MovementCallback *)0x083A6EA8,
    (MovementCallback *)0x083A6EB4,
    (MovementCallback *)0x083A6EC0,
    (MovementCallback *)0x083A6ECC,
    (MovementCallback *)0x083A6ED8,
    (MovementCallback *)0x083A6EE4,
    (MovementCallback *)0x083A6EF0,
    (MovementCallback *)0x083A6EFC,
    (MovementCallback *)0x083A6F08,
    (MovementCallback *)0x083A6F14,
    (MovementCallback *)0x083A6F20,
    (MovementCallback *)0x083A6F2C,
    (MovementCallback *)0x083A6F38,
    (MovementCallback *)0x083A6F44,
    (MovementCallback *)0x083A6F50,
    (MovementCallback *)0x083A6F5C,
    (MovementCallback *)0x083A6F68,
    (MovementCallback *)0x083A6F74,
    (MovementCallback *)0x083A6F80,
    (MovementCallback *)0x083A6F8C,
    (MovementCallback *)0x083A6F98,
    (MovementCallback *)0x083A6FA4,
    (MovementCallback *)0x083A6FB0,
    (MovementCallback *)0x083A6FBC,
    (MovementCallback *)0x083A6FC8,
    (MovementCallback *)0x083A6FD4,
    (MovementCallback *)0x083A6FE0,
    (MovementCallback *)0x083A6FEC,
    (MovementCallback *)0x083A6FF4,
    (MovementCallback *)0x083A6FFC,
    (MovementCallback *)0x083A6898,
    (MovementCallback *)0x083A68A4,
    (MovementCallback *)0x083A68B0,
    (MovementCallback *)0x083A68BC,
    (MovementCallback *)0x083A7004,
    (MovementCallback *)0x083A6A00,
    (MovementCallback *)0x083A6A0C,
    (MovementCallback *)0x083A6A18,
    (MovementCallback *)0x083A6A24,
    (MovementCallback *)0x083A700C,
    (MovementCallback *)0x083A7018,
    (MovementCallback *)0x083A6C3C,
    (MovementCallback *)0x083A6C48,
    (MovementCallback *)0x083A6C54,
    (MovementCallback *)0x083A6C60,
    mv_set_frame_zero,
    mv_set_frame_one,
    mv_set_frame_two,
    mv_set_frame_three,
    mv_set_frame_four,
    mv_set_frame_five,
    mv_set_frame_six,
    mv_set_frame_seven,
    mv_set_frame_eight,
    mv_set_frame_nine,
    mv_set_frame_ten,
    mv_set_frame_eleven,
    mv_set_frame_twelve,
    mv_set_frame_thirteen,
    mv_set_frame_fourteen,
    mv_set_frame_fifteen,
    mv_set_frame_sixteen,
    mv_set_frame_seventeen,
    mv_set_frame_eighteen,
    mv_set_frame_nineteen,
    mv_set_frame_twenty,
};*/