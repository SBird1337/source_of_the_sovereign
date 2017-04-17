#include <config.h>
#include <applymovements.h>

@@ Compare operands
.equ <, 0x0
.equ ==, 0x1
.equ >, 0x2
.equ <=, 0x3
.equ >=, 0x4
.equ !=, 0x5

@@ Flag operands
.equ !, 0x0
.equ =, 0x1


@@@@@@@@@@@@@@@@@ Macro

@@ Costum commands

.macro msgbox msgbox_textpointer msgbox_callstd
loadpointer 0x0 \msgbox_textpointer
callstd \msgbox_callstd
.endm

.marco giveitem giveitem_item giveitem_quantity giveitem_messagetyp
setvarifnotzero 0x8000 \giveitem_item
setvarifnotzero 0x8001 \giveitem_quantity
callstd \giveitem_messagetyp
.endm

.marco giveitem2 giveitem2_item giveitem2_quantity giveitem2_song
setvarifnotzero 0x8000 \giveitem2_item
setvarifnotzero 0x8001 \giveitem2_quantity
setvarifnotzero 0x8002 \giveitem2_song
callstd 0x9
.endm

.marco wildbattle wildbattle_spezies wildbattle_level wildbattle_item
setwildbattle \wildbattle_spezies \wildbattle_level \wildbattle_item
dowildbattle
.endm

.marco wildbattle2 wildbattle2_spezies wildbattle2_level wildbattle2_item wildbattle2_battlestyle
setwildbattle \wildbattle2_spezies \wildbattle2_level \wildbattle2_item
special 0x137
waitstate
.endm

.marco msgmugr msgmugr_textpointer msgmugr_callstd msgmugr_sprite
setvar MUGHSOT_1_TABLE \msgmugr_sprite
setvar MUGSHOT_1_X 0xD0
setvar MUGSHOT_1_Y 0x60
msgbox \msgmugr_textpointer \msgmugr_callstd
setvar MUGHSOT_1_TABLE 0x0
.endm

.marco msgmugl msgmugl_textpointer msgmugl_callstd msgmugl_sprite
setvar MUGHSOT_1_TABLE \msgmugl_sprite
setvar MUGSHOT_1_X 0x16
setvar MUGSHOT_1_Y 0x60
msgbox \msgmugl_textpointer \msgmugl_callstd
setvar MUGHSOT_1_TABLE 0x0
.endm

.marco transparenzon
clearflag FLAG_ACTIVATE
.endm

.marco transparenzoff
setflag FLAG_ACTIVATE
.endm

.marco battlescreen battlescreen_grass battlescreen_sea
setvar NORMAL_VAR \battlescreen_grass
setvar SEA_VAR \battlescreen_sea
.endm

.marco cameramove cameramove_xpos cameramove_ypos
setvar CAMERA_VAR_X \cameramove_xpos
setvar CAMERA_VAR_Y \cameramove_ypos
setvar CALLASM_VAR 0x1
special 0x68
.endm

.marco walkingscript \walkingscript_value
setvar WALK_SCRIPT_VAR \walkingscript_value
.endm

.marco walkingscripton
setflag FLAG_WALK_SCRIPT
.endm

.marco walkingscriptoff
clearflag FLAG_WALK_SCRIPT
.endm

.marco writemusikto1 writemusikto1_from writemusikto1_to
setflag FLAG_ENABLE_MUSIC_OVERRIDES
setvar VAR_FROM_1 \writemusikto1_from
setvar VAR_TO_1 \writemusikto1_to
.endm

.marco writemusikto2 writemusikto2_from writemusikto2_to
setflag FLAG_ENABLE_MUSIC_OVERRIDES
setvar VAR_FROM_2 \writemusikto2_from
setvar VAR_TO_2 \writemusikto2_to
.endm

