.org 0x08024E80
ldr r0, =entry_hazards_hook|1
bx r0
.pool

.org 0x08024FE4
ldr r4, =battle_switch_in_hook|1
bx r4
.pool

.org 0x08014CD8
ldr r3, =get_first_to_strike|1
bx r3
.pool

.org 0x08013BBC
.word battle_end_of_turn_hook+1

.org 0x08018254
.word battle_end_of_turn_hook+1

.org 0x080146AC
ldr r0, =battle_m_flee_hook+1
bx r0
.pool