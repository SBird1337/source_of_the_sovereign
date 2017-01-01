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
 * @file objects.h
 * @author Sturmvogel
 * @date 15 dec 2016
 * @brief Helpful operations and structure on object entities.
 * 
 * This header provides a framework for working with the object engine.
 * Methods are used to create, destroy, manipulate and update the object
 * entities.
 */

#ifndef OBJECTS_H_
#define OBJECTS_H_

#include "types.h"

/* === STRUCTURES === */

struct obj_frame {
  u16 data;
  u16 duration;
};

struct obj_rotscale_frame {
  u16 scale_delta_x;
  u16 scale_delta_y;
  u8 rot_delta;
  u8 duration;
  u16 field_6;
};

struct obj_oam_attributes {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 rotscale;
};

struct obj_entity {
  struct obj_oam_attributes final_oam;
  struct obj_frame **animation_table;
  u32 *gfx_table;
  u32 *rotscale_table;
  struct obj_template *template;
  u32 field18;
  u32 *callback;
  u16 x;
  u16 y;
  u16 x2;
  u16 y2;
  u8 x_centre;
  u8 y_centre;
  u8 anim_number;
  u8 anim_frame;
  u8 anim_delay;
  u8 counter;
  u16 private[8];
  u8 bitfield2;
  u8 bitfield;
  u16 anim_data_offset;
  u8 field42;
  u8 field43;
};

extern struct obj_entity* objects;

typedef void (*object_callback)(struct obj_entity*);

struct obj_template {
  u16 tiles_tag;
  u16 pal_tag;
  struct obj_oam_attributes *oam;
  struct obj_frame **animation;
  u32 *graphics;
  struct obj_rotscale_frame **rotscale;
  object_callback callback;
};

struct obj_resource {
  void *data;
  u16 size;
  u16 tag;
};

/* === EXTERN METHODS === */

/**
 * 
 * @param t pointer to obj_template structure which should be instancinated
 * @param x x position
 * @param y y position
 * @param b index to start searching at ( ? )
 * @return id of the newly generated obj_entity structure [in objects array]
 */
extern u8 obj_template_instanciate_forward_search(struct obj_template *t, u16 x, u16 y, u8 b);

/**
 * 
 * @param src obj_resource structure to allocate
 * @return tag of the allocated resource
 */
extern u16 obj_gpu_tile_decompress_alloc_tag_and_upload(struct obj_resource *src);

/**
 * @brief parses and uploads the objects in memory to the object hardware
 */
extern void obj_gpu_sprites_upload();

/**
 * 
 * @param pal palette resource to create
 * @return success ( ? )
 */
extern u8 obj_gpu_pal_alloc_tag_and_apply(struct obj_resource *pal);

/**
 * 
 * @param tag tag of tile resource to free
 */
extern void obj_gpu_tile_free_by_tag(u16 tag);

/**
 * 
 * @param obj obj_entitiy structure to free and delete
 */
extern void obj_delete_and_free_tiles(struct obj_entity *obj);

/**
 * @brief delete all object entities in game
 */
extern void obj_delete_all();

/**
 * @brief execute object callbacks
 */
extern void objc_exec();

/**
 * @brief synchronize object data with object hardware memory
 */
void obj_sync();


#endif
