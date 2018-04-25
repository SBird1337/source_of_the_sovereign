#ifndef _OAM_TYPES
#define _OAM_TYPES

#define objBaseAddr 0x02020630

typedef struct
{
    short color[16];
} Palette16Colors;

typedef struct
{
    u8 character[1];
} TextStruct; // just to have a type for texts, TODO: maybe actually define the struct if necessary


typedef struct
{
    u16 x, y;
} Position;

typedef struct
{
    u8 y, flags, x, msbXFlags;
    u16 tileProPal, irrelevant;
} OAM;

typedef struct
{
    OAM oamAttr;
    void *animationPtr;
    u8 fC, fD, fE, fF;
    u32 f10;
    u32 objectTemplate;
    u32 f18;
    void *callbackPtr;
    Position pos1, pos2;
    u8 pos3x, pos3y, animNr, animFrame, time, f2D;
    Position iPos, iVel;
    u32 derp1, derp2;
    u8 f42, f43, end;
} Sprite;

typedef struct
{
    u16 f0, f1;
    u32 oam, animation, gfx, animation2;
    void *callback;
    u8 end;
} OBJTemplate;

#endif