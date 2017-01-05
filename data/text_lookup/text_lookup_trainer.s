.align 2
.thumb
.text

.global trainer_text_table
trainer_text_table:
    .word trainer_texts_0
    .word trainer_texts_1
    .word trainer_texts_2
    .word trainer_texts_3
    .word trainer_texts_4
    .word trainer_texts_5
    .word 0xDEADBEEF
.align 2

trainer_texts_0:
    .word str_t0_intro
    .word str_t0_defeat
    .word 0xDEADBEEF
trainer_texts_1:
trainer_texts_2:
trainer_texts_3:
trainer_texts_4:
trainer_texts_5:
    .word 0xDEADBEEF

.align 2
.global trainer_text_array
trainer_text_array:
    .word trainer_text_table