.marco writemusikto3 writemusikto3_from writemusikto3_to
setflag FLAG_ENABLE_MUSIC_OVERRIDES
setvar VAR_FROM_3 \writemusikto3_from
setvar VAR_TO_3 \writemusikto3_to
.endm

.marco writemusikwithmapmusik \writemusikwithmapmusik_mapmusik
setflag FLAG_ENABLE_MUSIC_OVERRIDES
setvar VAR_FROM_1 \writemusikwithmapmusik_mapmusik
setvar VAR_TO_1 MUS_SKIP_PLAY


.marco writemusikoff
clearflag FLAG_ENABLE_MUSIC_OVERRIDES
.endm





@@ Index commands

.macro nope
.byte 0x0
.endm

.macro nop
.byte 0x1
.endm

.macro end
.byte 0x2
.endm

.macro return
.byte 0x3
.endm

.macro call call_address
.byte 0x4
.word \call_address
.endm

.macro goto goto_address
.byte 0x5
.word \goto_address
.endm

.macro if1 if1_value if1_pointer
.byte 0x6
.byte \if1_value
.word \if1_address
.endm

.macro if2 if2_value if2_pointer
.byte 0x7
.byte \if2_value
.word \if2_address
.endm

.macro callstd callstd_call
.byte 0x9
.byte \callstd_call
.endm

.macro killscript
.byte 0xD
.endm

.macro loadpointer loadpointer_bank loadpointer_pointer
.byte 0xF
.byte \loadpointer_bank
.word \loadpointer_pointer
.endm

.macro writebytetooffset writebytetooffset_bank writebytetooffset_location
.byte 0x11
.byte \writebytetooffset_bank
.word \writebytetooffset_location
.endm

.macro setvar setvar_variable setvar_value
.byte 0x16
.hword \setvar_variable
.hword \setvar_value
.endm

.macro addvar addvar_variable addvar_value
.byte 0x17
.hword \addvar_variable
.hword \addvar_value
.endm

.macro subvar subvar_variable subvar_value
.byte 0x18
.hword \subvar_variable
.hword \subvar_value
.endm

.macro copyvar copyvar_variableADestin copyvar_variableBSource
.byte 0x19
.hword copyvar_variableADestin
.hword copyvar_variableBSource
.endm

.macro setvarifnotzero setvarifnotzero_variableADestin setvarifnotzero_variableBSource
.byte 0x1A
.hword setvarifnotzero_variableADestin
.hword setvarifnotzero_variableBSource
.endm

.macro compare compare_variable compare_value
.byte 0x21
.hword \compare_variable
.hword \compare_value
.endm

.macro comparevars comparevars_variableA comparevars_variableB
.byte 0x22
.hword \comparevars_variableA
.hword \comparevars_variableB
.endm

.marco callasm callasm_address
.byte 0x23
.word \callasm_address
.endm

.marco special special_number
.byte 0x25
.hword \special_number
.endm

.marco special2 special2_variable special2_number
.byte 0x26
.hword \special2_variable
.hword \special2_number
.endm

.macro waitstate
.byte 0x27
.endm

.macro pause pause_delay
.byte 0x28
.hword \pause_delay
.endm

.macro setflag setflag_flag
.byte 0x29
.hword \setflag_flag
.endm

.macro clearflag clearflag_flag
.byte 0x2A
.hword \clearflag_flag
.endm

.macro checkflag checkflag_flag
.byte 0x2B
.hword \checkflag_flag
.endm

.macro resetvars
.byte 0x2E
.endm

.macro sound sound_song
.byte 0x2F
.hword \sound_song
.endm

.macro checksound
.byte 0x30
.endm

.macro fanfare fanfare_song
.byte 0x31
.hword \fanfare_song
.endm

.macro waitfanfare
.byte 0x32
.endm

.macro playsong playsong_song playsong_value
.byte 0x33
.hword \playsong_song
.byte \playsong_value
.endm

.macro playsong2 playsong2_song
.byte 0x34
.hword \playsong2_song
.endm

