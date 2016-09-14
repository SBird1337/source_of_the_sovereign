#include <bpre.h>

#define OW_REPLACE_VAR  0x500A
#define OW_REPLACE_TO_VAR   0x500B

struct coords16{
    u16 x;
    u16 y;
};

struct npc_type {
    u16 tiles_tag;
    u16 pal_num;
    u16 pal_tag_2;
    u16 field_6;
    struct coords16 pos_neg_center;
    u8 pal_slot_unk;
    u8 field_D;
    u16 pal_table;
    u32 oam;
    u32 field_14;
    u32 image_anims;
    u32 gfx_table;
    u32 rot_scale_anims;
};

struct npc_type** npc_tables[] = {(struct npc_type**)0x0839FDB0, (struct npc_type**)0x09E00000};

struct npc_type* npc_get_type(u16 npc_id)
{
    u16* replace_ow = var_access(OW_REPLACE_VAR);
    if(*replace_ow > 0 && *replace_ow - 1 == npc_id)
    {
        npc_id = *var_access(OW_REPLACE_TO_VAR);
    }
    u8 table = (npc_id >> 8);
    return (npc_tables[table][npc_id & 0xFF]);
}
