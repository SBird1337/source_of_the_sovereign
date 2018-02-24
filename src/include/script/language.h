#ifndef SCRIPT_LANG_H_
#define SCRIPT_LANG_H_

#include <config/core.h>
#include <script/movement.h>
#include <script/mugshot.h>
#include <script/battlescreen.h>

#include <script_constant.h> /*TODO: REMOVE ONCE THIS IS DEALT WITH*/

@@ Costum Specials
.equ SP_BATCHMAPTILE, 0x7

@@ Compare operands
.equ B_LT, 0x0
.equ B_EQ, 0x1
.equ B_GT, 0x2
.equ B_LE, 0x3
.equ B_GE, 0x4
.equ B_NE, 0x5

@@ Important flags
.equ FLAG_PKMN_MENU, 0x828
.equ FLAG_POKDEX, 0x829
.equ FLAG_RUNNING_SHOES, 0x82F
.equ FLAG_ORDEN_1, 0x820
.equ FLAG_ORDEN_2, 0x821
.equ FLAG_ORDEN_3, 0x822
.equ FLAG_ORDEN_4, 0x823
.equ FLAG_ORDEN_5, 0x824
.equ FLAG_ORDEN_6, 0x825
.equ FLAG_ORDEN_7, 0x826
.equ FLAG_ORDEN_8, 0x827

@@ LED NAMES
.equ LED_CARUN_CITY_LINKS, 0x1
.equ LED_ROUTE_2, 0x2
.equ LED_ROUTE_3, 0x3
.equ LED_URBANIA_CITY_LINKS, 0x4
.equ LED_ROUTE_5, 0x5
.equ LED_ROUTE_6, 0x6
.equ LED_CARUN_CITY_RECHTS, 0x7
.equ LED_URBANIA_CITY_RECHTS, 0x8

@@ Flag operands
.equ B_T, 0x0
.equ B_F, 0x1

@@ callstd alias
.equ ITEM_OBTAIN, 0x0
.equ ITEM_FIND, 0x1
.equ MSG_FACE, 0x2
.equ MSG_SIGN, 0x3
.equ MSG_KEYOPEN, 0x4
.equ MSG_YES_NO, 0x5
.equ MSG_STD, 0x6

@@ Definition
.equ MUGFACE_LEFT, 0x0
.equ MUGFACE_RIGHT, 0x1

@@ Effect
.equ EFFECT_NORMAL, 0x0
.equ EFFECT_GREY, 0x1
.equ EFFECT_SERPIA, 0x2

@@@@@@@@@@@@@@@@@ Macro

@@ Custom commands

.macro batchmaptilefromto batchmaptile_tiles_from:req batchmaptile_tiles_to:req batchmaptile_kollision_from:req batchmaptile_kollision_to:req
setvar 0x8000 \batchmaptile_tiles_from
setvar 0x8001 \batchmaptile_tiles_to
setvar 0x8002 \batchmaptile_kollision_from
setvar 0x8003 \batchmaptile_kollision_to
setvar 0x5006 SP_BATCHMAPTILE
special 0x68
.endm

.macro batchmaptiletofrom batchmaptile_tiles_from:req batchmaptile_tiles_to:req batchmaptile_kollision_from:req batchmaptile_kollision_to:req
setvar 0x8001 \batchmaptile_tiles_from
setvar 0x8002 \batchmaptile_tiles_to
setvar 0x8003 \batchmaptile_kollision_from
setvar 0x8002 \batchmaptile_kollision_to
setvar 0x5006 SP_BATCHMAPTILE
special 0x68
.endm

.macro sethiddenflags
call sethiddenflagsall
.endm

.macro seteffect seteffect_effect_id:req
writebytetooffset \seteffect_effect_id 0x02036E28
.endm

.macro setecutscene
writebytetooffset 0x80 0x4000044
writebytetooffset 0x20 0x4000045
.endm

.macro clearcutscene
writebytetooffset 0xFF 0x4000044
writebytetooffset 0x00 0x4000045
.endm

