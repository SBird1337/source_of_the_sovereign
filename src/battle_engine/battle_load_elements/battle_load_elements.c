#include <config.h>
#include <pokeagb/pokeagb.h>
#include <battlescreen/battlescreen_0.h>
#include <battlescreen/battlescreen_1.h>
#include <battlescreen/battlescreen_2.h>
#include <battlescreen/battlescreen_3.h>
#include <battlescreen/battlescreen_4.h>
#include <battlescreen/battlescreen_5.h>
#include <battlescreen/battlescreen_6.h>
#include <battlescreen/battlescreen_7.h>
#include <battlescreen/battlescreen_8.h>
#include <battlescreen/battlescreen_9.h>
#include <battlescreen/battlescreen_10.h>
#include <battlescreen/battlescreen_11.h>
#include <battlescreen/battlescreen_12.h>
#include <battlescreen/battlescreen_13.h>
#include <battlescreen/battlescreen_14.h>
#include <battlescreen/battlescreen_15.h>
#include <battlescreen/battlescreen_16.h>
#include <battlescreen/battlescreen_17.h>
#include <battlescreen/battlescreen_18.h>
#include <battlescreen/battlescreen_19.h>
#include <battlescreen/battlescreen_20.h>
#include <battlescreen/battlescreen_21.h>
#include <battlescreen/battlescreen_22.h>
#include <battlescreen/battlescreen_23.h>
#include <battlescreen/battlescreen_24.h>


#define SIZEOF_ARR(a) (sizeof(a) / sizeof(a[0]))
#define BATTLE_ELEMENT(n)                                                                                              \
    (n > SIZEOF_ARR(battle_screen_elements) ? battle_screen_elements[0] : battle_screen_elements[n])
#define BATTLE_ELEMENT_VAR (walkrun_state.is_surfing ? BATTLE_SEA_VAR : BATTLE_NORMAL_VAR)

struct BattleScreenElements {
    const void *gfx_bg;
    const void *map_bg;
    const void *gfx_grass;
    const void *map_grass;
    const void *palette;
};

const struct BattleScreenElements battle_screen_elements[] = {
    {battlescreen_0Tiles, battlescreen_0Map, NULL, NULL, battlescreen_0Pal},
    {battlescreen_1Tiles, battlescreen_1Map, NULL, NULL, battlescreen_1Pal},
    {battlescreen_2Tiles, battlescreen_2Map, NULL, NULL, battlescreen_2Pal},
    {battlescreen_3Tiles, battlescreen_3Map, NULL, NULL, battlescreen_3Pal},
    {battlescreen_4Tiles, battlescreen_4Map, NULL, NULL, battlescreen_4Pal},
    {battlescreen_5Tiles, battlescreen_5Map, NULL, NULL, battlescreen_5Pal},
    {battlescreen_6Tiles, battlescreen_6Map, NULL, NULL, battlescreen_6Pal},
    {battlescreen_7Tiles, battlescreen_7Map, NULL, NULL, battlescreen_7Pal},
    {battlescreen_8Tiles, battlescreen_8Map, NULL, NULL, battlescreen_8Pal},
    {battlescreen_9Tiles, battlescreen_9Map, NULL, NULL, battlescreen_9Pal},
    {battlescreen_10Tiles, battlescreen_10Map, NULL, NULL, battlescreen_10Pal},
    {battlescreen_11Tiles, battlescreen_11Map, NULL, NULL, battlescreen_11Pal},
    {battlescreen_12Tiles, battlescreen_12Map, NULL, NULL, battlescreen_12Pal},
    {battlescreen_13Tiles, battlescreen_13Map, NULL, NULL, battlescreen_13Pal},
    {battlescreen_14Tiles, battlescreen_14Map, NULL, NULL, battlescreen_14Pal},
    {battlescreen_15Tiles, battlescreen_15Map, NULL, NULL, battlescreen_15Pal},
    {battlescreen_16Tiles, battlescreen_16Map, NULL, NULL, battlescreen_16Pal},
    {battlescreen_17Tiles, battlescreen_17Map, NULL, NULL, battlescreen_17Pal},
    {battlescreen_18Tiles, battlescreen_18Map, NULL, NULL, battlescreen_18Pal},
    {battlescreen_19Tiles, battlescreen_19Map, NULL, NULL, battlescreen_19Pal},
    {battlescreen_20Tiles, battlescreen_20Map, NULL, NULL, battlescreen_20Pal},
    {battlescreen_21Tiles, battlescreen_21Map, NULL, NULL, battlescreen_21Pal},
    {battlescreen_22Tiles, battlescreen_22Map, NULL, NULL, battlescreen_22Pal},
    {battlescreen_23Tiles, battlescreen_23Map, NULL, NULL, battlescreen_23Pal},
    {battlescreen_24Tiles, battlescreen_24Map, NULL, NULL, battlescreen_24Pal},
};

void battle_load_background(u16 idx) {
    (void)idx;

    struct BattleScreenElements element = BATTLE_ELEMENT(var_load(BATTLE_ELEMENT_VAR));
    lz77UnCompVram(element.gfx_bg, (void *)0x06008000);
    lz77UnCompVram(element.map_bg, (void *)0x0600D000);
    gpu_pal_apply_compressed(element.palette, 32, 96);
}

void battle_load_decals(u16 idx) {
    (void)idx;

    struct BattleScreenElements element = BATTLE_ELEMENT(var_load(BATTLE_ELEMENT_VAR));
    if (element.gfx_grass == NULL | element.map_grass == NULL)
        return;
    lz77UnCompVram(element.gfx_grass, (void *)0x06004000);
    lz77UnCompVram(element.map_grass, (void *)0x0600E000);
}