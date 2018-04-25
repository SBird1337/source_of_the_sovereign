#ifndef _USEFUL_BPED
#define _USEFUL_BPED

#define objBaseAddr		 ((u8 *) 0x02020630) //OK
#define OAMBuffer		 ((OAMThingy*)objBaseAddr)
#define dummyAnimData	 (u32 *) 0x083023E8 //Transliterate... OK
#define dummyAnimRoutine (u32 *) 0x08007429 //OK

//Memory Locations Passen alle
#define OAM_Mem               ((u16 *)0x030022F8)
#define OBJ_PaletteMem        ((u16 *)0x02037914) // Sprite Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem         ((u16 *)0x02037714) // Background Palette(256/16 colors) (adjusted for FR callback)
#define BG_PaletteMem2        ((u16 *)0x02037B14) // Background Palette(256/16
#define OBJ_PaletteMem2       ((u16 *)0x02037D14) // Sprite Palette(256/16 colors)

//Key Stuffs
#define KEYS            (*(u8 *)0x030022EE) //Wird schon passen
#define KEYSHOLD        (*(u8 *)0x030022EC) //.
#define KEYSSCROLL      (*(u8 *)0x030022F0) //.
#define KEYSLR          (*(u8 *)0x030022EF) //.
#define KEYSHOLDLR      (*(u8 *)0x030022ED) //.
#define KEYSSCROLLLR    (*(u8 *)0x030022F1) //.

//Variables and Such
#define LASTRESULT		(*(u16 *) 0x20375F0) //OK
#define var8004			(*(u16 *) 0x20375E0) //OK
#define fadeScreenDone	(*(u8  *) (0x02037FD4 + 7)) //OK
#define globalVars		(*((u32 *)0x0203BCD0)) //OK
#define boxInitStuff	((s32 *)0x0859CB38) // Transliterate... OK 
#define nullCallback	((s32 *)0x080861CD) // OK

//RoA Sounds //Gehe mal davon aus das ist OK, weil Sound Table
#define EMPTYMOVESOUND  0x05
#define TILEMOVESOUND   0x23
#define ERRORSOUND      0x20
#define TAKETILESOUND   0x24
#define DROPTILESOUND   0x2C
#define WINSONG         0x186

typedef struct 
{
    void *dummyPtr;
} Sprite;

void updateEverything()
{
	int(*func)(void) = (int(*)(void))0x080A9129; //Transliterate... OK
	func();

	int(*func2)(void) = (int(*)(void))0x080069C1; //OK
	func2();

	int(*func3)(void) = (int(*)(void))0x08006A0D; //OK
	func3();

	int(*func4)(void) = (int(*)(void))0x080A1A39; // Transliterate... OK
	func4();
}

//TODO Find actual names
void updateEverything2()
{
	int(*func)(void) = (int(*)(void))0x08007189; //OK
	func();

	int(*func2)(void) = (int(*)(void))0x0800742D; //OK
	func2();

	int(*func3)(void) = (int(*)(void))0x080A19DD; //Transliterate... OK
	func3();
}

int malloc(int size)
{
	int(*func)(int) = (int(*)(int))0x08000B39; //OK
	return func(size);
}

void free(void *addr)
{
	int(*func)(int *) = (int(*)(int *))0x08000B61; //OK
	func(addr);
}

void fadeScreen2(unsigned int bitmask, int r1, int r2, int r3, unsigned int color)
{
	int(*func)(u32, u32, u32, u32, u32) = (int(*)(u32, u32, u32, u32, u32))0x080A1AF1;
	func(bitmask, r1, r2, r3, color);
}

void unfadeScreen()
{
	fadeScreen2(0xFFFFFFFF, 0x0, 0x10, 0, 0x0000);
}

void fadeScreen()
{
	fadeScreen2(0xFFFFFFFF, 0x0, 0, 0x10, 0x0000);
}

