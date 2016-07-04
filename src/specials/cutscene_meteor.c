#include "cutscene_meteor.h"

#define CLOUD_THROTTLE 4
#define PALETTE_BG 0
#define PALETTE_SKY 1
#define PALETTE_CLOUD 2
#define PALETTE_FG 3

#define TAG_METEOR 0x2000

struct meteor_memory{
	void* bg_gfx;
	void* bg_map;

	void* sky_gfx;
	void* sky_map;

	void* cloud_gfx;
	void* cloud_map;

	void* fg_gfx;
	void* fg_map;
	u8 animate_clouds;
	u8 cloud_animation_state;
	u8 meteor_moving;
	u16 delay;
	u16 delay_end;
};

static struct meteor_memory* memory = (struct meteor_memory*)(0x0203FFC0);

static struct sprite sprite_meteor = {0, 0x8000, 0x800, 0x0};

static struct frame meteor_frames [4] = {
	{0, 10},
	{16, 10},
	{32, 10},
	{0xFFFE, 0}
};

static struct frame* meteor_frames_a [1] = {
	meteor_frames
};

static struct template template_meteor = {
	TAG_METEOR,
	TAG_METEOR,
	&sprite_meteor,
	meteor_frames_a,
	0,
	(rotscale_frame **) 0x08231CFC,
	meteor_callback
};

void meteor_callback(object* self)
{
	if(memory->meteor_moving > 0)
	{
		self->x--;
		self->y++;
		if(self->y > 130)
		{
			memory->meteor_moving = 0;
			m4aSongNumStart(0xAB);
		}

	}
}

