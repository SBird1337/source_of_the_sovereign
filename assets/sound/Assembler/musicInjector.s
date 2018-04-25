
    .thumb
    .align 2

musicInjector:
    push    {r4, r5, r6, lr}
    mov     r5, r0
    ldrh	r0, var_music1from      ; (0x74)
    ldr	    r1, getvaraddr          ; (0x88)
    bl      call_r1
    cmp	    r0, #0
    beq     branch_1
    ldrh    r3, [r0]
    ldrh	r1, var_disableval      ; (0x84)
    cmp	    r3, r1
    beq     branch_1
    cmp	    r3, r5
    bne     branch_1
    ldrh    r0, var_music1to        ; (0x7c)
    ldr	    r1, getvaraddr          ; (0x88)
    bl      call_r1
    ldrh    r5, [r0]
    b       branch_2
branch_1:
    ldrh    r0, var_music2from      ; (0x78)
    ldr	    r1, getvaraddr          ; (0x88)
    bl      call_r1
    cmp	    r0, #0
    beq     branch_2
    ldrh    r3, [r0]
    ldrh	r1, var_disableval      ; (0x84)
    cmp	    r3, r1
    beq     branch_2
    cmp	    r3, r5
    bne     branch_2
    ldrh    r0, var_music2to        ; (0x80)
    ldr	    r1, getvaraddr          ; (0x88)
    bl      call_r1
    ldrh    r5, [r0]

branch_2:
    lsls    r0, r5, #16
    pop	{r4, r5, r6}
    ldr	r2, mplay_table         ; (0x90)
    ldr	r1, song_list           ; (0x94)
    lsrs    r0, r0, #13
    adds    r0, r0, r1
    ldrh    r3, [r0, #4]
    lsls    r1, r3, #1
    adds    r1, r1, r3
    lsls    r1, r1, #2
    adds    r1, r1, r2
    ldr	r2, [r1, #0]
    ldr	r1, [r0, #0]
    mov     r0, r2
    pop	{pc}
call_r1:
    bx	r1

var_music1from:
    .word 0x1014
var_music2from:
    .word 0x1015
var_music1to:
    .word 0x1016
var_music2to:
    .word 0x1017
var_disableval:
    .word 0xFFFF
getvaraddr:
    .word 0x0806E455
MPlayContinue:
    .word 0x081DCFF9
mplay_table:
    .word 0x084A329C
song_list:
    .word 0x084A32CC
