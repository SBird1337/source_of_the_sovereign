#include <pokeagb/pokeagb.h>
#include <agb_debug.h>

#define BLOCK_STATE_SIDEWAY_NW 0x80
#define BLOCK_STATE_SIDEWAY_NE 0x81
#define BLOCK_STATE_SIDEWAY_SW 0x82
#define BLOCK_STATE_SIDEWAY_SE 0x83
#define BEHAVIOR_STAIR_WEST 0xE0
#define BEHAVIOR_STAIR_EAST 0xE1

const u8 diagonal_animations[4] = {170,171,172,173};

bool npc_sideway_try_walking(u8 block_state)
{
    if(block_state >= BLOCK_STATE_SIDEWAY_NW) {
        npc_player_set_movement_and_x22(diagonal_animations[block_state - BLOCK_STATE_SIDEWAY_NW], 2);
        // Kinda have to do the thing when the player runs (ish)
        return true;
    }
    return false;
}

u8 npc_get_walkable_status(struct NpcState *npc, u16 x, u16 y, enum Direction direction, u8 roleTo) {
    dprintf("get_walkable: %d, %d, %d, %d\n", x,y, direction, roleTo);
    u8 block = npc_block_way(npc, x,y,direction);

    //check for diagonal stair stuff here
    struct NpcState dummyNpc;
    memcpy(&dummyNpc, npc, sizeof(struct NpcState));

    u16 roleFrom = cur_mapdata_block_role_at(npc->from.x, npc->from.y);
    if (direction == WEST) {
        dprintf("WEST with from: %d\n", roleFrom);
        if(roleFrom == BEHAVIOR_STAIR_WEST) {
            
            //walk up the stair to the west
            dummyNpc.from.y--;
            dummyNpc.to.y--;
            u8 altBlocked = npc_block_way(&dummyNpc, x,y-1, direction);
            dprintf("trying NW: %d\n", altBlocked);
            u8 roleStairTo = cur_mapdata_block_role_at(x, y-1);
            if(roleStairTo == BEHAVIOR_STAIR_WEST)
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NW : altBlocked;
        }
        else if(roleFrom == BEHAVIOR_STAIR_EAST){
            //walk down the stair to the west
            dummyNpc.from.y++;
            dummyNpc.to.y++;
            u8 altBlocked = npc_block_way(&dummyNpc, x,y+1, direction);
            dprintf("trying SW: %d\n", altBlocked);
            u8 roleStairTo = cur_mapdata_block_role_at(x, y+1);
            if(roleStairTo == BEHAVIOR_STAIR_EAST)
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SW : altBlocked;
        }
    } else if(direction == EAST) {
        if(roleFrom == BEHAVIOR_STAIR_EAST) {
            //walk up the stair to the east
            dummyNpc.from.y--;
            dummyNpc.to.y--;
            u8 altBlocked = npc_block_way(&dummyNpc, x,y-1, direction);
            dprintf("trying NE: %d\n", altBlocked);
            u8 roleStairTo = cur_mapdata_block_role_at(x, y-1);
            dprintf("x: %d, y: %d, roleStairTo: %d\n",x, dummyNpc.to.y, roleStairTo);
            if(roleStairTo == BEHAVIOR_STAIR_EAST)
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_NE : altBlocked;

        } else if (roleFrom == BEHAVIOR_STAIR_WEST) {
            //walk down the stair to the east
            dummyNpc.from.y++;
            dummyNpc.to.y++;
            u8 altBlocked = npc_block_way(&dummyNpc, x,y+1, direction);
            dprintf("trying SW: %d\n", altBlocked);
            u8 roleStairTo = cur_mapdata_block_role_at(x, y+1);
            if(roleStairTo == BEHAVIOR_STAIR_WEST)
                return (altBlocked == 0) ? BLOCK_STATE_SIDEWAY_SE : altBlocked;
        }
    }

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