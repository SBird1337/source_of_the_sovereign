/****************************************************************************
 * Copyright (C) 2015-2016 by the SotS Team                                 *
 *                                                                          *
 * This file is part of Sovereign of the Skies.                             *
 *                                                                          *
 *   Sovereign of the Skies is free software: you can redistribute it       *
 *   and/or modify it                                                       *
 *   under the terms of the GNU Lesser General Public License as published  *
 *   by the Free Software Foundation, either version 3 of the License, or   *
 *   (at your option) any later version provided you include a copy of the  *
 *   licence and this header.                                               *
 *                                                                          *
 *   Sovereign of the Skies is distributed in the hope that it will be      *
 *   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 *   GNU Lesser General Public License for more details.                    *
 *                                                                          *
 *   You should have received a copy of the GNU Lesser General Public       *
 *   License along with Sovereign of the Skies.                             *
 *   If not, see <http://www.gnu.org/licenses/>.                            *
 ****************************************************************************/

/**
 * @file trainer_battle.c
 * @author Sturmvogel
 * @date 04 Jan 2014
 * @brief trainerbattle script command overhaul
 *
 */

/* === INCLUDE === */

#include <agb_debug.h>
#include <callback.h>
#include <config.h>
#include <debug.h>
#include <game_engine.h>
#include <types.h>


/* === ENGINE EXTERNS === */
extern void battle_init();
extern void battle_80801F0_something();

extern volatile u8 trainerbattle_battle_type;
extern volatile u16 trainerbattle_arg2;
extern volatile char *trainerbattle_message_intro;
extern volatile char *trainerbattle_message_defeat;
extern volatile char *trainerbattle_message_2;
extern volatile char *trainerbattle_message_need_2_poke;
extern volatile char *trainerbattle_message_4;
extern volatile void *trainerbattle_next_scr_cmd;
extern volatile u16 trainerbattle_unknown;

char ***trainer_text_array;
char *str_invalid_text_ref;

/* === PROTOTYPES === */

/* === IMPLEMENTATIONS === */

/**
 * @brief loads a byte
 * @param ptr pointer to load byte from
 * @return byte loaded
 */
u8 load_byte(void *ptr) {
    u8 *to_load = (u8 *)ptr;
    return (u8)(*to_load);
}

/**
 * @brief loads an unaligned hword
 * @param ptr pointer to load from
 * @return half word at pointer
 */
u16 load_hword(void *ptr) {
    u8 *to_load = (u8 *)ptr;
    u16 result = *to_load;
    u16 result2 = *(to_load + 1) << 8;
    return result | result2;
}

/**
 * @brief loads an unaligned word
 * @param ptr pointer to load from
 * @return word read at pointer
 */
u32 load_word(void *ptr) {
    u8 *to_load = (u8 *)ptr;
    u32 result = *to_load;
    u32 result2 = *(to_load + 1);
    u32 result3 = *(to_load + 2);
    u32 result4 = *(to_load + 3);
    return (result) | (result2 << 8) | (result3 << 16) | (result4 << 24);
}

/**
 * @brief modifies the given flag by game difficulty
 * @param flag flag to modify
 * @return flag +1 for medium, flag +2 for hard
 */
u16 tb_modify_flag_id(u16 flag) {
    u16 difficulty = var_get(0x5052);
    u16 new_flag = flag;
    switch (difficulty) {
    case 0:
        break;
    case 1:
        new_flag = flag + 1;
        break;
    case 2:
        new_flag = flag + 2;
        break;
    }
    dprintf("tb_modify_flag_id;; trainer ID: %d, difficulty: %d, new trainer id: %d\n", flag, difficulty, new_flag);
    return new_flag;
}

/**
 * @brief modifies null text pointers according to the trainer text table
 * @param original original pointer, will be modified only if equal to NULL
 * @param index index of the requested text in the trainer table
 * @return
 */
char *tb_modify_text(char *original, u8 index) {
    if (original != NULL)
        return original;
    u8 flag_index = trainerbattle_flag_id; /* NOTE: divide by 3 eventually */
    for (int i = 0; i <= flag_index; ++i) {
        if (trainer_text_array[i] == (char **)0xDEADBEEF) {
            return str_invalid_text_ref;
        }
    }
    for (int i = 0; i <= index; ++i) {
        if (trainer_text_array[flag_index][i] == (char *)0xDEADBEEF) {
            return str_invalid_text_ref;
        }
    }
    return trainer_text_array[flag_index][index];
}

