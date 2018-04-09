#include <pokeagb/pokeagb.h>

typedef bool (*MoveCallback)(struct NpcState* npc, struct Object* obj);

void npc_walk_modify_diagonal(struct NpcState* npc, struct Object* obj, u8 direction) {
    npc->to.x = walking_directions[direction].x + npc->from.x;
    npc->to.y = walking_directions[direction].y + npc->from.y;
    obj->priv[3] = direction;
}

bool npc_walk_mdia_ul(struct NpcState* npc, struct Object* obj) {
    npc_run_any(npc, obj, 3, 0);
    npc_walk_modify_diagonal(npc,obj,7);
    return npc_run_is_finished(npc,obj);
}

bool npc_walk_mdia_ur(struct NpcState* npc, struct Object* obj) {
    npc_run_any(npc, obj, 4, 0);
    npc_walk_modify_diagonal(npc,obj,8);
    return npc_run_is_finished(npc,obj);
}

bool npc_walk_mdia_dl(struct NpcState* npc, struct Object* obj) {
    npc_run_any(npc, obj, 3, 0);
    npc_update_direction(npc, 3);
    npc_walk_modify_diagonal(npc,obj,5);
    return npc_run_is_finished(npc,obj);
}

bool npc_walk_mdia_dr(struct NpcState* npc, struct Object* obj) {
    npc_run_any(npc, obj, 4, 0);
    npc_walk_modify_diagonal(npc,obj,6);
    return npc_run_is_finished(npc,obj);
}

MoveCallback npc_walk_anim_mdia_ul[3] = {npc_walk_mdia_ul, npc_run_is_finished, npc_move_end};
MoveCallback npc_walk_anim_mdia_ur[3] = {npc_walk_mdia_ur, npc_run_is_finished, npc_move_end};
MoveCallback npc_walk_anim_mdia_dl[3] = {npc_walk_mdia_dl, npc_run_is_finished, npc_move_end};
MoveCallback npc_walk_anim_mdia_dr[3] = {npc_walk_mdia_dr, npc_run_is_finished, npc_move_end};

