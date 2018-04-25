//
// Including all the macros into gba.h
//
 
#ifndef GBA_H
#define GBA_H
 
#if	defined	( __thumb__ )
#define	SystemCall(Number)	 __asm ("SWI	  "#Number"\n" :::  "r0", "r1", "r2", "r3")
#else
#define	SystemCall(Number)	 __asm ("SWI	  "#Number"	<< 16\n" :::"r0", "r1", "r2", "r3")
#endif

#include "gba_types.h"
#include "gba_regs.h"
#include "gba_keys.h"
#include "gba_video.h"
#include "gba_sprites.h"
#include "gba_bg.h"


// e.g to include all header files, just write #include "gba.h" in the top of your program
 
#endif
