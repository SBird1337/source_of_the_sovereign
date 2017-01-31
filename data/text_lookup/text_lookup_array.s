.align 2
.text
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
    .word text_bank_zero_map_zero
    .word 0xDEADBEEF
text_bank_one:
text_bank_two:
    .word text_bank_two_map_zero
    .word 0xDEADBEEF

text_bank_three:
text_bank_four:
    .word text_bank_zero_map_zero
    .word text_bank_zero_map_one
    .word 0xDEADBEEF
text_bank_five:
    .word text_bank_five_map_zero
    .word 0xDEADBEEF

text_bank_zero_map_zero:
    .word text_bank_zero_map_zero_global
    .word text_bank_zero_map_zero_npc_0
    .word 0xDEADBEEF
text_bank_zero_map_one:
    .word 0xDEADBEEF

text_bank_two_map_zero:
    .word text_bank_two_map_zero_global
    .word 0xDEADBEEF

text_bank_five_map_zero:
    .word text_bank_five_map_zero_global
    .word 0xDEADBEEF

text_bank_zero_map_zero_global:
    .word str_hesp_out_g_0
    .word str_hesp_out_g_1
    .word str_hesp_out_g_2
    .word str_hesp_out_g_3
    .word str_hesp_out_g_4
    .word str_hesp_out_g_5
    .word str_hesp_out_g_6
    .word str_hesp_out_g_7
    .word str_hesp_out_g_8
    .word str_hesp_out_g_9
    .word str_hesp_out_g_10
    .word str_hesp_out_g_11
    .word str_hesp_out_g_12
    .word str_hesp_out_g_13
    .word str_hesp_out_g_14
    .word str_hesp_out_g_15
    .word str_hesp_out_g_16
    .word str_hesp_out_g_17
    .word str_hesp_out_g_18
    .word str_hesp_out_g_19
    .word str_hesp_out_g_20
    .word str_hesp_out_g_21
    .word str_hesp_out_g_22
    .word str_hesp_out_g_23
    .word str_hesp_out_g_24
    .word str_hesp_out_g_25
    .word str_hesp_out_g_26
    .word str_hesp_out_g_27
    .word str_hesp_out_g_28
    .word str_hesp_out_g_29
    .word str_hesp_out_g_30
    .word 0xDEADBEEF

text_bank_zero_map_zero_npc_0:
    .word str_hesp_out_npc_0_0
    .word str_hesp_out_npc_0_1
    .word str_hesp_out_npc_0_2
    .word str_hesp_out_npc_0_3
    .word str_hesp_out_npc_0_4
    .word 0xDEADBEEF

text_bank_two_map_zero_global:
    .word str_hesp_20_g_0
    .word 0xDEADBEEF

text_bank_five_map_zero_global:
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
    .word 0xDEADBEEF

.global text_lookup_table
text_lookup_table:
    .word text_lookup_array