/**
 * @brief read parameters and initialize a trainerbattle instance
 * @param ptr_script pointer to current executed script
 * @return new script pointer
 */
void *tb_configure_by_script(void *ptr_script) {
    battle_init();
    trainerbattle_battle_type = load_byte(ptr_script);
    switch (trainerbattle_battle_type) {
    case 1:
    case 2:
        trainerbattle_battle_type = load_byte(ptr_script);
        ptr_script++;

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_arg2 = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script += 4;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 1);
        ptr_script += 4;

        trainerbattle_message_2 = NULL;
        trainerbattle_message_need_2_poke = NULL;

        trainerbattle_message_4 = tb_modify_text((char *)load_word(ptr_script), 2);
        ptr_script += 4;
        trainerbattle_next_scr_cmd = ptr_script;
        battle_80801F0_something();
        return (void *)(0x081A4EC1) /* some script to execute */;
    case 3:
        trainerbattle_battle_type = load_byte(ptr_script);

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_arg2 = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = NULL;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script++;

        trainerbattle_message_2 = NULL;
        trainerbattle_message_need_2_poke = NULL;

        trainerbattle_message_4 = NULL;

        trainerbattle_next_scr_cmd = ptr_script;
        return (void *)(0x081A4F21); /* some script to execute*/
    case 4:
        trainerbattle_battle_type = load_byte(ptr_script);
        ptr_script++;

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_arg2 = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script += 4;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 1);
        ptr_script += 4;

        trainerbattle_message_2 = NULL;

        trainerbattle_message_need_2_poke = tb_modify_text((char *)load_word(ptr_script), 2);
        ptr_script += 4;

        trainerbattle_message_4 = NULL;
        ptr_script += 4;
        trainerbattle_next_scr_cmd = ptr_script;
        battle_80801F0_something();
        return (void *)(0x081A4EE9); /* some script to execute */

    // this will merge case 5 with default which might not be as intended
    case 6:
    case 8:
        trainerbattle_battle_type = load_byte(ptr_script);
        ptr_script++;

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_arg2 = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script += 4;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 1);
        ptr_script += 4;

        trainerbattle_message_2 = NULL;

        trainerbattle_message_need_2_poke = tb_modify_text((char *)load_word(ptr_script), 2);
        ptr_script += 4;
        trainerbattle_message_4 = tb_modify_text((char *)load_word(ptr_script), 3);
        ptr_script += 4;
        trainerbattle_next_scr_cmd = ptr_script;
        battle_80801F0_something();
        return (void *)(0x081A4EE9); /* some script to execute */

    // this will merge case 7 with default
    case 9:
        /* WIN / LOSE resume script */

        trainerbattle_battle_type = load_byte(ptr_script);
        ptr_script++;

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_unknown = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = NULL;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script += 4;

        trainerbattle_message_2 = tb_modify_text((char *)load_word(ptr_script), 1);
        ptr_script += 4;

        trainerbattle_message_need_2_poke = NULL;

        trainerbattle_message_4 = NULL;

        trainerbattle_next_scr_cmd = ptr_script;

        battle_80801F0_something();

        return (void *)(0x081A4EC1); /* some script to execute */
    default:
        trainerbattle_battle_type = load_byte(ptr_script);
        ptr_script++;

        trainerbattle_flag_id = tb_modify_flag_id(load_hword(ptr_script));
        ptr_script += 2;

        trainerbattle_arg2 = load_hword(ptr_script);
        ptr_script += 2;

        trainerbattle_message_intro = tb_modify_text((char *)load_word(ptr_script), 0);
        ptr_script += 4;

        trainerbattle_message_defeat = tb_modify_text((char *)load_word(ptr_script), 1);
        ptr_script += 4;

        trainerbattle_message_2 = NULL;
        trainerbattle_message_need_2_poke = NULL;
        trainerbattle_message_4 = NULL;
        trainerbattle_next_scr_cmd = ptr_script;
        battle_80801F0_something();
        return (void *)(0x081A4EC1); /* some script to execute */
    }
    /* should never be reached */
    // assert(0);
    // return NULL;
}