.macro fadedefault
.byte 0x35
.endm

.macro fadesong fadesong_song
.byte 0x36
.hword \fadesong_song
.endm

.macro fadeout fadeout_volume
.byte 0x37
.byte \fadeout_volume


.macro fadein fadein_volume
.byte 0x38
.byte \fadein_volume
.endm

.marco warp warp_bank warp_map warp_exit warp_x warp_y
.byte 0x39
.byte \warp_bank
.byte \warp_map
.byte \warp_exit
.hword \warp_x
.hword \warp_y
.endm

.marco warpmuted warpmuted_bank warpmuted_map warpmuted_exit warpmuted_x warpmuted_y
.byte 0x3A
.byte \warpmuted_bank
.byte \warpmuted_map
.byte \warpmuted_exit
.hword \warpmuted_x
.hword \warpmuted_y
.endm

.marco warpwalk warpwalk_bank warpwalk_map warpwalk_exit warpwalk_x warpwalk_y
.byte 0x3B
.byte \warpwalk_bank
.byte \warpwalk_map
.byte \warpwalk_exit
.hword \warpwalk_x
.hword \warpwalk_y
.endm

.marco warphole warphole_bank warphole_map
.byte 0x3C
.byte \warphole_bank
.byte \warphole_map
.endm

.marco warpteleport warpteleport_bank warpteleport_map warpteleport_exit warpteleport_x warpteleport_y
.byte 0x3D
.byte \warpteleport_bank
.byte \warpteleport_map
.byte \warpteleport_exit
.hword \warpteleport_x
.hword \warpteleport_y
.endm

.marco setwarpplace setwarpplace_bank setwarpplace_map setwarpplace_exit setwarpplace_x setwarpplace_y
.byte 0x3F
.byte \setwarpplace_bank
.byte \setwarpplace_map
.byte \setwarpplace_exit
.hword \setwarpplace_x
.hword \setwarpplace_y
.endm

.marco getplayerpos getplayerpos_variableX getplayerpos_variableY
.byte 0x42
.hword \getplayerpos_variableX
.hword \getplayerpos_variableY
.endm

.macro countpokemon
.byte 0x43
.endm

.marco additem additem_item additem_quantity
.byte 0x44
.hword \additem_item
.hword \additem_quantity
.endm

.marco removeitem removeitem_item removeitem_quantity
.byte 0x45
.hword \removeitem_item
.hword \removeitem_quantity
.endm

.marco checkitemroom checkitemroom_item checkitemroom_quantity
.byte 0x46
.hword \checkitemroom_item
.hword \checkitemroom_quantity
.endm

.marco checkitem checkitem_item checkitem_quantity
.byte 0x47
.hword \checkitem_item
.hword \checkitem_quantity
.endm

.marco checkitemtype checkitemtype_item
.byte 0x48
.hword \checkitemtype_item
.endm

.marco addpcitem addpcitem_item addpcitem_quantity
.byte 0x49
.hword \addpcitem_item
.hword \addpcitem_quantity
.endm

.marco checkpcitem checkpcitem_item checkpcitem_quantity
.byte 0x4A
.hword \checkpcitem_item
.hword \checkpcitem_quantity
.endm

.marco applymovement applymovement_people applymovement_movedata
.byte 0x4F
.hword \applymovement_people
.word \applymovement_movedata
.endm

.marco applymovementpos applymovementpos_people applymovementpos_movedata applymovementpos_x applymovementpos_y
.byte 0x50
.hword \applymovementpos_people
.word \applymovementpos_movedata
.byte \applymovementpos_x
.byte \applymovementpos_y
.endm

.marco waitmovement waitmovement_people
.byte 0x51
.hword \waitmovement_people
.endm

.marco waitmovementpos waitmovementpos_people waitmovementpos_x waitmovementpos_y
.byte 0x52
.hword \waitmovementpos_people
.byte \waitmovementpos_x
.byte \waitmovementpos_y
.endm