.macro pokemsg pokemsg_string:req pokemsg_callstd:req pokemsg_ID:req
checksound
cry \pokemsg_ID 0x0
showpokepic \pokemsg_ID 0x0 0x5
loadpointer 0x0 \pokemsg_string
callstd \pokemsg_callstd
hidepokepic
waitcry
.endm

.macro beben earthquake_horri:req earthquake_tiles:req earthquake_sec:req earthquake_vert:req
setvar 0x8004 \earthquake_horri
setvar 0x8005 \earthquake_tiles
setvar 0x8006 \earthquake_sec
setvar 0x8007 \earthquake_vert
special 0x136
.endm

.macro lookbattle lookbattle_id:req lookbattle_before:req lookbattle_after:req
trainerbattle 0x0 \lookbattle_id 0x0 \lookbattle_before \lookbattle_after
.endm

.macro gymbattle gymbattle_id:req gymbattle_before:req gymbattle_after:req gymbattle_later:req
trainerbattle 0x1 \gymbattle_id 0x0 \gymbattle_before \gymbattle_after \gymbattle_later
.endm

.macro betweenbattle betweenbattle_id:req betweenbattle_before:req betweenbattle_after:req betweenbattle_between:req
trainerbattle 0x2 \betweenbattle_id 0x0 \betweenbattle_before \betweenbattle_after \betweenbattle_between
.endm

.macro scriptbattle scriptbattle_id:req scriptbattle_after:req
trainerbattle 0x3 \scriptbattle_id 0x0 \scriptbattle_after
.endm

.macro doublebattle doublebattle_id:req doublebattle_before:req doublebattle_after:req doublebattle_onepoke:req
trainerbattle 0x4 \doublebattle_id 0x0 \doublebattle_before \doublebattle_after \doublebattle_onepoke
.endm

.macro doublegymbattle doublegymbattle_id:req doublegymbattle_before:req doublegymbattle_after:req doublegymbattle_later:req doublegymbattle_onepoke:req
trainerbattle 0x8 \doublegymbattle_id 0x0 \doublegymbattle_before \doublegymbattle_after \doublegymbattle_later \doublegymbattle_onepoke
.endm

.macro winlosebattle winlosebattle_id:req winlosebattle_win:req winlosebattle_lose:req
trainerbattle 0x9 \winlosebattle_id 0x3 \winlosebattle_win \winlosebattle_lose
.endm

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@                                                                                               @@@
@@@   special version of the trainerbattle command to be caught by the custom handler             @@@
@@@   if the player is spotted and spotscript_flag is set, spotscript_ptr_true is executed        @@@
@@@   if the player is spotted and spotscript_flag is not set, spotscript_ptr_false is executed   @@@
@@@   if the player talks to an npc who has this as its first command, it is ignored              @@@
@@@   THIS COMMAND WORKS IF AND ONLY IF THE TRAINER BIT IS SET ON THE NPC TEMPLATE                @@@
@@@                                                                                               @@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.macro spotscript spotscript_flag:req spotscript_ptr_true:req spotscript_ptr_false:req
.byte 0x5C, 0xFF
.hword \spotscript_flag
.hword 0xFFFF
.word \spotscript_ptr_true
.word \spotscript_ptr_false
.endm

.macro msgbox msgbox_textpointer:req msgbox_callstd:req
loadpointer 0x0 \msgbox_textpointer
callstd \msgbox_callstd
.endm

.macro giveitem giveitem_item:req giveitem_quantity:req giveitem_messagetyp:req
copyvarifnotzero 0x8000 \giveitem_item
copyvarifnotzero 0x8001 \giveitem_quantity
callstd \giveitem_messagetyp
.endm

.macro giveitem2 giveitem2_item:req giveitem2_quantity:req giveitem2_song:req
copyvarifnotzero 0x8000 \giveitem2_item
copyvarifnotzero 0x8001 \giveitem2_quantity
copyvarifnotzero 0x8002 \giveitem2_song
callstd 0x9
.endm

.macro wildbattle wildbattle_spezies:req wildbattle_level:req wildbattle_item:req
setwildbattle \wildbattle_spezies \wildbattle_level \wildbattle_item
dowildbattle
.endm

