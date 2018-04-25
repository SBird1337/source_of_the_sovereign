//
// Registers
//
 
#ifndef GBA_REGS_H
#define GBA_REGS_H
 
#include "gba_types.h"
 
#define OAM_Data                 ((u16*)0x6010000) // Sprite data (bitmapped)
#define FrontBuffer     ((u16*)0x6000000) // Front Display Memory (the screen in mode 3-5)


#define BG0CNT			*(u16*)0x4000008
#define BG1CNT			*(u16*)0x400000A
#define BG2CNT			*(u16*)0x400000C
#define BG3CNT			*(u16*)0x400000E

#define BG0HOFF			*(u16*)0x4000010
#define BG0VOFF			*(u16*)0x4000012

#define BG1HOFF			*(u16*)0x4000014
#define BG1VOFF			*(u16*)0x4000016

#define BG2HOFF			*(u16*)0x4000018
#define BG2VOFF			*(u16*)0x400001A

#define BG3HOFF			*(u16*)0x400001C
#define BG3VOFF			*(u16*)0x400001E

#define WIN0H			*(u16*)0x4000040
#define WIN1H			*(u16*)0x4000042

#define WIN0V			*(u16*)0x4000044
#define WIN1V			*(u16*)0x4000046

#define WININ			*(u16*)0x4000048
#define WINOUT			*(u16*)0x400004A

#define MOSIAC			*(u16*)0x400001C
#define BLDMOD			*(u16*)0x400001E

#define REG_DISPCNT         *(u16*)0x4000000 // Display control mode
#define REG_VCOUNT         *(volatile u16*)0x4000006  // Vertical control sync
#define vsync() while(REG_VCOUNT != 160);
 
#endif
