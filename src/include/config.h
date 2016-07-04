#include "pkmn_types.h"

#ifndef CONFIG_S_
#define CONFIG_S_

#define MAGIC_BOUNCE_FLAG	0x0203FFFD
#define OBJ_1_TEMP			0x0203FFFE
#define OBJ_2_TEMP			0x0203FFFF


/*Variables regarding battle background loading*/
#define NORMAL_VAR	0x4000
#define SEA_VAR	0x4001

/*Variables and Tags regarding mugshots*/
#define MUGHSOT_1_TABLE 0x5000
#define MUGSHOT_1_X 0x5001
#define MUGSHOT_1_Y 0x5002
#define MUGSHOT_1_TAG 0x1337

#define MUGHSOT_2_TABLE 0x5003
#define MUGSHOT_2_X 0x5004
#define MUGSHOT_2_Y 0x5005
#define MUGSHOT_2_TAG 0x1338

/*Variable for special control*/
#define CALLASM_VAR 0x5006

/*Variables for camera control*/
#define CAMERA_VAR_X 0x5007
#define CAMERA_VAR_Y 0x5008

/*Variables for walking script control*/
#define WALK_SCRIPT_VAR 0x5009

/*Variables to control the music overrides*/
#define VAR_FROM_1 0x51FA
#define VAR_FROM_2 0x51FB
#define VAR_FROM_3 0x51FC
#define VAR_TO_1 0x51FD
#define VAR_TO_2 0x51FE
#define VAR_TO_3 0x51FF

/*Flag to enable the music overrides*/
#define FLAG_ENABLE_MUSIC_OVERRIDES 0x742

/*Special music override values*/
#define MUS_NO_OVERRIDE 0xFFFF
#define MUS_SKIP_PLAY 0xFFFE

/*Flag to deactivate transparent textboxes*/
#define FLAG_ACTIVATE		0x900
#define FLAG_WALK_SCRIPT	0x901

/*Effect IDs controlling various in-battle item effects etc.*/
#define ITEM_EFFECT_SMOOTH_ROCK	0x48
#define ITEM_EFFECT_DAMP_ROCK	0x49
#define ITEM_EFFECT_HEAT_ROCK	0x4A
#define ITEM_EFFECT_ICY_ROCK	0x4B
#define ITEM_EFFECT_FLAME_ORB	0x4C
#define ITEM_EFFECT_TOXIC_ORB	0x4D
#define ITEM_EFFECT_EXPERT_BELT	0x4E

/*Battlescript command definitions (Do not edit unless changing the command table [bs_command_table.S])*/
#define BS_ATTACKSTRING			0x02
#define BS_PPREDUCE				0x03

#define BS_ATTACKANIMATION		0x09
#define BS_WAITANIMATION		0x0A
#define BS_PRINTSTRING			0x10
#define BS_WAITMESSAGE			0x12
#define BS_JUMPIFSTATUS			0x1C
#define BS_JUMPIFABILITY		0x1E
#define BS_JUMPIFSTAT			0x20
#define BS_JUMPIFWORD			0x2B
#define BS_GOTO					0x28
#define BS_JUMPIFARRAYNOTEQUAL	0x2D
#define BS_SETBYTE				0x2E
#define BS_ORWORD				0x35
#define BS_PAUSE 				0x39
#define BS_WAITSTATE			0x3A
#define BS_RETURN				0x3C
#define BS_END3					0x3F
#define BS_CALL					0x41
#define BS_PLAYANIMATION		0x45
#define BS_PLAYSTATANIM			0x48
#define BS_SWITCH1				0x4C
#define BS_SWITCH2				0x4D
#define BS_SWITCH3				0x4E
#define BS_NOP3					0x83
#define BS_STATBUFFCHANGE		0x89
#define BS_CASTFORMSWITCH		0xE7
#define BS_CALLASM				0xF8
#define BS_CURESTATUS			0xF9
#define BS_SETWORD				0xFA

/*For hacking the miracle eye command into set foresight*/
/*Comment out the first define to deactivate the miracleeye injection in the command table*/
#define MIRACLEEYE
#define MIRACLEEYEADDRESS		0x08C158A0

/*Ability index numbers*/
#define	ABILITY_SAND_VEIL		0x08	/*Is included in vanilla firered*/
#define ABILITY_NATURAL_CURE	0x1E
#define	ABILITY_HUSTLE			0x37	/*Is included in vanilla firered*/
#define ABILITY_GUTS			0x3E	/*Is included in vanilla firered*/
#define ABILITY_MARVEL_SCALE	0x3F	/*Is included in vanilla firered*/
#define ABILITY_SAND_STREAM		0x2D	/*Is included in vanilla firered*/
#define ABILITY_AIR_LOCK		0x4D	/*Is included in vanilla firered*/
#define	ABILITY_TANGLED_FEET	0x4E
#define	ABILITY_SNOW_CLOAK		0x52
#define ABILITY_HEAT_PROOF		0x56
#define ABILITY_SIMPLE			0x57
#define ABILITY_SKILL_LINK		0x5D
#define	ABILITY_SNIPER			0x62
#define	ABILITY_MAGIC_GUARD		0x63	/*Is not included in the project but needs to be here for consistancy reasons*/

#define	ABILITY_TECHNICIAN		0x66
#define ABILITY_MOLD_BREAK		0x69
#define ABILITY_SUPER_LUCK		0x6A
#define ABILITY_UNAWARE			0x6E
#define ABILITY_TINTED_LENS		0x6F
#define ABILITY_FILTER			0x70
#define ABILITY_SCRAPPY			0x72

#define ABILITY_SOLID_ROCK		0x75
#define ABILITY_SNOW_WARNING	0x76
#define	ABILITY_DEFEATIST		0x82
#define ABILITY_MULTI_SCALE		0x89
#define ABILITY_TOXIC_BOOST		0x8A
#define ABILITY_FLARE_BOOST		0x8B

#define ABILITY_REGENERATOR		0x91
#define ABILITY_BIG_PECKS		0x92
#define ABILITY_WONDER_SKIN		0x94

#define ABILITY_MOXIE			0x9A
#define ABILITY_MAGIC_BOUNCE	0x9D

#define ABILITY_VICTORY_STAR	0xA3

#define ABILITY_FUR_COAT		0xAA
#define ABILITY_TURBOBLAZE		0xA4
#define ABILITY_TERAVOLT		0xA5

/*Some move effect IDs important for correct implementation*/
#define MOVE_EFFECT_SACRED_SWORD	0xFF

#endif
