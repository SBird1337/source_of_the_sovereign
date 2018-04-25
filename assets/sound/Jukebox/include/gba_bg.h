#ifndef GBA_BG_H
#define GBA_BG_H
 
 
///BGCNT defines ///
#define BG_MOSAIC_ENABLE                   0x40
#define BG_COLOR_256                              0x80
#define BG_COLOR_16                                0x0
 
#define CharBaseBlock(n)                   (((n)*0x4000)+0x6000000)
#define ScreenBaseBlock(n)                (((n)*0x800)+0x6000000)
#define Pallet(n)			(((n)*2)+0x5000000)
 
#define CHAR_SHIFT                                   2
#define SCREEN_SHIFT                               8
#define TEXTBG_SIZE_256x256                  0x0
#define TEXTBG_SIZE_256x512                  0x8000
#define TEXTBG_SIZE_512x256                  0x4000
#define TEXTBG_SIZE_512x512                  0xC000
 
#define ROTBG_SIZE_128x128                    0x0
#define ROTBG_SIZE_256x256                    0x4000
#define ROTBG_SIZE_512x512                    0x8000
#define ROTBG_SIZE_1024x1024                0xC000
 
#define WRAPAROUND                   0x1
 
#endif
