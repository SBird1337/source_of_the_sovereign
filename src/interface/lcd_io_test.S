#include <config.h>

.EQU BLDMOD,0x50
.EQU LCD_WIN_IN,0x48
.EQU COLEV,0x52

.EQU WIN0_BG0,0x1
.EQU WIN0_BG1,0x2
.EQU WIN0_BG2,0x4
.EQU WIN0_BG3,0x8
.EQU WIN0_OBJ,0x10
.EQU WIN0_FX,0x20

.EQU WIN1_BG0,0x100
.EQU WIN1_BG1,0x200
.EQU WIN1_BG2,0x400
.EQU WIN1_BG3,0x800
.EQU WIN1_OBJ,0x1000
.EQU WIN1_FX,0x2000

.EQU WIN0_BG_OBJ,WIN0_BG0 | WIN0_BG1 | WIN0_BG2 | WIN0_BG3 | WIN0_OBJ
.EQU WIN1_BG_OBJ,WIN1_BG0 | WIN1_BG1 | WIN1_BG2 | WIN1_BG3 | WIN1_OBJ

@Testing

.align 2
.thumb
.text


get_flag_val:
    push {lr}
    ldr r0, =FLAG_ACTIVATE
    bl flag_decrypt
    pop {pc}

.global trans_activate
trans_activate:
    push {r0-r7}
    bl mug_create_on_variable
    bl get_flag_val
    cmp r0, #0
    bne no_activate
    mov r0, #LCD_WIN_IN
    ldrh r1, =WIN0_BG_OBJ | WIN1_BG_OBJ | WIN0_FX
    bl do_lcd_io_set

    mov r0, #BLDMOD
    ldrh r1, =0x3F41
    bl do_lcd_io_set

    mov r0, #COLEV
    ldrh r1, =0x0A0F
    bl do_lcd_io_set

no_activate:

    pop {r0-r7}
    ldr r0, =0x08069371
    mov r1, #0x50
    bl task_add
    pop {r0}
    bx r0

.global trans_deactivate
trans_deactivate:
    push {r0-r3}
    bl mug_delete
    mov r0, #LCD_WIN_IN
    ldrh r1, =0x1F1F
    bl do_lcd_io_set

    mov r0, #BLDMOD
    ldrh r1, =0x1E40
    bl do_lcd_io_set

    mov r0, #COLEV
    ldrh r1, =0x0010
    bl do_lcd_io_set

    pop {r0-r3}
    ldr r1, =0x0203709C
    mov r0, #0
    strb r0, [r1]
    pop {r0}
    bx r0

do_lcd_io_set:
    push {r3, lr}
    ldr r3, =lcd_io_set_func
    bl bxr3
    pop {r3}
    pop {r0}
    bx r0

task_add:
    ldr r2, =task_add_func
    bx r2

bxr3:
    bx r3

.global pal_load_hook
pal_load_hook:
    push {r0}
    bl get_flag_val
    mov r1, r0
    pop {r0}
    cmp r1, #0
    bne load_normal
    ldr r1, =box_zero_flag
    ldrb r1, [r1]
    cmp r1, #0
    beq load_normal
    ldr r0, =palette_override
    b load_hook_end
load_normal:
    ldr r1, =0x08471DEC
    add r0, r1
load_hook_end:
    pop {r1}
    bx r1

.global pal_load_hook_2
pal_load_hook_2:
    add r5, #4
    add r4, r5
    ldr r0, [r4]
    mov r1, r8
    ldr r2, =box_zero_flag
    ldrb r2, [r2]
    cmp r2, #0
    beq load_normal_2
    push {r0-r1}
    bl get_flag_val
    mov r2, r0
    pop {r0-r1}
    cmp r2, #0
    bne load_normal_2
    ldr r0, =palette_override
load_normal_2:
    ldr r2, =0x08150009         @RETURN ADDRESS
    bx r2

flag_decrypt:
    ldr r1, =flag_decrypt_func
    bx r1

.align 2

palette_override:
.hword 0
.hword 0
.hword 0x7FFF
.hword 0x0000
.hword 0x7FFF
.hword 0x7FFF
.hword 0x7FFF
.hword 0x7FFF
.hword 0x7FFF
.hword 0x7FFF
.hword 0x7FFF
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0
