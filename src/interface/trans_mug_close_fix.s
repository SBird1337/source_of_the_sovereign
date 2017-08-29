.EQU BLDMOD,0x50
.EQU LCD_WIN_IN,0x48
.EQU COLEV,0x52

.align 2
.text
.thumb

.global trans_mug_close_fix

trans_mug_close_fix:
	mov r0, r4
	ldr r4, sub_08077508
	bl bxr4
	ldr r4, sub_08069B34
	bl bxr4
	push {r0-r4}
	bl trans_deactivate_2
	pop {r0-r4}
	pop {r4}
	pop {r0}
	bx r0

bxr4:
	bx r4
.align 2
sub_08077508:
	.word 0x08077508 + 1

sub_08069B34:
	.word 0x08069B34 + 1

.align 2
trans_deactivate_2:
	push {lr}
	bl mug_delete
	pop {pc}
