#ifndef SCENE_H_
#define SCENE_H_

#include <pokeagb/pokeagb.h>



void scene_vram_init(SuperCallback vblank_handler, const struct BgConfig* config);
const struct BgConfig scene_default_config[4];
void scene_default_cb_handler(void);
const struct TextColor scene_default_text_color;
void scene_free_bg_maps(void);
void scene_default_vblank(void);

void scene_vram_default_init(void);

#endif