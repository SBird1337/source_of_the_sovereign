.org 0x0809CB58
.word multichoice_array

.org 0x0809CFD4
.word multichoice_array

.org 0x08080228
    ldr r1, =tb_configure_by_script+1
    bx r1
    .pool