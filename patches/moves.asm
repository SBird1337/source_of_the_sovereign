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

//attack name table

.org 0x08000148
.word str_move_name_0
.org 0x080308A4
.word str_move_name_0
.org 0x0804EF84
.word str_move_name_0
.org 0x0806BE8C
.word str_move_name_0
.org 0x0809B524
.word str_move_name_0
.org 0x080BD830
.word str_move_name_0
.org 0x080BFAA4
.word str_move_name_0
.org 0x080CC914
.word str_move_name_0
.org 0x080D764C
.word str_move_name_0
.org 0x080D7EE0
.word str_move_name_0
.org 0x080D8500
.word str_move_name_0
.org 0x080E4E58
.word str_move_name_0
.org 0x080E51F0
.word str_move_name_0
.org 0x0810D9C0
.word str_move_name_0
.org 0x081140F0
.word str_move_name_0
.org 0x0811C5A8
.word str_move_name_0
.org 0x0811C6E4
.word str_move_name_0
.org 0x081256BC
.word str_move_name_0
.org 0x08125948
.word str_move_name_0
.org 0x08125A2C
.word str_move_name_0
.org 0x08125BE4
.word str_move_name_0
.org 0x08125CE0
.word str_move_name_0
.org 0x08125FF8
.word str_move_name_0
.org 0x0812606C
.word str_move_name_0
.org 0x08126128
.word str_move_name_0
.org 0x081261FC
.word str_move_name_0
.org 0x0812627C
.word str_move_name_0
.org 0x081267F0
.word str_move_name_0
.org 0x08126880
.word str_move_name_0
.org 0x08126E64
.word str_move_name_0
.org 0x08131E14
.word str_move_name_0
.org 0x0813695C
.word str_move_name_0

//end of attack name table

//attack desc. table

.org 0x080E5440
.word move_description_list

.org 0x08137BC8
.word move_description_list

//end of attack desc. table

//move table

//end of move table