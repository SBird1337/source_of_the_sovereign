.org 0x0815FD60 + (4 * 0x68) //special 0x68
.word sp_special_casm|1

.org 0x0815FD60 + (4*0x69)
.word get_text_pointer_from_lookup|1

.org 0x0815FD60 + (4*0x6A)
.word get_map_pointer_from_lookup|1

.org 0x0815FD60 + (4*0x6B)
.word sp_clear_variables|1