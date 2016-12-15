#ifndef BPRE_H_
#define BPRE_H_

#include "types.h"
#include "sound.h"
#include "fade.h"
#include "lcd.h"
#include <callback.h>
#include <config.h>
#include <pkmn_attributes.h>
#include <battle_structs.h>

u32 __aeabi_uidivmod(u32 a, u32 b);
u16 *var_access(int index);
u8 flag_check(int flag);
void clear_flag(u16 flag);
u16 random();
void* malloc(int size);
void free(void* address);
void* memcpy (void * destination, const void* source, size_t num);
void* memset (void* dst, int value, size_t size);

//debug
/*void agbprintf(const char* pBuf, ...);
void agbprint_flush();
void agb_assert(const char *file, int line, const char *expression, u32 stop);*/

// sound related stuff


//graphical stuff

//object related stuff


//task related stuff


//attribute setter and getter
u8 get_attributes(struct pokemon* poke_address, u8 request, void* destination);
void set_attributes(struct pokemon* poke_address, u8 request, void* new_value);

#endif
