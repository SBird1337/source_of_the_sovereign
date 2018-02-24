#ifndef PDEX_C_H_
#define PDEX_C_H_

#include <pokeagb/pokeagb.h>

#define PDEX_ALOLA_COUNT (18)
#define PDEX_LAST_ENTRY (813 + PDEX_ALOLA_COUNT)
#define PDEX_LAST_SHOWN (813)

#define CPUFSCPY 0
#define CPUFSSET 1
#define CPUModeFS(size, mode) ((size >> 2) | (mode << 24))
#define MAX3_COUNT_DIGITS(n) (n >= 100 ? 3 : (n >= 10 ? 2 : 1))

#define OBJID_HIDE(objid) objects[objid].final_oam.affine_mode = 2
#define OBJID_SHOW(objid) objects[objid].final_oam.affine_mode = 0

#define PDEX_FADEIN_SPD 1

#define FONT_DEX_STD 1

#define TB_STD_LEN 10
#define TB_STD_LEN_PX (TB_STD_LEN * 8)
#define TB_BOT_LEN 9
#define TB_BOT_LEN_PX (TB_BOT_LEN * 8)

#define TB_STD_CENTER(t,w) (((w - t) >> 1) + 2)
#define TB_STD_RIGHT(t,w) ((w - t))

#define DEX_PKMN_TAG_ONE 0x1300
#define DEX_PKMN_TAG_TWO 0x1310
#define DEX_PKMN_TAG_THREE 0x1311
#define DEX_BALL_TAG 0x1301
#define DEX_CURSOR_TAG 0x1302
#define DEX_ARROW_TAG 0x1303
#define DEX_ARROW_TAG_EPAL 0x1304
#define DEX_SCROLL_TAG 0x1305
#define DEX_REGION_SELECT 0x1306
#define DEX_DETAIL_TYPE1 0x130E
#define DEX_DETAIL_TYPE2 0x130F
#define DEX_DETAIL_TYPEPAL 0x130E

#define DEX_REGION_PAL(i) (0x1307 + i)
#define DEX_REGION_ICON(i) (0x1307 + i)
#define MAX_FORMS 7
#define FORM_COUNT 20

struct DexForm
{
    u16 index;
    struct DexFormEntry forms[MAX_FORMS];
};

void pdex_cb_handler(void);
void pdex_vblank_handler(void);
void pdex_vram_setup(void);
void pdex_vram_free_bgmaps(void);
void pdex_free_memory(void);
void pdex_alloc_memory(void);
struct PdexLookup *pdex_lazy_lookup_entry(u16 dexIndex);
void pdex_load(void);

const u16 pdex_text_pal[16];
const struct BgConfig pdex_bg_config[4];
struct TextColor pdex_text_color;
const struct OamData pdex_oam_pkmn;
struct DexForm pdex_forms[FORM_COUNT];

u8 pstr_lines(pchar* str);

#endif