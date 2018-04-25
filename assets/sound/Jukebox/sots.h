#ifndef _SOTS_HEADER
#define _SOTS_HEADER

#include "include/gba.h"
#include "oam_types.h"



// structs, maybe add an extra file for that

// RoA Sounds
#define EMPTYMOVESOUND  0x05
#define TILEMOVESOUND   0x23
#define ERRORSOUND      0x20
#define TAKETILESOUND   0x24
#define DROPTILESOUND   0x2C
#define WINSONG         0x186

extern u32 dummyAnimData;
extern u32 dummyAnimRoutine;

// Memory Locations
extern u16 OAM_Mem[];
extern u16 OBJ_PaletteMem[];
extern u16 OBJ_PaletteMem2[];
extern u16 BG_PaletteMem[];
extern u16 BG_PaletteMem2[];

// Key Stuffs
extern u8 KEYS;
extern u8 KEYSHOLD;
extern u8 KEYSSCROLL;
extern u8 KEYSLR;
extern u8 KEYSHOLDLR;
extern u8 KEYSSCROLLLR;

// Variables and Such
extern u16 LASTRESULT;
extern u16 var8004;
extern u8  fadeScreenDone;
extern void *globalVars;
extern void *boxInitStuff;
extern void *nullCallback;

// BPED Functions
extern void *malloc(int size);
extern void free(void *ptr);

extern void fadeScreen(u32 palBitmask, int r1, int r2, int r3, u16 color); // TODO: find proper argument names

extern void playSound(u16);
extern void playFanfare(u16);
extern int waitForFanfare();
extern int waitForSound();

extern void changeIO(int address, u16 registerValue); // addreess relative to 0x04000000
extern void enableBG(u8 BG);
extern void clearOAM();
extern void loadPalette(Palette16Colors *palettePtr, u8 offset, u8 length);
extern void initMapData(u8 r0, u32 r1, u8 r2); // TODO: find proper argument names

extern void boxPrint(u8 foo, u8 font, u8 x, u8 y, u32 bar, u32 baz, TextStruct *textPtr);  // TODO: find proper argument names
extern void printBoxesToTilemap(u8 a, u8 b);  // TODO: find proper argument names
extern void forceNewBoxAndInitBG(u32 *addr);  // TODO: Pointer to what kind of data? Add a proper type!
extern void loadSpritePal(u32 *addr);  // TODO: Pointer to what kind of data? Add a proper type!

extern void storeCallback(int *callbackHandler);
extern void storeCallback2(int *callbackHandler);

// SOTS exclusive functions
extern void initStuff();
extern void updateEverything();
extern void updateEverything2();
extern void someExitFunc();
extern void fadeScreenBlack();
extern void fadeScreenNormal();
extern Sprite *createSprite(void *addr, void *addr2, u16 XPos, u16 YPos, u8 i); //find out what "i" is
extern void deleteSprite(Sprite *spritePtr);

// BIOS functions

extern void ResetSystem(); // Calls does multiple SVCs and resets the whole System

extern void RegisterRamReset(int resetFlags); // SVC 0x1
extern void VBlankIntrWait(); // SVC 0x5
extern int Div(int number, int denom); // SVC 0x6
extern u16 Sqrt(unsigned int x); // SVC 0x8
extern u16 ArcTan2(u16 x, u16 y); // SVC 0xA
extern void CpuSet(void *srcPtr, void *destPtr, int legnthMode); // SVC 0xB
extern void CpuFastSet(void *srcPtr, void *destPtr, int lengthMode); // SVC 0xC
extern void BgAffineSet(void *srcDataField, void *destDataField, int numCalc); // SVC 0xE
extern void ObjAffineSet(void *srcDataField, void *destDataField, int numCalc, int parOffset); // SVC 0xF
extern void LZ77UnCompWram(void *headerPtr, void *destPtr); // SVC 0x11
extern void LZ77UnCompVram(void *headerPtr, void *destPtr); // SVC 0x12
extern void RLUnCompWram(void *srcDataField, void *destAddr); // SVC 0x14
extern void RLUnCompVram(void *srcDataField, void *destAddr); // SVC 0x15
extern int MultiBoot(void *MultiBootParamPtr); // SVC 0x25

#endif