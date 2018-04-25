#include "include/gba.h"
#include "oam_types.h"

void initStuff()
{
    int(*func)(void) = (int(*)(void))0x08006975; //OK / Clear OAM
    func();

    int(*func2)(void) = (int(*)(void))0x0800870D; //OK
    func2();

    int(*func3)(u8) = (int(*)(u8))0x080017BD; //OK
    func3((u8)0x0);
}

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

void updateEverything2()
{
    int(*func)(void) = (int(*)(void))0x08007189; //OK
    func();

    int(*func2)(void) = (int(*)(void))0x0800742D; //OK
    func2();

    int(*func3)(void) = (int(*)(void))0x080A19DD; //Transliterate... OK
    func3();
}

void fadeScreenBlack()
{
    int(*func)(u32, u32, u32, u32, u32) = (int(*)(u32, u32, u32, u32, u32))0x080A1AF1;
    func(0xFFFFFFFF, 0x0, 0, 0x10, 0x0000);
}

void fadeScreenNormal()
{
    int(*func)(u32, u32, u32, u32, u32) = (int(*)(u32, u32, u32, u32, u32))0x080A1AF1;
    func(0xFFFFFFFF, 0x0, 0x10, 0, 0x0000);
}

Sprite *createSprite(int *addr, int *addr2, u16 XPos, u16 YPos, u8 i)
{
    int(*func)(int *) = (int(*)(int *))0x080084F9; //OK
    func(addr);

    int(*func2)(int *, u16, u16, u8) = (int(*)(int *, u16, u16, u8))0x08006DF5; //OK
    int result = func2(addr2, XPos, YPos, (u8)0);

    result = ((result * 0x44) + ((int)objBaseAddr));

    return (Sprite *)result;
}

void CpuSet(void *srcPtr, void *dstPtr, int lengthMode)
{
    SystemCall(0xB);
}

void deleteSprite(Sprite *spritePtr)
{
    CpuSet((void *)0x0830238C, (Sprite *)spritePtr, 0x4000011);
}
