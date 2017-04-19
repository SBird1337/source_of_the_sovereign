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
 * @file textbox_mugshots.c
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Display little mugshot icons over the textbox
 *
 */

/* === INCLUDES === */
#include <objects.h>
#include <callback.h>
#include <config.h>
#include <lcd.h>
#include <debug.h>
#include <game_engine.h>
#include <memory.h>

/* === PROTOTYPES === */

/**
 * @brief null callback
 * @param self object
 */
void mug_cb_null(struct obj_entity *self);

/**
 * @brief called when tb is opened to create mugshot
 */
void mug_create_on_variable();


/**
 * @brief called when tb is closed to delete mugshot
 */
void mug_delete();

/* === STRUCTURES === */

typedef struct mug_mugshot {
    void *gfx;
    void *pal;
} mug_mugshot;

/* === STATIC GLOBALS === */

extern mug_mugshot *mugshots;

u8 *temp_obj_id1 = (u8*) OBJ_1_TEMP;
u8 *temp_obj_id2 = (u8*) OBJ_2_TEMP;

struct obj_oam_attributes mug_sprite = {0, 0x8000, 0, 0};

struct obj_template mugshot_1_template = {MUGSHOT_1_TAG, MUGSHOT_1_TAG, &mug_sprite, (struct obj_frame **) 0x08231CF0, 0, (struct obj_rotscale_frame **) 0x08231CFC, mug_cb_null};
struct obj_template mugshot_2_template = {MUGSHOT_2_TAG, MUGSHOT_2_TAG, &mug_sprite, (struct obj_frame **) 0x08231CF0, 0, (struct obj_rotscale_frame **) 0x08231CFC, mug_cb_null};



/* === IMPLEMENTATIONS === */

void mug_create_on_variable() {
    u16 *mug1_var = var_access(MUGHSOT_1_TABLE);
    u16 c_mug1_var = *mug1_var;
    u16 mug_id_1 = c_mug1_var & 0x3FFF;
    if (mug_id_1 != 0) {
        bool h_flip = (c_mug1_var & 0x8000) > 0;
        bool v_flip = (c_mug1_var & 0x4000) > 0;
        u16 *mug1_x = var_access(MUGSHOT_1_X);
        u16 *mug1_y = var_access(MUGSHOT_1_Y);

        mug_id_1--;
        struct obj_resource gfx_mugshot_1 = {(mugshots[mug_id_1].gfx), 0x1C00, MUGSHOT_1_TAG};
        struct obj_resource pal_mugshot_1 = {(mugshots[mug_id_1].pal), MUGSHOT_1_TAG};


        obj_gpu_pal_alloc_tag_and_apply(&pal_mugshot_1);
        obj_gpu_tile_decompress_alloc_tag_and_upload(&gfx_mugshot_1);

        *temp_obj_id1 = (u16) obj_template_instanciate_forward_search(&mugshot_1_template, 0, 100, 1);

        if (h_flip)
            objects[*temp_obj_id1].final_oam.attr1 |= 0x1000;
        if (v_flip)
            objects[*temp_obj_id1].final_oam.attr1 |= 0x2000;

        objects[*temp_obj_id1].x = *mug1_x;
        objects[*temp_obj_id1].y = *mug1_y;
    }
    u16 *mug2_var = var_access(MUGHSOT_2_TABLE);
    u16 c_mug2_var = *mug2_var;
    u16 mug_id_2 = c_mug2_var & 0x3FFF;
    if (mug_id_2 != 0) {
        bool h_flip = (c_mug2_var & 0x8000) > 0;
        bool v_flip = (c_mug2_var & 0x4000) > 0;
        u16 *mug2_x = var_access(MUGSHOT_2_X);
        u16 *mug2_y = var_access(MUGSHOT_2_Y);

        mug_id_2--;
        struct obj_resource gfx_mugshot_2 = {(mugshots[mug_id_2].gfx), 0x1C00, MUGSHOT_2_TAG};
        struct obj_resource pal_mugshot_2 = {(mugshots[mug_id_2].pal), MUGSHOT_2_TAG};


        obj_gpu_pal_alloc_tag_and_apply(&pal_mugshot_2);
        obj_gpu_tile_decompress_alloc_tag_and_upload(&gfx_mugshot_2);

        c_mug2_var = *mug2_var;
        *temp_obj_id2 = (u16) obj_template_instanciate_forward_search(&mugshot_2_template, 0, 100, 1);

        if (h_flip)
            objects[*temp_obj_id2].final_oam.attr1 |= 0x1000;
        if (v_flip)
            objects[*temp_obj_id2].final_oam.attr1 |= 0x2000;

        objects[*temp_obj_id2].x = *mug2_x;
        objects[*temp_obj_id2].y = *mug2_y;
    }
}

void mug_delete() {
    //u16 *mug1_var = var_access(MUGHSOT_1_TABLE);
    //u16 *mug2_var = var_access(MUGHSOT_2_TABLE);

    if (*temp_obj_id1 != 0) {
        gpu_pal_free_by_tag(MUGSHOT_1_TAG);
        obj_gpu_tile_free_by_tag(MUGSHOT_1_TAG);

        //*mug1_var = 0;
        //do reset mugshot var ; set it to old value instead

        //*mug1_var = objects[object_id_1].private[0];

        obj_delete_and_free_tiles(&(objects[*temp_obj_id1]));
        *temp_obj_id1 = 0;
    }

    //return;
    if (*temp_obj_id2 != 0) {
        gpu_pal_free_by_tag(MUGSHOT_2_TAG);
        obj_gpu_tile_free_by_tag(MUGSHOT_2_TAG);

        //*mug2_var = 0;
        //do reset mugshot var ; set it to old value instead

        //*mug2_var = objects[object_id_2].private[0];

        obj_delete_and_free_tiles(&(objects[*temp_obj_id2]));
        *temp_obj_id2 = 0;
    }

}

void mug_cb_null(struct obj_entity *self) {
    return;
}