.macro wildbattle2 wildbattle2_spezies:req wildbattle2_level:req wildbattle2_item:req wildbattle2_battlestyle:req
setwildbattle \wildbattle2_spezies \wildbattle2_level \wildbattle2_item
special 0x137
waitstate
.endm

.macro wildbattlemusic wildbattlemusic_spezies:req wildbattlemusic_level:req wildbattlemusic_item:req wildbattlemusic_music:req
setwildbattle \wildbattlemusic_spezies \wildbattlemusic_level \wildbattlemusic_item
special 0x138
playsong \wildbattlemusic_music 0x0
.endm

.macro costumtrainerbattlemusic costumtrainerbattlemusic_id:req
special 0x3B
playsong \costumtrainerbattlemusic_id 0x0
.endm

.macro colorflicker colorflicker_farbbyte:req
setvar 0x8000 \colorflicker_farbbyte
setvar 0x5006 0x8
special 0x68
.endm

.macro mugmsg mugmsg_textpointer:req mugmsg_callstd:req mugmsg_sprite:req mugmsg_facing:req
.if \mugmsg_facing==MUGFACE_LEFT
    setvar MUGHSOT_1_TABLE \mugmsg_sprite | 0x8000
    setvar MUGSHOT_1_X 0x16
    setvar MUGSHOT_1_Y 0x60
.endif
.if \mugmsg_facing==MUGFACE_RIGHT
    setvar MUGHSOT_1_TABLE \mugmsg_sprite
    setvar MUGSHOT_1_X 0xD0
    setvar MUGSHOT_1_Y 0x60
.endif
msgbox \mugmsg_textpointer \mugmsg_callstd
setvar MUGHSOT_1_TABLE 0x0
.endm

.macro mugrival mugrival_textpointer:req mugrival_callstd:req mugrival_facing:req mugrival_emot=0
setvar 0x8000 \mugrival_emot
.if \mugrival_facing==MUGFACE_LEFT
    call scr_mugrival_left
.endif
.if \mugrival_facing==MUGFACE_RIGHT
    call scr_mugrival_right
.endif
msgbox \mugrival_textpointer \mugrival_callstd
setvar MUGHSOT_1_TABLE 0x0
.endm

.macro transparenzon
clearflag FLAG_ACTIVATE
.endm

.macro transparenzoff
setflag FLAG_ACTIVATE
.endm

.macro battlescreen battlescreen_grass:req battlescreen_sea:req
setvar BATTLE_NORMAL_VAR \battlescreen_grass
setvar BATTLE_SEA_VAR \battlescreen_sea
.endm

.macro cameramove cameramove_xpos:req cameramove_ypos:req
setvar CAMERA_VAR_X \cameramove_xpos
setvar CAMERA_VAR_Y \cameramove_ypos
setvar CALLASM_VAR 0x1
special 0x68
.endm

.macro walkingscript walkingscript_value:req
setvar WALK_SCRIPT_VAR \walkingscript_value
.endm

.macro walkingscripton
setflag FLAG_WALK_SCRIPT
.endm

.macro walkingscriptoff
clearflag FLAG_WALK_SCRIPT
.endm

.macro writemusikon
setflag FLAG_SKIP_BATTLE_MUSIC
.endm

.macro writemusikoff
clearflag FLAG_SKIP_BATTLE_MUSIC
.endm

@@ Index commands

.macro nop
.byte 0x0
.endm

.macro nop1
.byte 0x1
.endm

.macro end
.byte 0x2
.endm

.macro return
.byte 0x3
.endm

.macro call call_address:req
.byte 0x4
.word \call_address
.endm

.macro goto goto_address:req
.byte 0x5
.word \goto_address
.endm

.macro gotoif if1_value:req if1_pointer:req
.byte 0x6
.byte \if1_value
.word \if1_pointer
.endm

.macro callif if2_value:req if2_pointer:req
.byte 0x7
.byte \if2_value
.word \if2_pointer
.endm

.macro callstd callstd_call:req
.byte 0x9
.byte \callstd_call
.endm

