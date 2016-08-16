#ifndef TYPES_H_
#define TYPES_H_

typedef     unsigned char           u8;
typedef     unsigned short int      u16;
typedef     unsigned int            u32;
typedef     unsigned long long int  u64;

typedef     signed char             s8;
typedef     signed short int        s16;
typedef     signed int              s32;
typedef     signed long long int    s64;

typedef     float                   f32;
typedef     double                  f64;

#define true 1
#define false 0

#define NULL 0

#define		rgb5(r,g,b)				(u16)( r | ( g << 5) | ( b << 10) )

#endif
