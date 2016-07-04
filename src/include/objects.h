#ifndef OBJECTS_H_
#define OBJECTS_H_

#include "types.h"

struct object;
typedef struct object object;
typedef void (*object_callback)(object*);

typedef struct frame {
  u16 data;
  u16 duration;
} frame;

typedef struct rotscale_frame {
  u16 scale_delta_x;
  u16 scale_delta_y;
  u8 rot_delta;
  u8 duration;
  u16 field_6;
}  rotscale_frame;

typedef struct sprite {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 rotscale;
} sprite;

typedef struct template {
  u16 tiles_tag;
  u16 pal_tag;
  sprite *oam;
  frame **animation;
  u32 *graphics;
  rotscale_frame **rotscale;
  object_callback callback;
} template;

typedef struct object {
  sprite final_oam;
  frame **animation_table;
  u32 *gfx_table;
  u32 *rotscale_table;
  template *template;
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
} object;

typedef struct resource {
  void *data;
  u16 size;
  u16 tag;
} resource;

u8 template_instanciate_forward_search(struct template *t, u16 x, u16 y, u8 b);
u16 gpu_tile_obj_decompress_alloc_tag_and_upload(resource *src);
#define objects ((object*)0x0202063C)

#endif