.macro killscript
.byte 0xD
.endm

.macro loadpointer loadpointer_bank:req loadpointer_pointer:req
.byte 0xF
.byte \loadpointer_bank
.word \loadpointer_pointer
.endm

.macro writebytetooffset writebytetooffset_bank:req writebytetooffset_location:req
.byte 0x11
.byte \writebytetooffset_bank
.word \writebytetooffset_location
.endm

.macro setvar setvar_variable:req setvar_value:req
.byte 0x16
.hword \setvar_variable
.hword \setvar_value
.endm

.macro addvar addvar_variable:req addvar_value:req
.byte 0x17
.hword \addvar_variable
.hword \addvar_value
.endm

.macro subvar subvar_variable:req subvar_value:req
.byte 0x18
.hword \subvar_variable
.hword \subvar_value
.endm

.macro copyvar copyvar_variableADestin:req copyvar_variableBSource:req
.byte 0x19
.hword \copyvar_variableADestin
.hword \copyvar_variableBSource
.endm

.macro copyvarifnotzero copyvarifnotzero_variableADestin:req copyvarifnotzero_variableBSource:req
.byte 0x1A
.hword \copyvarifnotzero_variableADestin
.hword \copyvarifnotzero_variableBSource
.endm

.macro compare compare_variable:req compare_value:req
.byte 0x21
.hword \compare_variable
.hword \compare_value
.endm

.macro comparevars comparevars_variableA:req comparevars_variableB:req
.byte 0x22
.hword \comparevars_variableA
.hword \comparevars_variableB
.endm

.macro callasm callasm_address:req
.byte 0x23
.word \callasm_address
.endm

.macro special special_number:req
.byte 0x25
.hword \special_number
.endm

.macro special2 special2_variable:req special2_number:req
.byte 0x26
.hword \special2_variable
.hword \special2_number
.endm

.macro waitstate
.byte 0x27
.endm

.macro pause pause_delay:req
.byte 0x28
.hword \pause_delay
.endm

.macro setflag setflag_flag:req
.byte 0x29
.hword \setflag_flag
.endm

.macro clearflag clearflag_flag:req
.byte 0x2A
.hword \clearflag_flag
.endm

.macro checkflag checkflag_flag:req
.byte 0x2B
.hword \checkflag_flag
.endm

.macro resetvars
.byte 0x2E
.endm

.macro sound sound_song:req
.byte 0x2F
.hword \sound_song
.endm

.macro checksound
.byte 0x30
.endm

.macro fanfare fanfare_song:req
.byte 0x31
.hword \fanfare_song
.endm

.macro waitfanfare
.byte 0x32
.endm

.macro playsong playsong_song:req playsong_value:req
.byte 0x33
.hword \playsong_song
.byte \playsong_value
.endm

.macro playsong2 playsong2_song:req
.byte 0x34
.hword \playsong2_song
.endm

.macro songfadedefault
.byte 0x35
.endm

.macro fadesong fadesong_song:req
.byte 0x36
.hword \fadesong_song
.endm

.macro fadeout fadeout_volume:req
.byte 0x37
.byte \fadeout_volume
.endm

.macro fadein fadein_volume:req
.byte 0x38
.byte \fadein_volume
.endm

.macro warp warp_bank:req warp_map:req warp_exit:req warp_x:req warp_y:req
.byte 0x39
.byte \warp_bank
.byte \warp_map
.byte \warp_exit
.hword \warp_x
.hword \warp_y
.endm

.macro warpmuted warpmuted_bank:req warpmuted_map:req warpmuted_exit:req warpmuted_x:req warpmuted_y:req
.byte 0x3A
.byte \warpmuted_bank
.byte \warpmuted_map
.byte \warpmuted_exit
.hword \warpmuted_x
.hword \warpmuted_y
.endm

.macro warpwalk warpwalk_bank:req warpwalk_map:req warpwalk_exit:req warpwalk_x:req warpwalk_y:req
.byte 0x3B
.byte \warpwalk_bank
.byte \warpwalk_map
.byte \warpwalk_exit
.hword \warpwalk_x
.hword \warpwalk_y
.endm

