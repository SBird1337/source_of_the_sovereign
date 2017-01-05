.text
.align 2

.thumb

.global multichoice_array
multichoice_array:
    .word smc_yes_no
    .word 2

    .word smc_difficulty
    .word 3


smc_yes_no:
    .word str_yes
    .word 0
    .word str_no
    .word 0

smc_difficulty:
    .word str_beginner
    .word 0
    .word str_intermediate
    .word 0
    .word str_expert
    .word 0