.marco hidesprite hidesprite_people
.byte 0x53
.hword \hidesprite_people
.endm

.marco hidespritepos hidesprite_people hidespritepos_x hidespritepos_y
.byte 0x54
.hword \hidespritepos_people
.byte \hidespritepos_x
.byte \hidespritepos_y
.endm

.marco showsprite showsprite_people
.byte 0x55
.hword \showsprite_people
.endm

.marco showspritepos showspritepos_people showspritepos_x showspritepos_y
.byte 0x56
.hword \showspritepos_people
.byte \showspritepos_x
.byte \showspritepos_y
.endm

.marco movesprite movesprite_people movesprite_x movesprite_y
.byte 0x57
.hword \movesprite_people
.hword \movesprite_x
.hword \movesprite_y
.endm

.marco spritevisible spritevisible_people spritevisible_bank movesprite_map
.byte 0x58
.hword \spritevisible_people
.byte \spritevisible_bank
.byte \spritevisible_map
.endm

.marco spriteinvisible spriteinvisible_people spriteinvisible_bank spriteinvisible_map
.byte 0x59
.hword \spriteinvisible_people
.byte \spriteinvisible_bank
.byte \spriteinvisible_map
.endm

.macro faceplayer
.byte 0x5A
.endm

.marco spriteface spriteface_people spriteface_facing
.byte 0x5B
.hword \spriteface_people
.byte \spriteface_facing
.endm

.marco trainerbattle trainerbattle_kind trainerbattle_id trainerbattle_value trainerbattle_before trainerbattle_after trainerbattle_later
.byte 0x5C
.byte \trainerbattle_kind
.hword \trainerbattle_id
.hword \trainerbattle_value
.word \trainerbattle_before
.word \trainerbattle_after
.word \trainerbattle_later
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

.macro checktrainerflag checktrainerflag_flag
.byte 0x60
.hword \checktrainerflag_flag
.endm

.macro settrainerflag settrainerflag_flag
.byte 0x61
.hword \settrainerflag_flag
.endm

.macro cleartrainerflag cleartrainerflag_flag
.byte 0x62
.hword \cleartrainerflag_flag
.endm

.marco movesprite2 movesprite2_people movesprite2_x movesprite2_y
.byte 0x63
.hword \movesprite2_people
.hword \movesprite2_x
.hword \movesprite2_y
.endm

.marco moveoffscreen moveoffscreen_people
.byte 0x64
.hword \moveoffscreen_people
.endm

.marco spritebehave spritebehave_people spritebehave_facing
.byte 0x65
.hword \spritebehave_people
.byte \spritebehave_behaviour
.endm

.macro waitmsg
.byte 0x66
.endm

.macro preparemsg preparemsg_text
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

.macro yesnobox yesnobox_x yesnobox_y
.byte 0x6E
.byte \yesnobox_x
.byte \yesnobox_y
.endm

.macro multichoice multichoice_x multichoice_y multichoice_choiceList multichoice_determines
.byte 0x6F
.byte \multichoice_x
.byte \multichoice_y
.byte \multichoice_choiceList
.byte \multichoice_determines
.endm

.macro multichoice2 multichoice2_x multichoice2_y multichoice2_choiceList multichoice2_defaultchoice multichoice2_determines
.byte 0x70
.byte \multichoice2_x
.byte \multichoice2_y
.byte \multichoice2_choiceList
.byte \multichoice2_defaultchoice
.byte \multichoice2_determines
.endm

.macro multichoice3 multichoice3_x multichoice3_y multichoice3_choiceList multichoice3_numberofchoices multichoice3_determines
.byte 0x71
.byte \multichoice3_x
.byte \multichoice3_y
.byte \multichoice3_choiceList
.byte \multichoice3_numberofchoices
.byte \multichoice3_determines
.endm

