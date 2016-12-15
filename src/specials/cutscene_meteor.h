#ifndef CUTSCENE_METEOR_H_
#define CUTSCENE_METEOR_H_

#include "../assets/meteor/met_background.h"
#include "../assets/meteor/met_foreground.h"
#include "../assets/meteor/met_sky.h"
#include "../assets/meteor/met_meteor.h"
#include "../assets/meteor/met_clouds.h"
#include <bpre.h>

void play_meteor();
void setup_vram();
void cutscene();
void update_screen();
void meteor_callback(struct obj_entity* self);
void end_playback();

#endif
