#include "include/gba.h"

#include "sots.h"
#include "jukebox_types.h"

void unloadRoutine();
void loadContent();

int mainCallback()	// main loop
{
	JukeMem *jukeMemPtr;
	jukeMemPtr = (JukeMem *) globalVars;
	switch (jukeMemPtr->mode)
	{
	case ENTRY:
		if (fadeScreenDone == 0)
		{
			clearOAM();
			fadeScreenNormal();
			loadContent();
			jukeMemPtr->mode = FADEIN;
		}
		break;
	case FADEIN:
		if (fadeScreenDone == 0)
		{
			jukeMemPtr->mode = MAIN;
		}
		break;
	case MAIN:
		//songNumStartOrChange(404);
		jukeMemPtr->mode = FADEOUT;
		break;
	case FADEOUT:
		fadeScreenBlack();
		jukeMemPtr->mode = EXIT;
		break;
	case EXIT:
		if (fadeScreenDone == 0)
		{
			fadeScreenNormal();
			unloadRoutine();
		}
		break;
	}

	updateEverything();
}

int main()
{
	globalVars = malloc(sizeof(JukeMem));
	storeCallback((void *)(&mainCallback + 1));
	fadeScreenBlack();
	JukeMem *jukeMemPtr;
	jukeMemPtr = (JukeMem *)globalVars;
	jukeMemPtr->mode = ENTRY;
}

void unloadRoutine()
{
	storeCallback(nullCallback);
	free((void *)globalVars);
	someExitFunc();
}

void resetBackgrounds()
{

}

void loadContent()	// load all graphics from memory to VRAM and init registers
{

}