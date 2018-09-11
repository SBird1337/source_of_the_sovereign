//Point to trainer data, which is 4 bytes prior to the first name

.org 0x0800FC00
.word trainer_data

.org 0x0800FC80
.word trainer_data

.org 0x0801133C
.word trainer_data

.org 0x080113BC
.word trainer_data

.org 0x080116C4
.word trainer_data

.org 0x08015728
.word trainer_data

.org 0x08025920
.word trainer_data

.org 0x080259DC
.word trainer_data

.org 0x08037E6C
.word trainer_data

.org 0x08038040
.word trainer_data

.org 0x08043694
.word trainer_data

.org 0x08043884
.word trainer_data

.org 0x08044028
.word trainer_data

.org 0x0807FE88
.word trainer_data

.org 0x0807FFB8
.word trainer_data

.org 0x080C6F40
.word trainer_data

.org 0x080D809C
.word trainer_data

.org 0x080D8158
.word trainer_data

.org 0x08113810
.word trainer_data

.org 0x08115230
.word trainer_data

.org 0x0812C048
.word trainer_data

.org 0x080D80A0
.word trainerclasses

.org 0x0811B4B4
.word trainerclasses

.org 0x080259CC
.word trainer_money_rate

//Point to new trainer item data
.org 0x080C6D9C
.word trainer_data +12
