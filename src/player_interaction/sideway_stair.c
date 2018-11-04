#include <pokeagb/pokeagb.h>
#include <agb_debug.h>

#define BLOCK_STATE_SIDEWAY_NW 0x80
#define BLOCK_STATE_SIDEWAY_NE 0x81
#define BLOCK_STATE_SIDEWAY_SW 0x82
#define BLOCK_STATE_SIDEWAY_SE 0x83

#define BLOCK_STATE_SIDEWAY_NW_ENTER 0x84
#define BLOCK_STATE_SIDEWAY_NE_ENTER 0x85
#define BLOCK_STATE_SIDEWAY_SW_ENTER 0x86
#define BLOCK_STATE_SIDEWAY_SE_ENTER 0x87

#define BLOCK_STATE_SIDEWAY_NW_LEAVE 0x88
#define BLOCK_STATE_SIDEWAY_NE_LEAVE 0x89
#define BLOCK_STATE_SIDEWAY_SW_LEAVE 0x8A
#define BLOCK_STATE_SIDEWAY_SE_LEAVE 0x8B

#define BEHAVIOR_STAIR_WEST 0xE0
#define BEHAVIOR_STAIR_EAST 0xE1

const u8 diagonal_animations[12] = {
    170,171,172,173,
    174,175,176,177,
    178,179,180,181,
};

bool npc_sideway_try_walking(u8 block_state)
{
    if(block_state >= BLOCK_STATE_SIDEWAY_NW) {
        npc_player_set_movement_and_x22(diagonal_animations[block_state - BLOCK_STATE_SIDEWAY_NW], 2);
        // Kinda have to do the thing when the player runs (ish)
        return true;
    }
    return false;
}

static void invalid_stair_layout(void) {
    dprintf("invalid stair layout! please fix map data!\n");
    while (1);
}

u8 npc_get_walkable_status(struct NpcState *npc, u16 x, u16 y, enum Direction direction, u8 roleTo) {
    dprintf("get_walkable: %d, %d, %d, %d\n", x,y, direction, roleTo);

    //check for diagonal stair stuff here
    struct NpcState dummyNpc = *npc;

    int fx = npc->from.x, fy = npc->from.y;

    int roleFrom = cur_mapdata_block_role_at(fx, fy);

    if (direction == WEST) {
        if (roleFrom == BEHAVIOR_STAIR_WEST) {
            int roleTo = cur_mapdata_block_role_at(fx - 1, fy);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                dprintf("walk north west / up left\n");
                dummyNpc.from.y--;
                dummyNpc.to.y--;
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy - 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NW : altBlocked;
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                invalid_stair_layout();
            } else {
                dprintf("leave north west / up left\n");
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NW_LEAVE : altBlocked;
            }
        } else if (roleFrom == BEHAVIOR_STAIR_EAST) {
            int roleTo = cur_mapdata_block_role_at(fx - 1, fy + 1);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                invalid_stair_layout();
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                dprintf("walk south west / down left\n");
                dummyNpc.from.y++;
                dummyNpc.to.y++;
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy + 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SW : altBlocked;
            } else {
                dprintf("leave south west / down left\n");
                dummyNpc.from.y++;
                dummyNpc.to.y++;
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy + 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SW_LEAVE : altBlocked;
            }
        } else {
            int roleTo = cur_mapdata_block_role_at(fx - 1, fy);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                dprintf("enter north west / up left\n");
                dummyNpc.from.y--;
                dummyNpc.to.y--;
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy - 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NW_ENTER : altBlocked;
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                dprintf("enter south west / down left\n");
                int altBlocked = npc_block_way(&dummyNpc, fx - 1, fy, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SW_ENTER : altBlocked;
            }
        }
    } else if (direction == EAST) {
        if (roleFrom == BEHAVIOR_STAIR_WEST) {
            int roleTo = cur_mapdata_block_role_at(fx + 1, fy + 1);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                dprintf("walk south east / down right\n");
                dummyNpc.from.y++;
                dummyNpc.to.y++;
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy + 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SE : altBlocked;
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                invalid_stair_layout();
            } else {
                dprintf("leave south east / down right\n");
                dummyNpc.from.y++;
                dummyNpc.to.y++;
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy + 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SE_LEAVE : altBlocked;
            }
        } else if (roleFrom == BEHAVIOR_STAIR_EAST) {
            int roleTo = cur_mapdata_block_role_at(fx + 1, fy);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                invalid_stair_layout();
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                dprintf("walk north east / up right\n");
                dummyNpc.from.y--;
                dummyNpc.to.y--;
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy - 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NE : altBlocked;
            } else {
                dprintf("leave north east / up right\n");
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NE_LEAVE : altBlocked;
            }
        } else {
            int roleTo = cur_mapdata_block_role_at(fx + 1, fy);
            if (roleTo == BEHAVIOR_STAIR_WEST) {
                dprintf("enter south east / down right\n");
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SE_ENTER : altBlocked;
            } else if (roleTo == BEHAVIOR_STAIR_EAST) {
                dprintf("enter north east / up right\n");
                dummyNpc.from.y--;
                dummyNpc.to.y--;
                int altBlocked = npc_block_way(&dummyNpc, fx + 1, fy - 1, direction);
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NE_ENTER : altBlocked;
            }
        }
    }

    u8 block = npc_block_way(npc, x,y,direction);

    //continue with game code

    if(block == 3 && npc_is_passable_maybe(x,y,direction))
        return 5;
    if(npc_handle_jump(x,y,direction)) {
        sav1_secure_increment(0x2B);
        return 6;
    }
    else if(block == 4 && npc_handle_strength(x,y,direction)) {
        return 7;
    }
    return block;
}
