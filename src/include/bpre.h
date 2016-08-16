#ifndef BPRE_H_
#define BPRE_H_

#include "types.h"
#include "sound.h"
#include "fade.h"
#include "lcd.h"
#include <callback.h>
#include <config.h>

u16 *var_access(int index);
u8 flag_check(int flag);
void clear_flag(u16 flag);
u16 random();
void* malloc(int size);
void free(void* address);

//debug
void agbprintf(const char* pBuf, ...);
void agbprint_flush();
void agb_assert(const char *file, int line, const char *expression, u32 stop);

// sound related stuff
extern MPlayTable mplay_table[];
extern SongTable _songtable[];
void m4aSongNumStart(u16 songid);
void MPlayStart_rev01(MusicPlayerArea *ma, SongHeader *so);
void MPlayContinue(MusicPlayerArea *ma);

//graphical stuff

//object related stuff
void objc_exec();
void obj_sync();

//task related stuff
void task_exec();

#endif
