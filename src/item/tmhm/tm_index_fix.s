.align 2
.thumb
.global tm_fix_index_num
tm_fix_index_num:
    ldr r0, =0xFFFFFEE0
    add r1, r6, r0 @@index in r1
    cmp r1, #50
    bhi greater
    add r1, #70
    b calc_string
greater:
    sub r1, #86
calc_string:
    mov r0, r4
    mov r2, #2
    mov r3, #3
    push {r4}
    bl int_to_str_routine
    pop {r4}
    ldr r0, =0x08131DBD
    bx r0

int_to_str_routine:
    ldr r4, =0x08008E78|1
    bx r4