.macro warphole warphole_bank:req warphole_map:req
.byte 0x3C
.byte \warphole_bank
.byte \warphole_map
.endm

.macro warpteleport warpteleport_bank:req warpteleport_map:req warpteleport_exit:req warpteleport_x:req warpteleport_y:req
.byte 0x3D
.byte \warpteleport_bank
.byte \warpteleport_map
.byte \warpteleport_exit
.hword \warpteleport_x
.hword \warpteleport_y
.endm

.macro setwarpplace setwarpplace_bank:req setwarpplace_map:req setwarpplace_exit:req setwarpplace_x:req setwarpplace_y:req
.byte 0x3F
.byte \setwarpplace_bank
.byte \setwarpplace_map
.byte \setwarpplace_exit
.hword \setwarpplace_x
.hword \setwarpplace_y
.endm

.macro getplayerpos getplayerpos_variableX:req getplayerpos_variableY:req
.byte 0x42
.hword \getplayerpos_variableX
.hword \getplayerpos_variableY
.endm

.macro countpokemon
.byte 0x43
.endm

.macro additem additem_item:req additem_quantity:req
.byte 0x44
.hword \additem_item
.hword \additem_quantity
.endm

.macro removeitem removeitem_item:req removeitem_quantity:req
.byte 0x45
.hword \removeitem_item
.hword \removeitem_quantity
.endm

.macro checkitemroom checkitemroom_item:req checkitemroom_quantity:req
.byte 0x46
.hword \checkitemroom_item
.hword \checkitemroom_quantity
.endm

.macro checkitem checkitem_item:req checkitem_quantity:req
.byte 0x47
.hword \checkitem_item
.hword \checkitem_quantity
.endm

.macro checkitemtype checkitemtype_item:req
.byte 0x48
.hword \checkitemtype_item
.endm

.macro addpcitem addpcitem_item:req addpcitem_quantity:req
.byte 0x49
.hword \addpcitem_item
.hword \addpcitem_quantity
.endm

.macro checkpcitem checkpcitem_item:req checkpcitem_quantity:req
.byte 0x4A
.hword \checkpcitem_item
.hword \checkpcitem_quantity
.endm

.macro applymovement applymovement_people:req applymovement_movedata:req
.byte 0x4F
.hword \applymovement_people
.word \applymovement_movedata
.endm

.macro applymovementpos applymovementpos_people:req applymovementpos_movedata:req applymovementpos_x:req applymovementpos_y:req
.byte 0x50
.hword \applymovementpos_people
.word \applymovementpos_movedata
.byte \applymovementpos_x
.byte \applymovementpos_y
.endm

.macro waitmovement waitmovement_people:req
.byte 0x51
.hword \waitmovement_people
.endm

.macro waitmovementpos waitmovementpos_people:req waitmovementpos_x:req waitmovementpos_y:req
.byte 0x52
.hword \waitmovementpos_people
.byte \waitmovementpos_x
.byte \waitmovementpos_y
.endm

.macro hidesprite hidesprite_people:req
.byte 0x53
.hword \hidesprite_people
.endm

.macro hidespritepos hidesprite_people:req hidespritepos_x:req hidespritepos_y:req
.byte 0x54
.hword \hidespritepos_people
.byte \hidespritepos_x
.byte \hidespritepos_y
.endm

.macro showsprite showsprite_people:req
.byte 0x55
.hword \showsprite_people
.endm

.macro showspritepos showspritepos_people:req showspritepos_x:req showspritepos_y:req
.byte 0x56
.hword \showspritepos_people
.byte \showspritepos_x
.byte \showspritepos_y
.endm

.macro movesprite movesprite_people:req movesprite_x:req movesprite_y:req
.byte 0x57
.hword \movesprite_people
.hword \movesprite_x
.hword \movesprite_y
.endm

.macro spritevisible spritevisible_people:req spritevisible_bank:req spritevisible_map:req
.byte 0x58
.hword \spritevisible_people
.byte \spritevisible_bank
.byte \spritevisible_map
.endm

