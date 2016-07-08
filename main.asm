.gba
.thumb
.open "base/bpre0.gba","build/Pokémon SotS.gba",0x08000000

.include "patches/split_physical_special.asm"
.include "patches/hooks.asm"
.include "patches/dynamic_overworld_hooks.asm"
.include "patches/special.asm"
.include "patches/moves.asm"
.include "patches/music.asm"
.include "patches/items/items.asm"

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


.org 0x09000000
.importobj "object/linked.o"
.close
