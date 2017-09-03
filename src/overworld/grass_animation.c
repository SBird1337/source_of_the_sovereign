#include <pokeagb/pokeagb.h>

void grass_step_general(struct NpcState *npc)
{
    oe_state.effect_pos.x = npc->to.x;
    oe_state.effect_pos.y = npc->to.y;
    oe_state.priority = (npc->height) >> 4;
    oe_state.field_c = 2;
    oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_map_number);
    oe_state.local_mapbank = npc->local_map_bank;
    oe_state.sav1_location = (((saveblock1->location.map) << 8) | saveblock1->location.bank);
    oe_state.field_1c = 1;
    (void)oe_exec(4);
}

void grass_step_elastic(struct NpcState *npc)
{
    oe_state.effect_pos.x = npc->to.x;
    oe_state.effect_pos.y = npc->to.y;
    oe_state.priority = (npc->height) >> 4;
    oe_state.field_c = 2;
    oe_state.local_id_and_mapnumber = (npc->local_id << 8) | (npc->local_map_number);
    oe_state.local_mapbank = npc->local_map_bank;
    oe_state.sav1_location = (((saveblock1->location.map) << 8) | saveblock1->location.bank);
    oe_state.field_1c = 0;

    /* use variable to determine the oe animation to play */
    (void)oe_exec(4);
}