.macro spriteinvisible spriteinvisible_people:req spriteinvisible_bank:req spriteinvisible_map:req
.byte 0x59
.hword \spriteinvisible_people
.byte \spriteinvisible_bank
.byte \spriteinvisible_map
.endm

.macro faceplayer
.byte 0x5A
.endm

.macro spriteface spriteface_people:req spriteface_facing:req
.byte 0x5B
.hword \spriteface_people
.byte \spriteface_facing
.endm

.macro trainerbattle trainerbattle_kind:req trainerbattle_id:req trainerbattle_value:req trainerbattle_before:req trainerbattle_after trainerbattle_later trainerbattle_onepoke
.byte 0x5C
.byte \trainerbattle_kind
.hword \trainerbattle_id
.hword \trainerbattle_value
.word \trainerbattle_before
.word \trainerbattle_after
.word \trainerbattle_later
.word \trainerbattle_onepoke
.endm

.macro repeattrainerbattle
.byte 0x5D
.endm

.macro endtrainerbattle
.byte 0x5E
.endm

.macro endtrainerbattle2
.byte 0x5E
.endm

.macro checktrainerflag checktrainerflag_flag:req
.byte 0x60
.hword \checktrainerflag_flag
.endm

.macro settrainerflag settrainerflag_flag:req
.byte 0x61
.hword \settrainerflag_flag
.endm

.macro cleartrainerflag cleartrainerflag_flag:req
.byte 0x62
.hword \cleartrainerflag_flag
.endm

.macro movesprite2 movesprite2_people:req movesprite2_x:req movesprite2_y:req
.byte 0x63
.hword \movesprite2_people
.hword \movesprite2_x
.hword \movesprite2_y
.endm

.macro moveoffscreen moveoffscreen_people:req
.byte 0x64
.hword \moveoffscreen_people
.endm

.macro spritebehave spritebehave_people:req spritebehave_facing:req
.byte 0x65
.hword \spritebehave_people
.byte \spritebehave_facing
.endm

.macro waitmsg
.byte 0x66
.endm

.macro preparemsg preparemsg_text:req
.byte 0x67
.word \preparemsg_text
.endm

.macro closeonkeypress
.byte 0x68
.endm

.macro lockall
.byte 0x69
.endm

.macro lock
.byte 0x6A
.endm

.macro releaseall
.byte 0x6B
.endm

.macro release
.byte 0x6C
.endm

.macro waitkeypress
.byte 0x6D
.endm

.macro yesnobox yesnobox_x:req yesnobox_y:req
.byte 0x6E
.byte \yesnobox_x
.byte \yesnobox_y
.endm

.macro multichoice multichoice_x:req multichoice_y:req multichoice_choiceList:req multichoice_determines:req
.byte 0x6F
.byte \multichoice_x
.byte \multichoice_y
.byte \multichoice_choiceList
.byte \multichoice_determines
.endm

.macro multichoice2 multichoice2_x:req multichoice2_y:req multichoice2_choiceList:req multichoice2_defaultchoice:req multichoice2_determines:req
.byte 0x70
.byte \multichoice2_x
.byte \multichoice2_y
.byte \multichoice2_choiceList
.byte \multichoice2_defaultchoice
.byte \multichoice2_determines
.endm

.macro multichoice3 multichoice3_x:req multichoice3_y:req multichoice3_choiceList:req multichoice3_numberofchoices:req multichoice3_determines:req
.byte 0x71
.byte \multichoice3_x
.byte \multichoice3_y
.byte \multichoice3_choiceList
.byte \multichoice3_numberofchoices
.byte \multichoice3_determines
.endm

.macro showpokepic showpokepic_spezies:req showpokepic_x:req showpokepic_y:req
.byte 0x75
.hword \showpokepic_spezies
.byte \showpokepic_x
.byte \showpokepic_y
.endm

.macro hidepokepic
.byte 0x76
.endm

.macro braile braile_data:req
.byte 0x78
.word \braile_data
.endm