void play_meteor()
{
	memory->animate_clouds = 0;
	memory->cloud_animation_state = 0;
	memory-> meteor_moving = 0;
	superstate.multi_purpose_state_tracker = 0;
	vblank_handler_set(update_screen);
	set_callback2(cutscene);
}
void cutscene()
{
	if(superstate.multi_purpose_state_tracker == 0)
	{
		fade_screen(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
		superstate.multi_purpose_state_tracker++;
	}
	else if(superstate.multi_purpose_state_tracker == 1)
	{
		if((fade_controller.mix_color & 0x8000) == 0)
		{
			setup_vram();
			fade_screen(0xFFFFFFFF,0,0x10,0,0x0000);
			memory->delay = 60*3;
			memory->delay_end = 90;
			superstate.multi_purpose_state_tracker++;
		}
	}
	else if(superstate.multi_purpose_state_tracker == 2)
	{
		if((fade_controller.mix_color & 0x8000) == 0)
		{
			if(memory->delay == 0)
			{
				//tint screen
				fade_screen(0xE, 28,0,0x6, 0x015C);
				//play sound
				m4aSongNumStart(0x64);
				superstate.multi_purpose_state_tracker++;
			}
			else
				memory->delay--;
		}
	}
	else if (superstate.multi_purpose_state_tracker == 3)
	{
		superstate.multi_purpose_state_tracker++;
	}
	else if(superstate.multi_purpose_state_tracker == 4)
	{
		if((fade_controller.mix_color & 0x8000) == 0)
		{
			memory->meteor_moving = 1;
			superstate.multi_purpose_state_tracker++;
		}
	}
	else if(superstate.multi_purpose_state_tracker == 5)
	{
		if(memory->meteor_moving == 0)
		{
			superstate.multi_purpose_state_tracker++;
		}
	}
	else if(superstate.multi_purpose_state_tracker == 6)
	{
		if(memory->delay_end == 0)
			end_playback();
		else
			memory->delay_end--;
	}
	memory->cloud_animation_state++;
	if(memory->cloud_animation_state >= CLOUD_THROTTLE)
		memory->cloud_animation_state=0;
}

void end_playback()
{
	set_callback2(callback_overworld);
	free(memory->bg_gfx);
	free(memory->bg_map);

	free(memory->fg_gfx);
	free(memory->fg_map);

	free(memory->sky_gfx);
	free(memory->sky_map);

	free(memory->cloud_gfx);
	free(memory->cloud_map);
}

static struct bg_config standard_bg[4] = {
	{0,0,0x19,0,0,0},
	{1,1,0x1A,0,0,1},
	{2,2,0x1B,0,0,2},
	{3,3,0x1C,0,0,3}
};

void setup_scrolling()
{
	lcd_io_set_func(0x14, 0x0);
	lcd_io_set_func(0x16, 0x0);
	lcd_io_set_func(0x18, 0x0);
	lcd_io_set_func(0x1A, 0x0);
	lcd_io_set_func(0x1C, 0x0);
	lcd_io_set_func(0x1E, 0x0);
}

void setup_palettes()
{
	wram_decompress((void*)met_skyPal, palette_unfaded_buffer + PALETTE_SKY*32);
	wram_decompress((void*)met_cloudsPal, palette_unfaded_buffer + PALETTE_CLOUD*32);
	wram_decompress((void*)met_foregroundPal, palette_unfaded_buffer + PALETTE_FG*32);
	wram_decompress((void*)met_backgroundPal, palette_unfaded_buffer + PALETTE_BG*32);
}

void setup_vram()
{
	gpu_tile_bg_drop_all_sets(0);
	gpu_tile_bg_drop_all_sets(1);
	gpu_tile_bg_drop_all_sets(2);
	gpu_tile_bg_drop_all_sets(3);

	bg_vram_setup(0, standard_bg, 4);

	gpu_bg_show(0);
	gpu_bg_show(1);
	gpu_bg_show(2);
	gpu_bg_show(3);

	gpu_sync_bg_visibility_and_mode();

	setup_scrolling();

	//copy tilesets
	memory->bg_gfx = malloc(0x40);
	wram_decompress((void*)met_backgroundTiles, memory->bg_gfx);
	gpu_copy_to_vram_by_bgid(0, memory->bg_gfx, 0x40, 0, 1);

	memory->fg_gfx = malloc(0x1180);
	wram_decompress((void*)met_foregroundTiles, memory->fg_gfx);
	gpu_copy_to_vram_by_bgid(1, memory->fg_gfx, 0x1180, 0, 1);

	memory->cloud_gfx = malloc(0x5E0);
	wram_decompress((void*)met_cloudsTiles, memory->cloud_gfx);
	gpu_copy_to_vram_by_bgid(2, memory->cloud_gfx, 0x5E0,0,1);

	memory->sky_gfx = malloc(0x7A0);
	wram_decompress((void*)met_skyTiles, memory->sky_gfx);
	gpu_copy_to_vram_by_bgid(3, memory->sky_gfx,0x7A0,0,1);




	//copy tilemaps
	memory->bg_map = malloc(0x500);
	wram_decompress((void*)met_backgroundMap, memory->bg_map);
	gpu_copy_to_vram_by_bgid(0, memory->bg_map,0x500,0,2);

	memory->fg_map = malloc(0x500);
	wram_decompress((void*)met_foregroundMap, memory->fg_map);
	gpu_copy_to_vram_by_bgid(1, memory->fg_map,0x500,0,2);

	memory->cloud_map = malloc(0x500);
	wram_decompress((void*)met_cloudsMap, memory->cloud_map);
	gpu_copy_to_vram_by_bgid(2, memory->cloud_map,0x500,0,2);

	memory->sky_map = malloc(0x500);
	wram_decompress((void*)met_skyMap, memory->sky_map);
	gpu_copy_to_vram_by_bgid(3, memory->sky_map,0x500,0,2);


	//copy palettes
	//pal_decompress_slice_to_faded_and_unfaded((void*)met_skyPal, 16, 32);
	//pal_decompress_slice_to_faded_and_unfaded((void*)met_foregroundPal, 48, 32);
	//pal_decompress_slice_to_faded_and_unfaded((void*)met_cloudsPal, 32, 32);
	setup_palettes();

	//setup oam
	obj_delete_all();
	resource gfx_meteor = {(void*)met_meteorTiles, 0x1C00, TAG_METEOR};
	resource pal_meteor = {(void*)met_meteorPal, TAG_METEOR};
	gpu_pal_obj_alloc_tag_and_apply(&pal_meteor);
	gpu_tile_obj_decompress_alloc_tag_and_upload(&gfx_meteor);

	u8 meteor_id = template_instanciate_forward_search(&template_meteor, 0, 100, 1);
	objects[meteor_id].x = 200;
	objects[meteor_id].y = 0;

	memory->animate_clouds = 1;
}

void update_screen()
{
	fade_update();
	task_exec();
	objc_exec();
	obj_sync();
	gpu_pal_upload();
	gpu_sprites_upload();
	if(memory->cloud_animation_state == 0 && memory->animate_clouds != 0)
	{
		u16 sky_h = lcd_io_get(0x18);
		lcd_io_set_func(0x18, sky_h + 1);
	}
}
