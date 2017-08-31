
//{{BLOCK(boot_tileset)

//======================================================================
//
//	boot_tileset, 256x160@4, 
//	+ palette 16 entries, not compressed
//	+ 68 tiles (t|f|p reduced) lz77 compressed
//	+ regular map (flat), lz77 compressed, 32x20 
//	Total size: 32 + 672 + 412 = 1116
//
//	Time-stamp: 2017-08-29, 15:28:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BOOT_TILESET_H
#define GRIT_BOOT_TILESET_H

#define boot_tilesetTilesLen 672
extern const unsigned int boot_tilesetTiles[168];

#define boot_tilesetMapLen 412
extern const unsigned short boot_tilesetMap[206];

#define boot_tilesetPalLen 32
extern const unsigned short boot_tilesetPal[16];

#endif // GRIT_BOOT_TILESET_H

//}}BLOCK(boot_tileset)