.macro givepokemon givepokemon_spezies:req givepokemon_level:req givepokemon_item:req
.byte 0x79
.hword \givepokemon_spezies
.byte \givepokemon_level
.hword \givepokemon_item
.word 0x0
.word 0x0
.byte 0x0
.endm

.macro giveegg giveegg_spezies:req
.byte 0x7A
.hword \giveegg_spezies
.endm

.macro setpokemonmove setpokemonmove_partyslot:req setpokemonmove_moveslot:req setpokemonmove_move:req
.byte 0x7B
.byte \setpokemonmove_partyslot
.byte \setpokemonmove_moveslot
.hword \setpokemonmove_move
.endm

.macro checkattack checkattack_move:req
.byte 0x7C
.hword \checkattack_move
.endm

.macro bufferpokemon bufferpokemon_buffernumber:req bufferpokemon_spezies:req
.byte 0x7D
.byte \bufferpokemon_buffernumber
.hword \bufferpokemon_spezies
.endm

.macro bufferfirstpokemon bufferfirstpokemon_buffernumber:req
.byte 0x7E
.byte \bufferfirstpokemon_buffernumber
.endm

.macro bufferpartypokemon bufferpartypokemon_buffernumber:req bufferpartypokemon_spezies:req
.byte 0x7F
.byte \bufferpartypokemon_buffernumber
.hword \bufferpartypokemon_spezies
.endm

.macro bufferitem bufferitem_buffernumber:req bufferitem_item:req
.byte 0x80
.byte \bufferitem_buffernumber
.hword \bufferitem_item
.endm

.macro bufferattack bufferattack_buffernumber:req bufferattack_attack:req
.byte 0x82
.byte \bufferattack_buffernumber
.hword \bufferattack_attack
.endm

.macro buffernumber buffernumber_buffernumber:req buffernumber_variable:req
.byte 0x83
.byte \buffernumber_buffernumber
.hword \buffernumber_variable
.endm

.macro bufferstd bufferstd_buffernumber:req bufferstd_variable:req
.byte 0x84
.byte \bufferstd_buffernumber
.hword \bufferstd_stdnumber
.endm

.macro bufferstring bufferstring_buffernumber:req bufferstring_string:req
.byte 0x85
.byte \bufferstring_buffernumber
.word \bufferstring_string
.endm

.macro pokemart pokemart_list:req
.byte 0x86
.word \pokemart_list
.endm

.macro pokemart3 pokemart_list_three:req
.byte 0x86
.word \pokemart_list_three
.endm

.macro random random_possiblities:req
.byte 0x8F
.hword \random_possiblities
.endm

.macro givemoney givemoney_quantity:req givemoney_command:req
.byte 0x90
.word \givemoney_quantity
.byte \givemoney_command
.endm

.macro paymoney paymoney_quantity:req paymoney_command:req
.byte 0x91
.word \paymoney_quantity
.byte \paymoney_command
.endm

.macro checkmoney checkmoney_quantity:req checkmoney_command:req
.byte 0x92
.word \checkmoney_quantity
.byte \checkmoney_command
.endm

.macro showmoney showmoney_x:req showmoney_y:req showmoney_value:req
.byte 0x93
.byte \showmoney_x
.byte \showmoney_y
.byte \showmoney_value
.endm

.macro hidemoney hidemoney_x:req hidemoney_y:req
.byte 0x94
.byte \hidemoney_x
.byte \hidemoney_y
.endm

.macro updatemoney updatemoney_x:req updatemoney_y:req updatemoney_value:req
.byte 0x95
.byte \updatemoney_x
.byte \updatemoney_y
.byte \updatemoney_value
.endm

.macro fadescreen fadescreen_effect:req
.byte 0x97
.byte \fadescreen_effect
.endm

.macro fadescreendelay fadescreendelay_effect:req fadescreendelay_delay:req
.byte 0x98
.byte \fadescreendelay_effect
.byte \fadescreendelay_delay
.endm

.macro darken darken_flashsize:req
.byte 0x99
.hword \darken_flashsize
.endm

.macro lighten lighten_flashsize:req
.byte 0x9A
.hword \lighten_flashsize
.endm

