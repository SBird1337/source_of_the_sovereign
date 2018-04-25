//
// Variable types
//
 
#ifndef GBA_TYPES_H
#define GBA_TYPES_H
 
typedef unsigned char    u8;
typedef unsigned short   u16;
typedef unsigned long    u32;
 
typedef signed char      s8;
typedef signed short     s16;
typedef signed long      s32;
 
#define RGB(r,g,b)   ((u16)(r | (g<<5) | (b<<10)))
 
#endif