/* first new is 170 */
const MoveCallback* npc_walk_animations[174] =
{
    (MoveCallback*)0x83a6864u, (MoveCallback*)0x83a686cu, (MoveCallback*)0x83a6874u, (MoveCallback*)0x83a687cu, 
    (MoveCallback*)0x83a6a30u, (MoveCallback*)0x83a6a38u, (MoveCallback*)0x83a6a40u, (MoveCallback*)0x83a6a48u, 
    (MoveCallback*)0x83a68c8u, (MoveCallback*)0x83a68d4u, (MoveCallback*)0x83a68e0u, (MoveCallback*)0x83a68ecu, 
    (MoveCallback*)0x83a6904u, (MoveCallback*)0x83a68f8u, (MoveCallback*)0x83a6910u, (MoveCallback*)0x83a691cu, 
    (MoveCallback*)0x83a6928u, (MoveCallback*)0x83a6934u, (MoveCallback*)0x83a6940u, (MoveCallback*)0x83a694cu, 
    (MoveCallback*)0x83a6964u, (MoveCallback*)0x83a6970u, (MoveCallback*)0x83a697cu, (MoveCallback*)0x83a6988u, 
    (MoveCallback*)0x83a6994u, (MoveCallback*)0x83a69a0u, (MoveCallback*)0x83a69acu, (MoveCallback*)0x83a69b8u, 
    (MoveCallback*)0x83a69c4u, (MoveCallback*)0x83a69d0u, (MoveCallback*)0x83a69dcu, (MoveCallback*)0x83a69e8u, 
    (MoveCallback*)0x83a69f4u, (MoveCallback*)0x83a6a50u, (MoveCallback*)0x83a6a5cu, (MoveCallback*)0x83a6a68u, 
    (MoveCallback*)0x83a6a74u, (MoveCallback*)0x83a6a80u, (MoveCallback*)0x83a6a8cu, (MoveCallback*)0x83a6a98u, 
    (MoveCallback*)0x83a6aa4u, (MoveCallback*)0x83a6ab0u, (MoveCallback*)0x83a6abcu, (MoveCallback*)0x83a6ac8u, 
    (MoveCallback*)0x83a6ad4u, (MoveCallback*)0x83a6ae0u, (MoveCallback*)0x83a6aecu, (MoveCallback*)0x83a6af8u, 
    (MoveCallback*)0x83a6b04u, (MoveCallback*)0x83a6b10u, (MoveCallback*)0x83a6b1cu, (MoveCallback*)0x83a6b28u, 
    (MoveCallback*)0x83a6b34u, (MoveCallback*)0x83a6b40u, (MoveCallback*)0x83a6b4cu, (MoveCallback*)0x83a6b58u, 
    (MoveCallback*)0x83a6b64u, (MoveCallback*)0x83a6b70u, (MoveCallback*)0x83a6b7cu, (MoveCallback*)0x83a6b88u, 
    (MoveCallback*)0x83a6b94u, (MoveCallback*)0x83a6ba0u, (MoveCallback*)0x83a6bacu, (MoveCallback*)0x83a6bb8u, 
    (MoveCallback*)0x83a6bc4u, (MoveCallback*)0x83a6bd0u, (MoveCallback*)0x83a6bdcu, (MoveCallback*)0x83a6be8u, 
    (MoveCallback*)0x83a6bf4u, (MoveCallback*)0x83a6c00u, (MoveCallback*)0x83a6c0cu, (MoveCallback*)0x83a6c18u, 
    (MoveCallback*)0x83a6c24u, (MoveCallback*)0x83a6c30u, (MoveCallback*)0x83a6c6cu, (MoveCallback*)0x83a6c74u, 
    (MoveCallback*)0x83a6c7cu, (MoveCallback*)0x83a6c84u, (MoveCallback*)0x83a6c8cu, (MoveCallback*)0x83a6c98u, 
    (MoveCallback*)0x83a6ca4u, (MoveCallback*)0x83a6cb0u, (MoveCallback*)0x83a6cbcu, (MoveCallback*)0x83a6cc8u, 
    (MoveCallback*)0x83a6cd4u, (MoveCallback*)0x83a6ce0u, (MoveCallback*)0x83a6cecu, (MoveCallback*)0x83a6cf8u, 
    (MoveCallback*)0x83a6d04u, (MoveCallback*)0x83a6d10u, (MoveCallback*)0x83a6d1cu, (MoveCallback*)0x83a6d24u, 
    (MoveCallback*)0x83a6d30u, (MoveCallback*)0x83a6d38u, (MoveCallback*)0x83a6d40u, (MoveCallback*)0x83a6d48u, 
    (MoveCallback*)0x83a6d50u, (MoveCallback*)0x83a6d58u, (MoveCallback*)0x83a6d60u, (MoveCallback*)0x83a6d68u, 
    (MoveCallback*)0x83a6d70u, (MoveCallback*)0x83a6d78u, (MoveCallback*)0x83a6d80u, (MoveCallback*)0x83a6d88u, 
    (MoveCallback*)0x83a6d94u, (MoveCallback*)0x83a6da4u, (MoveCallback*)0x83a6db4u, (MoveCallback*)0x83a6dbcu, 
    (MoveCallback*)0x83a6dc4u, (MoveCallback*)0x83a6dccu, (MoveCallback*)0x83a6dd4u, (MoveCallback*)0x83a6de0u, 
    (MoveCallback*)0x83a6decu, (MoveCallback*)0x83a6df4u, (MoveCallback*)0x83a6dfcu, (MoveCallback*)0x83a6e04u, 
    (MoveCallback*)0x83a6e0cu, (MoveCallback*)0x83a6e18u, (MoveCallback*)0x83a6e24u, (MoveCallback*)0x83a6e30u, 
    (MoveCallback*)0x83a6e3cu, (MoveCallback*)0x83a6e48u, (MoveCallback*)0x83a6e54u, (MoveCallback*)0x83a6e60u, 
    (MoveCallback*)0x83a6e9cu, (MoveCallback*)0x83a6ea8u, (MoveCallback*)0x83a6eb4u, (MoveCallback*)0x83a6ec0u, 
    (MoveCallback*)0x83a6eccu, (MoveCallback*)0x83a6ed8u, (MoveCallback*)0x83a6ee4u, (MoveCallback*)0x83a6ef0u, 
    (MoveCallback*)0x83a6efcu, (MoveCallback*)0x83a6f08u, (MoveCallback*)0x83a6f14u, (MoveCallback*)0x83a6f20u, 
    (MoveCallback*)0x83a6f2cu, (MoveCallback*)0x83a6f38u, (MoveCallback*)0x83a6f44u, (MoveCallback*)0x83a6f50u, 
    (MoveCallback*)0x83a6f5cu, (MoveCallback*)0x83a6f68u, (MoveCallback*)0x83a6f74u, (MoveCallback*)0x83a6f80u, 
    (MoveCallback*)0x83a6f8cu, (MoveCallback*)0x83a6f98u, (MoveCallback*)0x83a6fa4u, (MoveCallback*)0x83a6fb0u, 
    (MoveCallback*)0x83a6fbcu, (MoveCallback*)0x83a6fc8u, (MoveCallback*)0x83a6fd4u, (MoveCallback*)0x83a6fe0u, 
    (MoveCallback*)0x83a6fecu, (MoveCallback*)0x83a6ff4u, (MoveCallback*)0x83a6ffcu, (MoveCallback*)0x83a6898u, 
    (MoveCallback*)0x83a68a4u, (MoveCallback*)0x83a68b0u, (MoveCallback*)0x83a68bcu, (MoveCallback*)0x83a7004u, 
    (MoveCallback*)0x83a6a00u, (MoveCallback*)0x83a6a0cu, (MoveCallback*)0x83a6a18u, (MoveCallback*)0x83a6a24u, 
    (MoveCallback*)0x83a700cu, (MoveCallback*)0x83a7018u, (MoveCallback*)0x83a6c3cu, (MoveCallback*)0x83a6c48u, 
    (MoveCallback*)0x83a6c54u, (MoveCallback*)0x83A6C60u, npc_walk_anim_mdia_ul, npc_walk_anim_mdia_ur,
    npc_walk_anim_mdia_dl, npc_walk_anim_mdia_dr
};