void copyPal(void *source, void *dest)
{
	asm("mov r2, #0x8");
	SystemCall(0xC);
	//int (*func)(void) = (int (*)(void))0x080087BD;
	//func();
}

void copyMem(void *source, void *dest, int size)
{
	SystemCall(0xC);
}

void playFanfare(u16 fanfareNum)
{
	int(*func)(u16) = (int(*)(u16))0x080A3101; //Transliterate... OK
	func(fanfareNum);
}

int waitForFanfare() {

	int(*func)(void) = (int(*)(void))0x080A313D; //Transliterate... OK
	return func();

}

void playSound(u16 soundNum)
{
	int(*func)(u16) = (int(*)(u16))0x080A37C1; //Transliterate... OK
	func(soundNum);
}

int waitForSound()
{
	int(*func)(void) = (int(*)(void))0x080A38BD; //Transliterate... OK
	return func();

}

void changeIO(int offset, u16 value)
{
	int(*func)(int, u16) = (int(*)(int, u16))0x080010B5; //OK
	func(offset, value);
}

void enableBG(u8 BG)
{
	int(*func)(u8) = (int(*)(u8))0x08001B31; //OK
	func(BG);
}

void clearOAM()
{
	int(*func)(void) = (int(*)(void))0x08006975; //OK
	func();
}

void initStuff()
{
	clearOAM();

	int(*func2)(void) = (int(*)(void))0x0800870D; //OK
	func2();

	int(*func3)(u8) = (int(*)(u8))0x080017BD; //OK
	func3((u8)0x0);

}

void storeCallback(void *addr)
{
	int(*func)(void *) = (int(*)(void *))0x08000541; //OK
	func(addr);
}

void storeCallback2(int *addr)
{
	int(*func)(int *) = (int(*)(int *))0x080006F1; //OK
	func(addr);
}

Sprite *createSprite(int *addr, int *addr2, u16 XPos, u16 YPos, u8 i)
{
	int(*func)(int *) = (int(*)(int *))0x080084F9; //OK
	func(addr);

	int(*func2)(int *, u16, u16, u8) = (int(*)(int *, u16, u16, u8))0x08006DF5; //OK
	int result = func2(addr2, XPos, YPos, (u8)0);

	result = (result * 0x44) + (int)objBaseAddr;

	return (int *)result;
}

void loadPalette(int *addr, u8 offset, u8 length)
{
	int(*func)(int *, u8, u8) = (int(*)(int *, u8, u8))0x080A1955; //Transliterate... OK
	func(addr, offset, length);
}

void boxPrint(u8 foo, u8 font, u8 x, u8 y, u32 bar, u32 baz, u32 txtpointer)
{
	int(*func3)(u8, u8, u8, u8, u32, u32, u32) = (int(*)(u8, u8, u8, u8, u32, u32, u32))0x08199971; //Transliterate... OK
	func3(foo, font, x, y, bar, baz, txtpointer);
}

void writeBoxesToTilemap(u8 a, u8 b)
{
	int(*func5)(u8, u8) = (int(*)(u8, u8))0x08003659; //OK
	func5(a, b);
}

void initMapData(u8 r0, u32 r1, u8 r2)
{
	int(*func)(u8, u32, u8) = (int(*)(u8, u32, u8))0x080017E9; //OK
	func(r0, r1, r2);
}

void someExitFunc()
{
	int(*func)(void) = (int(*)(void))0x08003605; //OK
	func();
}

void forceNewBoxAndInitBG(u32 addr)
{
	int(*func)(u32) = (int(*)(u32))0x080031C1; //OK
	func(addr);
}

void loadSpritePal(u32 addr)
{
	int(*func)(u32) = (int(*)(u32))0x08008745; //OK
	func(addr);
}

void songNumStartOrChange(u16 n)
{
	int(*func)(u16) = (int(*)(u16))0x082F5E9D;
	func(n);
}

#endif