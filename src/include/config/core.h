#ifndef CONFIG_S_
#define CONFIG_S_

#define MAGIC_BOUNCE_FLAG       0x0203FFFD
#define OBJ_1_TEMP              0x0203FFFE
#define OBJ_2_TEMP              0x0203FFFF

/*Variables and Tags regarding mugshots*/
#define MUGHSOT_1_TABLE         0x5000
#define MUGSHOT_1_X             0x5001
#define MUGSHOT_1_Y             0x5002
#define MUGSHOT_1_TAG           0x1337

#define MUGHSOT_2_TABLE         0x5003
#define MUGSHOT_2_X             0x5004
#define MUGSHOT_2_Y             0x5005
#define MUGSHOT_2_TAG           0x1338

/*Variable for special control*/
#define CALLASM_VAR             0x5006

/*Variables for camera control*/
#define CAMERA_VAR_X            0x5007
#define CAMERA_VAR_Y            0x5008

/*Variables for walking script control*/
#define WALK_SCRIPT_VAR         0x5009

/*Variables for Change OW Sprite*/
#define CHANGE_OW_FROM         0x500A
#define CHANGE_OW_TO           0x500B

/*Variable for custom text*/
#define TEXT_VAR                0x500C

/*Variable for controlling evolutions*/
#define EVO_VAR                 0x500D

#define HEALING_BANK_MAP_VAR    0x500E
#define HEALING_X_VAR           0x500F
#define HEALING_Y_VAR           0x5010

/*Variables regarding battle background loading*/
#define BATTLE_NORMAL_VAR       0x5011
#define BATTLE_SEA_VAR          0x5012

#define TEXT_ANIMATION_VAR      0x5013

/*Variables to control the music overrides*/
#define VAR_FROM_1              0x51FA
#define VAR_FROM_2              0x51FB
#define VAR_FROM_3              0x51FC
#define VAR_TO_1                0x51FD
#define VAR_TO_2                0x51FE
#define VAR_TO_3                0x51FF

/*Flag to enable the music overrides*/
#define FLAG_SKIP_BATTLE_MUSIC  0x742

/*Flag to deactivate transparent textboxes*/
#define FLAG_ACTIVATE           0x900
#define FLAG_WALK_SCRIPT        0x901
#define FLAG_DEOXYS_AURA        0x902

/*Effect IDs controlling various in-battle item effects etc.*/
#define ITEM_EFFECT_SMOOTH_ROCK 0x48
#define ITEM_EFFECT_DAMP_ROCK   0x49
#define ITEM_EFFECT_HEAT_ROCK   0x4A
#define ITEM_EFFECT_ICY_ROCK    0x4B
#define ITEM_EFFECT_FLAME_ORB   0x4C
#define ITEM_EFFECT_TOXIC_ORB   0x4D
#define ITEM_EFFECT_EXPERT_BELT 0x4E

/*Battlescript command definitions (Do not edit unless changing the command table [bs_command_table.S])*/
#define BS_ATTACKSTRING         0x02
#define BS_PPREDUCE             0x03

#define BS_ATTACKANIMATION      0x09
#define BS_WAITANIMATION        0x0A
#define BS_PRINTSTRING          0x10
#define BS_WAITMESSAGE          0x12
#define BS_JUMPIFSTATUS         0x1C
#define BS_JUMPIFABILITY        0x1E
#define BS_JUMPIFSTAT           0x20
#define BS_JUMPIFWORD           0x2B
#define BS_GOTO                 0x28
#define BS_JUMPIFARRAYNOTEQUAL  0x2D
#define BS_SETBYTE              0x2E
#define BS_ORWORD               0x35
#define BS_PAUSE                0x39
#define BS_WAITSTATE            0x3A
#define BS_RETURN               0x3C
#define BS_END3                 0x3F
#define BS_CALL                 0x41
#define BS_PLAYANIMATION        0x45
#define BS_PLAYSTATANIM         0x48
#define BS_SWITCH1              0x4C
#define BS_SWITCH2              0x4D
#define BS_SWITCH3              0x4E
#define BS_NOP3                 0x83
#define BS_STATBUFFCHANGE       0x89
#define BS_CASTFORMSWITCH       0xE7
#define BS_CALLASM              0xF8
#define BS_CURESTATUS           0xF9
#define BS_SETWORD              0xFA

/*For hacking the miracle eye command into set foresight*/
/*Comment out the first define to deactivate the miracleeye injection in the command table*/

/*Some move effect IDs important for correct implementation*/
#define MOVE_EFFECT_SACRED_SWORD    0xFF

#endif