.macro doanimation doanimation_animation:req
.byte 0x9C
.hword \doanimation_animation
.endm

.macro setanimation setanimation_animation:req setanimation_variable:req
.byte 0x9D
.byte \setanimation_animation
.hword \setanimation_variable
.endm

.macro checkanimation checkanimation_animation:req
.byte 0x9E
.hword \checkanimation_animation
.endm

.macro sethealingplace shp_bank:req shp_map:req shp_x:req shp_y:req
    setvar HEALING_BANK_MAP_VAR \shp_map << 8 | \shp_bank
    setvar HEALING_X_VAR \shp_x
    setvar HEALING_Y_VAR \shp_y
.endm

.macro checkgender
.byte 0xA0
.endm

.macro cry cry_spezies:req cry_effect:req
.byte 0xA1
.hword \cry_spezies
.hword \cry_effect
.endm

.macro setmaptile setmaptile_x:req setmaptile_y:req setmaptile_tile:req setmaptile_attribut:req
.byte 0xA2
.hword \setmaptile_x
.hword \setmaptile_y
.hword \setmaptile_tile
.hword \setmaptile_attribut
.endm

.macro resetweather
.byte 0xA3
.endm

.macro setweather setweather_weather:req
.byte 0xA4
.hword \setweather_weather
.endm

.macro doweather
.byte 0xA5
.endm

.macro setmapfooter setmapfooter_footer:req
.byte 0xA7
.hword \setmapfooter_footer
.endm

.macro spritelevelup spritelevelup_people:req spritelevelup_bank:req spritelevelup_map:req
.byte 0xA8
.hword \spritelevelup_people
.byte \spritelevelup_bank
.byte \spritelevelup_map
.byte 0x0
.endm

.macro restorespritelevel restorespritelevel_people:req restorespritelevel_bank:req restorespritelevel_map:req
.byte 0xA9
.hword \restorespritelevel_people
.byte \restorespritelevel_bank
.byte \restorespritelevel_map
.endm

.macro createsprite createsprite_sprite:req createsprite_id:req createsprite_x:req createsprite_y:req createsprite_behaviour:req createsprite_facing:req
.byte 0xAA
.byte \createsprite_sprite
.byte \createsprite_id
.hword \createsprite_x
.hword \createsprite_y
.byte \createsprite_behaviour
.byte \createsprite_facing
.endm

.macro spriteface2 spriteface2_people:req spriteface2_facing:req
.byte 0xAB
.hword \spriteface2_people
.byte \spriteface2_facing
.endm

.macro setdooropened setdooropened_x:req setdooropened_y:req
.byte 0xAC
.hword \setdooropened_x
.hword \setdooropened_y
.endm

.macro setdoorclosed setdoorclosed_x:req setdoorclosed_y:req
.byte 0xAD
.hword \setdoorclosed_x
.hword \setdoorclosed_y
.endm

.macro doorchange
.byte 0xAE
.endm

.macro setdooropened2 setdooropened2_x:req setdooropened2_y:req
.byte 0xAF
.hword \setdooropened2_x
.hword \setdooropened2_y
.endm

.macro setdoorclosed2 setdoorclosed2_x:req setdoorclosed2_y:req
.byte 0xB0
.hword \setdoorclosed2_x
.hword \setdoorclosed2_y
.endm

.macro setwildbattle setwildbattle_spezies:req setwildbattle_level:req setwildbattle_item:req
.byte 0xB6
.hword \setwildbattle_spezies
.byte \setwildbattle_level
.hword \setwildbattle_item
.endm

.macro dowildbattle
.byte 0xB7
.endm

.macro savincrementkey attr:req
.byte 0xC3
.byte \attr
.endm

.macro waitcry
.byte 0xC5
.endm

.macro setworldmapflag setworldmapflag_flag:req
.byte 0xD0
.hword \setworldmapflag_flag
.endm

.macro bufferitems bufferitems_buffernumber:req bufferitems_item:req bufferitems_quantity:req
.byte 0xD4
.byte \bufferitems_buffernumber
.hword \bufferitems_item
.hword \bufferitems_quantity
.endm

#endif
