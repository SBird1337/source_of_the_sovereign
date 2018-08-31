#include <pokeagb/pokeagb.h>

const struct OamData oam_effects_test_oam = {.size = 3, .shape = 0, .priority = 0};

void oac_oam_effects_reposition(struct Object *obj);

const struct Template oam_effect_test_template = {
    .tiles_tag = 0x4567,
    .pal_tag = 0x4567,
    .oam = &oam_effects_test_oam,
    .animation = SPRITE_NO_ANIMATION,
    .graphics = &pokemon_graphics_front[3],
    .rotscale = SPRITE_NO_ROTSCALE,
    .callback = oac_oam_effects_reposition
};

void oac_oam_effects_reposition(struct Object *obj) {
    (void)obj;
}

void oam_effect_spawn(void) {
    gpu_tile_obj_decompress_alloc_tag_and_upload(&pokemon_graphics_front[3]);
    gpu_pal_decompress_alloc_tag_and_upload(&pokemon_palette_shiny[3]);
    u8 object = template_instanciate_forward_search(&oam_effect_test_template, 100,100,0);
    (void) object;
}