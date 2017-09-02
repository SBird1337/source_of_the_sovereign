.align 2
.text
.thumb

.global bs_command_table
bs_command_table:
.incbin "src/moves/battle_engine/bs_table_d.bin"

.word bs_callasm+1
.word bs_setword+1