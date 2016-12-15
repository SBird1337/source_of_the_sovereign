#include <objects.h>
#include <callback.h>
#include <config.h>
#include <lcd.h>
typedef struct mugshot {
	void *gfx;
	void *pal;
} mugshot;

//extern mugshot* mugshots;
mugshot *mugshots = (mugshot (*) ) 0x097007E0;
u8 *temp_obj_id1 = (u8*) OBJ_1_TEMP;
u8 *temp_obj_id2 = (u8*) OBJ_2_TEMP;
void* memset(void* ptr, int value, u32 num);

u16* var_access(u16 num);

struct obj_oam_attributes mug_sprite = {0, 0x8000, 0, 0};

void null_callback(struct obj_entity *self);

struct obj_template mugshot_1_template = {MUGSHOT_1_TAG, MUGSHOT_1_TAG, &mug_sprite, (struct obj_frame **)0x08231CF0, 0, (struct obj_rotscale_frame **)0x08231CFC, null_callback};
struct obj_template mugshot_2_template = {MUGSHOT_2_TAG, MUGSHOT_2_TAG, &mug_sprite, (struct obj_frame **)0x08231CF0, 0, (struct obj_rotscale_frame **)0x08231CFC, null_callback};

void create_mugshot_on_variable()
{
	u16 *mug1_var = var_access(MUGHSOT_1_TABLE);
	u16 c_mug1_var = *mug1_var;
	u16 mug_id_1 = c_mug1_var & 0x3FFF;
	if(mug_id_1 != 0)
	{
		bool h_flip = (c_mug1_var & 0x8000) > 0;
		bool v_flip = (c_mug1_var & 0x4000) > 0;
		u16 *mug1_x = var_access(MUGSHOT_1_X);
		u16 *mug1_y = var_access(MUGSHOT_1_Y);

		mug_id_1--;
		struct obj_resource gfx_mugshot_1 = {(mugshots[mug_id_1].gfx), 0x1C00, MUGSHOT_1_TAG};
		struct obj_resource pal_mugshot_1 = {(mugshots[mug_id_1].pal), MUGSHOT_1_TAG};


		obj_gpu_pal_alloc_tag_and_apply(&pal_mugshot_1);
		obj_gpu_tile_decompress_alloc_tag_and_upload(&gfx_mugshot_1);

		*temp_obj_id1 = (u16)obj_template_instanciate_forward_search(&mugshot_1_template, 0, 100, 1);

		if(h_flip)
			superstate.sprites[*temp_obj_id1].final_oam.attr1 |= 0x1000;
		if(v_flip)
			superstate.sprites[*temp_obj_id1].final_oam.attr1 |= 0x2000;

		superstate.sprites[*temp_obj_id1].x = *mug1_x;
		superstate.sprites[*temp_obj_id1].y = *mug1_y;
	}
	//return;
	u16 *mug2_var = var_access(MUGHSOT_2_TABLE);
	u16 c_mug2_var = *mug2_var;
	u16 mug_id_2 = c_mug2_var & 0x3FFF;
	if(mug_id_2 != 0)
	{
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
		*temp_obj_id2 = (u16)obj_template_instanciate_forward_search(&mugshot_2_template, 0, 100, 1);

		if(h_flip)
			superstate.sprites[*temp_obj_id2].final_oam.attr1 |= 0x1000;
		if(v_flip)
			superstate.sprites[*temp_obj_id2].final_oam.attr1 |= 0x2000;

		superstate.sprites[*temp_obj_id2].x = *mug2_x;
		superstate.sprites[*temp_obj_id2].y = *mug2_y;
	}
}

void delete_mugshot()
{
	u16 *mug1_var = var_access(MUGHSOT_1_TABLE);
	u16 *mug2_var = var_access(MUGHSOT_2_TABLE);

	if(*temp_obj_id1 != 0)
	{
		gpu_pal_free_by_tag(MUGSHOT_1_TAG);
		obj_gpu_tile_free_by_tag(MUGSHOT_1_TAG);

		//*mug1_var = 0;
		//do reset mugshot var ; set it to old value instead

		//*mug1_var = objects[object_id_1].private[0];

		obj_delete_and_free_tiles(&(superstate.sprites[*temp_obj_id1]));
		*temp_obj_id1 = 0;
	}

	//return;
	if(*temp_obj_id2 != 0)
	{
		gpu_pal_free_by_tag(MUGSHOT_2_TAG);
		obj_gpu_tile_free_by_tag(MUGSHOT_2_TAG);

		//*mug2_var = 0;
		//do reset mugshot var ; set it to old value instead

		//*mug2_var = objects[object_id_2].private[0];

		obj_delete_and_free_tiles(&(superstate.sprites[*temp_obj_id2]));
		*temp_obj_id2 = 0;
	}

}

void null_callback(struct obj_entity *self)
{
	//null_callback
}
