.gba
.thumb
.open "base/bpre0.gba","build/pkmn_sots.gba",0x08000000
//exclude for now
//.include "patches/split_physical_special.asm"
.include "patches/hooks.asm"

.include "patches/maps.asm"

.include "patches/dynamic_overworld_hooks.asm"


.include "patches/special.asm"
.include "patches/moves.asm"
.include "patches/music.asm"
.include "patches/items/items.asm"

.include "patches/graphics/title.asm"
.include "patches/graphics/boot.asm"
.include "patches/graphics/char.asm"

.include "patches/move_table.asm"

.include "patches/pokemon_data/pokemon_footprints.asm"
.include "patches/pokemon_data/altitude_table.asm"
.include "patches/pokemon_data/enemy_y_table.asm"
.include "patches/pokemon_data/player_y_table.asm"
.include "patches/pokemon_data/pokedex_order.asm"
.include "patches/pokemon_data/pokedex.asm"
.include "patches/pokemon_data/pokemon_egg_moves.asm"
.include "patches/pokemon_data/pokedex_entries.asm"
.include "patches/pokemon_data/pokemon_names.asm"
.include "patches/pokemon_data/limits.asm"

.include "patches/pokemon_data/pokemon_stats.asm"
.include "patches/pokemon_data/moveset_table.asm"
.include "patches/pokemon_data/pokemon_back_sprites.asm"
.include "patches/pokemon_data/pokemon_front_sprites.asm"
.include "patches/pokemon_data/pokemon_normal_pal.asm"
.include "patches/pokemon_data/pokemon_shiny_pal.asm"

.include "patches/pokemon_data/pokemon_icons.asm"

.include "patches/pokemon_data/pokemon_habitats.asm"
.include "patches/pokemon_data/pokemon_evolution.asm"

.include "patches/overworlds/pkm_wild.asm"
.include "patches/overworlds/trainer.asm"
.include "patches/overworlds/npc_walk.asm"

.include "patches/dns/core.asm"

.include "patches/overworlds/overworld.asm"

.include "patches/trainer_sprites/images.asm"
.include "patches/trainer_sprites/trainer_data.asm"

.include "patches/interface.asm"

.include "patches/battle_engine/malloc.asm"
.include "patches/battle_engine/battle_engine.asm"

.include "patches/text_system.asm"

.include "patches/game_engine/quick_hacks.asm"
.include "patches/game_engine/localization.asm"
.include "patches/game_engine/start_menu.asm"
.include "patches/game_engine/script_replace.asm"
.include "patches/game_engine/intro.asm"

//.include "battle_engine/patches/battle_hooks.s"

.org 0x09000000
.importobj "object/linked.o"
.close
