//new learning_moveset

.org 0x0803EB20
    ldr r1, =new_move_first|1
	bx r1

.org 0x0803EB84
	.pool

.org 0x0803EA10
	ldr r1, =new_move_second|1
	bx r1
	.pool

.org 0x08043CE8
	ldr r2, =new_move_third|1
	bx r2
	.pool

//end of new learning moveset
