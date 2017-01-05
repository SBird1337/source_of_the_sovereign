.org 0x0815FD60 + (4 * 0x68) //special 0x68
.word sp_special_casm|1

.org 0x0815FD60 + (4*0x69)
.word sp_load_text_person|1

.org 0x0815FD60 + (4*0x6A)
.word sp_load_text_map|1

.org 0x0815FD60 + (4*0x6B)
.word sp_clear_variables|1