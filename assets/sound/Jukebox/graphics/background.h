
//{{BLOCK(background)

//======================================================================
//
//	background, 240x160@4, 
//	Transparent palette entry: 1.
//	+ palette 2 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 30x20 
//	Total size: 4 + 64 + 1200 = 1268
//
//	Time-stamp: 2014-11-15, 18:49:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 64
extern const unsigned short backgroundTiles[32];

#define backgroundMapLen 1200
extern const unsigned short backgroundMap[600];

#define backgroundPalLen 4
extern const unsigned short backgroundPal[2];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