.marco showpokepic showpokepic_spezies showpokepic_x showpokepic_y
.byte 0x75
.hword \showpokepic_spezies
.byte \showpokepic_x
.byte \showpokepic_y
.endm

.macro hidepokepic
.byte 0x76
.endm

.macro braile braile_data
.byte 0x78
.word \braile_data
.endm

.macro givepokemon givepokemon_spezies givepokemon_level givepokemon_item
.byte 0x79
.hword \givepokemon_spezies
.byte \givepokemon_level
.hword \givepokemon_item
.word 0x0
.word 0x0
.byte 0x0
.endm

.macro giveegg giveegg_spezies
.byte 0x7A
.hword \giveegg_spezies
.endm

.macro setpokemonmove setpokemonmove_partyslot setpokemonmove_moveslot setpokemonmove_move
.byte 0x7B
.byte \setpokemonmove_partyslot
.byte \setpokemonmove_moveslot
.hword \setpokemonmove_move
.endm

.macro checkattack checkattack_move
.byte 0x7C
.hword \checkattack_move
.endm

.macro bufferpokemon bufferpokemon_buffernumber bufferpokemon_spezies
.byte 0x7D
.byte \bufferpokemon_buffernumber
.hword \bufferpokemon_spezies
.endm

.macro bufferfirstpokemon bufferfirstpokemon_buffernumber
.byte 0x7E
.byte \bufferfirstpokemon_buffernumber
.endm

.macro bufferpartypokemon bufferpartypokemon_buffernumber bufferpartypokemon_spezies
.byte 0x7F
.byte \bufferpartypokemon_buffernumber
.hword \bufferpartypokemon_spezies
.endm

.macro bufferitem bufferitem_buffernumber bufferitem_item
.byte 0x80
.byte \bufferitem_buffernumber
.hword \bufferitem_item
.endm

.macro bufferattack bufferattack_buffernumber bufferattack_attack
.byte 0x82
.byte \bufferattack_buffernumber
.hword \bufferattack_attack
.endm

.macro buffernumber buffernumber_buffernumber buffernumber_variable
.byte 0x83
.byte \buffernumber_buffernumber
.hword \buffernumber_variable
.endm

.macro bufferstd bufferstd_buffernumber bufferstd_variable
.byte 0x84
.byte \bufferstd_buffernumber
.hword \bufferstd_stdnumber
.endm

.macro bufferstring bufferstring_buffernumber bufferstring_string
.byte 0x85
.byte \bufferstring_buffernumber
.hword \bufferstring_string
.endm

.macro pokemart pokemart_list
.byte 0x86
.word \pokemart_list
.endm

.macro random random_possiblities
.byte 0x8F
.hword \random_possiblities
.endm

.macro givemoney givemoney_quantity givemoney_command
.byte 0x90
.word \givemoney_quantity
.byte \givemoney_command
.endm

.macro paymoney paymoney_quantity paymoney_command
.byte 0x91
.word \paymoney_quantity
.byte \paymoney_command
.endm

.macro checkmoney checkmoney_quantity paymoney_command
.byte 0x92
.word \checkmoney_quantity
.byte \checkmoney_command
.endm

.marco showmoney showmoney_x showmoney_y showmoney_value
.byte 0x93
.byte \showmoney_x
.byte \showmoney_y
.byte \showmoney_value
.endm

.marco hidemoney hidemoney_x hidemoney_y
.byte 0x94
.byte \hidemoney_x
.byte \hidemoney_y
.endm

.marco updatemoney updatemoney_x updatemoney_y updatemoney_value
.byte 0x95
.byte \updatemoney_x
.byte \updatemoney_y
.byte \updatemoney_value
.endm

.marco fadescreen fadescreen_effect
.byte 0x97
.byte \fadescreen_effect
.endm

.marco fadescreendelay fadescreendelay_effect fadescreendelay_delay
.byte 0x98
.byte \fadescreendelay_effect
.byte \fadescreendelay_delay
.endm

