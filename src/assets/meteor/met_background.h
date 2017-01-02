
//{{BLOCK(met_background)

//======================================================================
//
//	met_background, 256x160@4, 
//	Transparent color : 00,FF,00
//	+ palette 6 entries, lz77 compressed
//	+ 2 tiles (t|f reduced) lz77 compressed
//	+ regular map (flat), lz77 compressed, 32x20 
//	Total size: 12 + 20 + 164 = 196
//
//	Time-stamp: 2017-01-01, 21:27:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MET_BACKGROUND_H
#define GRIT_MET_BACKGROUND_H

#define met_backgroundTilesLen 20
extern const unsigned int met_backgroundTiles[5];

#define met_backgroundMapLen 164
extern const unsigned short met_backgroundMap[82];

#define met_backgroundPalLen 12
extern const unsigned short met_backgroundPal[6];

#endif // GRIT_MET_BACKGROUND_H

//}}BLOCK(met_background)
