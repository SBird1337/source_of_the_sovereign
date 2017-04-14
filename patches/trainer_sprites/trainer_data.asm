//Point to trainer data, which is 4 bytes prior to the first name

.org 0x0800FC00
.word str_trainer_name_0 -4

.org 0x0800FC80
.word str_trainer_name_0 -4

.org 0x0801133C
.word str_trainer_name_0 -4

.org 0x080113BC
.word str_trainer_name_0 -4

.org 0x080116C4
.word str_trainer_name_0 -4

.org 0x08015728
.word str_trainer_name_0 -4

.org 0x08025920
.word str_trainer_name_0 -4

.org 0x080259DC
.word str_trainer_name_0 -4

.org 0x08037E6C
.word str_trainer_name_0 -4

.org 0x08038040
.word str_trainer_name_0 -4

.org 0x08043694
.word str_trainer_name_0 -4

.org 0x08043884
.word str_trainer_name_0 -4

.org 0x08044028
.word str_trainer_name_0 -4

.org 0x0807FE88
.word str_trainer_name_0 -4

.org 0x0807FFB8
.word str_trainer_name_0 -4

.org 0x080C6F40
.word str_trainer_name_0 -4

.org 0x080D809C
.word str_trainer_name_0 -4

.org 0x080D8158
.word str_trainer_name_0 -4

.org 0x08113810
.word str_trainer_name_0 -4

.org 0x08115230
.word str_trainer_name_0 -4

.org 0x0812C048
.word str_trainer_name_0 -4

.org 0x080D80A0
.word str_trainerclassname_0

.org 0x0811B4B4
.word str_trainerclassname_0

.org 0x080259CC
.word trainer_money_rate

//Point to new trainer item data
.org 0x080C6D9C
.word str_trainer_name_0 +12