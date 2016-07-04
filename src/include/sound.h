#ifndef SOUND_H_
#define SOUND_H_

#include "types.h"

typedef struct MusicPlayerArea MusicPlayerArea;
typedef struct MusicPlayerTrack MusicPlayerTrack;
typedef struct SongHeader SongHeader;

typedef struct {
    MusicPlayerArea *ma;
    MusicPlayerTrack *ta;
    u32 tn;
} MPlayTable;

typedef struct {
    SongHeader *so;
    u16 ms, me;
} SongTable;

#endif
