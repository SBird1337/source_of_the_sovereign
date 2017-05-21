#include <oe_animation.h>
#include <npc.h>
#include <save_one.h>
#include <agb_debug.h>

extern u16 current_map_block_role_get(u16 x, u16 y);
void sp_check_tileset(void);

void grass_step_general(struct npc_state *npc)
{
    current_oe_state.to_x___local_id = npc->to.x;
    current_oe_state.to_y___local_mapnumber = npc->to.y;
    current_oe_state.height_lsr_4___local_mapbank = (npc->height) >> 4;
    current_oe_state.field_C = 2;
    current_oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_mapnumber);
    current_oe_state.local_mapbank = npc->local_mapbank;
    current_oe_state.sav1_location = (((sav_one->location.map) << 8) | sav_one->location.bank);
    current_oe_state.field_1C = 1;
    (void)oe_exec(4);
}

void grass_step_elastic(struct npc_state *npc)
{
    current_oe_state.to_x___local_id = npc->to.x;
    current_oe_state.to_y___local_mapnumber = npc->to.y;
    current_oe_state.height_lsr_4___local_mapbank = (npc->height) >> 4;
    current_oe_state.field_C = 2;
    current_oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_mapnumber);
    current_oe_state.local_mapbank = npc->local_mapbank;
    current_oe_state.sav1_location = (((sav_one->location.map) << 8) | sav_one->location.bank);
    current_oe_state.field_1C = 1;

    /* use variable to determine the oe animation to play */
    sp_check_tileset();
    (void)oe_exec(4);
}