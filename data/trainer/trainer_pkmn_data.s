#include <constants/trainer.h>

.align 2
.text
.thumb
.global trainer_data
trainer_data:

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.string LAN_DE "",  12
.string LAN_EN "",  12
.hword 0x0
.hword 0x0
.hword 0x0
.hword 0x0
.byte 0x0
.byte 0x0, 0x0, 0x0
.hword 0x0, 0x0
.byte 0x0
.byte 0x0, 0x0, 0x0
.word 0x00000000 @@this is actually important, because otherwise the structure offset will be off

.byte MOVE_NEIN_ITEM_NEIN
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_NOAH
.string LAN_DE "Noah", 12
.string LAN_EN "Noah", 12
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 0, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_1

.byte MOVE_NEIN_ITEM_NEIN
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_NOAH
.string LAN_DE "Noah", 12
.string LAN_EN "Noah", 12
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 6, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_2

.byte MOVE_NEIN_ITEM_JA
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_NOAH
.string LAN_DE "Noah", 12
.string LAN_EN "Noah", 12
.hword ITEM_TRANK
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 14, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_3

.byte MOVE_NEIN_ITEM_NEIN
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_EMMA
.string LAN_DE "Emma", 12
.string LAN_EN "Emma", 12
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 0, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_4

.byte MOVE_NEIN_ITEM_NEIN
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_EMMA
.string LAN_DE "Emma", 12
.string LAN_EN "Emma", 12
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 6, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_5

.byte MOVE_NEIN_ITEM_JA
.byte TRAINERCLASS_PKMN_TRAINER
.byte TRAINERMUSIC_PKMN_TRAINER
.byte TRAINERSPRITE_EMMA
.string LAN_DE "Emma", 12
.string LAN_EN "Emma", 12
.hword ITEM_TRANK
.hword ITEM_KEINS
.hword ITEM_KEINS
.hword ITEM_KEINS
.byte DOUBLEBATTLE_NEIN
.byte 0x0, 0x0, 0x0
.hword 14, 0x0
.byte ANZAHL_PKMN_1
.byte 0x0, 0x0, 0x0
.word pokemon_von_id_6


.global pokemon_von_id_1 
.align 2
pokemon_von_id_1: 
.hword 0 
.hword 5 
.hword PKMN_BISASAM 
.hword 0x0

.global pokemon_von_id_2 
.align 2
pokemon_von_id_2: 
.hword 20 
.hword 5 
.hword PKMN_BISASAM 
.hword 0x0

.global pokemon_von_id_3 
.align 2
pokemon_von_id_3: 
.hword 50 
.hword 6 
.hword PKMN_BISASAM 
.hword ITEM_SINELBEERE

.global pokemon_von_id_4 
.align 2
pokemon_von_id_4: 
.hword 0 
.hword 5 
.hword PKMN_BISASAM 
.hword 0x0

.global pokemon_von_id_5 
.align 2
pokemon_von_id_5: 
.hword 20 
.hword 5 
.hword PKMN_BISASAM 
.hword 0x0

.global pokemon_von_id_6 
.align 2
pokemon_von_id_6: 
.hword 50 
.hword 6 
.hword PKMN_BISASAM 
.hword ITEM_SINELBEERE