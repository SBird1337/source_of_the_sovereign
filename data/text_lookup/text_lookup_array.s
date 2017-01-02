.align 2
.text
.thumb

.global get_text_pointer_from_lookup
get_text_pointer_from_lookup:
push {r4-r5, lr}
ldr r0, =str_invalid_text
b valid_text_two
@delete those two lines to activate the system

ldr r0, =sav_one
ldr r0, [r0]
ldrb r4, [r0, #4] @r4 = bank
ldrb r5, [r0, #5] @r5 = map
ldrh r0, =0x800F
ldr r2, =var_get
bl bxr2 @r0 = person id
ldr r1, =text_lookup_array
lsl r3, r4, #2
add r1, r3
ldr r1, [r1]    @load bank
lsl r3, r5, #2
add r1, r3
ldr r1, [r1]    @load map
add r1, #4      @skip the global map pointer
lsl r3, r0, #2
add r1, r3
ldr r1, [r1]    @load person
mov r4, r1
ldrh r0, =0x500C
ldr r2, =var_get
bl bxr2
lsl r0, #2
add r1, r0, r4
ldr r0, [r1, #0] @load specific ID
lsr r1, r0, #0x18
cmp r1, #8
beq valid_text_two
cmp r1, #9
beq valid_text_two
ldr r0, =str_invalid_text
valid_text_two:
ldr r1, lp_offset
str r0, [r1]
pop {r4-r5}
pop {r1}
bx r1

.global get_map_pointer_from_lookup
get_map_pointer_from_lookup:
push {r4-r5, lr}
ldr r0, =str_invalid_text
b valid_text_one
@delete those two lines to activate the system

ldr r0, =sav_one
ldr r0, [r0]
ldrb r4, [r0, #4] @r4 = bank
ldrb r5, [r0, #5] @r5 = map
ldr r1, =text_lookup_array
lsl r3, r4, #2
add r1, r3
ldr r1, [r1]    @load bank
lsl r3, r5, #2
add r1, r3
ldr r1, [r1]    @load map
ldr r4, [r1]    @map specific text array
ldrh r0, =0x500C
ldr r2, =var_get
bl bxr2
lsl r0, #2
add r1, r0, r4
ldr r0, [r1, #0] @load specific ID
lsr r1, r0, #0x18
cmp r1, #8
beq valid_text_one
cmp r1, #9
beq valid_text_one
ldr r0, =str_invalid_text
valid_text_one:
ldr r1, lp_offset
str r0, [r1]
pop {r4-r5}
pop {r1}
bx r1

bxr2:
bx r2

.align 2
lp_offset:
    .word 0x03000F14

.align 2
.section .rodata
.global text_lookup_array
text_lookup_array:
    .word text_bank_zero
    .word text_bank_one
    .word text_bank_two
    .word text_bank_three
    .word text_bank_four
    .word text_bank_five
    .word 0xDEADBEEF

text_bank_zero:
text_bank_one:
text_bank_two:
text_bank_three:
text_bank_four:
    .word text_bank_zero_map_zero
    .word text_bank_zero_map_one
    .word 0xDEADBEEF
text_bank_five:
    .word text_bank_five_map_zero
    .word 0xDEADBEEF

text_bank_zero_map_zero:
text_bank_zero_map_one:
    .word text_bank_zero_map_zero_global
    .word text_bank_zero_amp_zero_ev_one
    .word text_bank_zero_amp_zero_ev_two
    .word text_bank_zero_amp_zero_ev_three
    .word text_bank_zero_amp_zero_ev_four
    .word text_bank_zero_amp_zero_ev_five
    .word text_bank_zero_amp_zero_ev_six
    .word text_bank_zero_amp_zero_ev_seven
    .word 0xDEADBEEF

text_bank_zero_amp_zero_ev_one:
text_bank_zero_amp_zero_ev_two:
text_bank_zero_amp_zero_ev_three:
text_bank_zero_amp_zero_ev_four:
text_bank_zero_amp_zero_ev_five:
text_bank_zero_amp_zero_ev_six:
text_bank_zero_amp_zero_ev_seven:
    .word str_person_test
    .word 0xDEADBEEF

text_bank_zero_map_zero_global:
    .word str_person_test
    .word str_person_zero
    .word 0xDEADBEEF

text_bank_five_map_zero:
    .word text_bank_five_map_zero_global
    .word 0xDEADBEEF

text_bank_five_map_zero_global:
    .word str_tundra_hq_name
    .word str_tundra_hq_0
    .word str_tundra_hq_1
    .word str_tundra_hq_2
    .word str_tundra_hq_3
    .word str_tundra_hq_4
    .word str_tundra_hq_5
    .word str_tundra_hq_6
    .word str_tundra_hq_7
    .word str_tundra_hq_8
    .word str_tundra_hq_9
    .word str_tundra_hq_10
    .word str_tundra_hq_11
    .word str_tundra_hq_12