.marco darken darken_flashsize
.byte 0x99
.hword \darken_flashsize
.endm

.marco lighten lighten_flashsize
.byte 0x9A
.hword \lighten_flashsize
.endm

.marco doanimation doanimation_animation
.byte 0x9C
.hword \doanimation_animation
.endm

.marco setanimation setanimation_animation setanimation_variable
.byte 0x9D
.byte \setanimation_animation
.hword \setanimation_variable
.endm

.marco checkanimation checkanimation_animation
.byte 0x9E
.hword \checkanimation_animation
.endm

.marco sethealingplace sethealingplace_flightspot
.byte 0x9F
.hword \sethealingplace_flightspot
.endm

.macro checkgender
.byte 0xA0
.endm

.marco cry cry_spezies cry_effect
.byte 0xA1
.hword \cry_spezies
.hword \cry_effect

.marco setmaptile setmaptile_x setmaptile_y setmaptile_tile setmaptile_attribut
.byte 0xA2
.hword \setmaptile_x
.hword \setmaptile_y
.hword \setmaptile_tile
.hword \setmaptile_attribut
.endm

.macro resetweather
.byte 0xA3
.endm

.macro setweather setweather_weather
.byte 0xA4
.hword \setweather_weather
.endm

.macro doweather
.byte 0xA5
.endm

.macro setmapfooter setmapfooter_footer
.byte 0xA7
.hword \setmapfooter_footer
.endm

.marco spritelevelup spritelevelup_people spritelevelup_bank spritelevelup_map
.byte 0xA8
.hword \spritelevelup_people
.byte \spritelevelup_bank
.byte \spritelevelup_map
.byte 0x0
.endm

.marco restorespritelevel restorespritelevel_people restorespritelevel_bank restorespritelevel_map
.byte 0xA9
.hword \restorespritelevel_people
.byte \restorespritelevel_bank
.byte \restorespritelevel_map
.endm

.marco createsprite createsprite_sprite createsprite_id createsprite_x createsprite_y createsprite_behaviour createsprite_facing
.byte 0xAA
.byte \createsprite_sprite
.byte \createsprite_id
.hword \createsprite_x
.hword \createsprite_y
.byte \createsprite_behaviour
.byte \createsprite_facing
.endm

.marco spriteface2 spriteface2_people spriteface2_facing
.byte 0xAB
.hword \spriteface2_people
.byte \spriteface2_facing
.endm

.marco setdooropened setdooropened_x setdooropened_y
.byte 0xAC
.hword \setdooropened_x
.hword \setdooropened_y
.endm

.marco setdoorclosed setdoorclosed_x setdoorclosed_y
.byte 0xAD
.hword \setdoorclosed_x
.hword \setdoorclosed_y
.endm

.macro doorchange
.byte 0xAE
.endm

.marco setdooropened2 setdooropened2_x setdooropened2_y
.byte 0xAF
.hword \setdooropened2_x
.hword \setdooropened2_y
.endm

.marco setdoorclosed2 setdoorclosed2_x setdoorclosed2_y
.byte 0xB0
.hword \setdoorclosed2_x
.hword \setdoorclosed2_y
.endm

.marco setwildbattle setwildbattle_spezies setwildbattle_level setwildbattle_item
.byte 0xB6
.hword \setwildbattle_spezies
.byte \setwildbattle_level
.hword \setwildbattle_item
.endm

.macro dowildbattle
.byte 0xB7
.endm

.macro waitcry
.byte 0xC5
.endm

.marco setworldmapflag setworldmapflag_flag
.byte 0xD0
.hword \setworldmapflag_flag
.endm

.macro bufferitems bufferitems_buffernumber bufferitems_item bufferitems_quantity
.byte 0xD4
.byte \bufferitems_buffernumber
.hword \bufferitems_item
.hword \bufferitems_quantity
.endm