#include <battle_script.h>
#include <moves.h>

.align 2
.thumb
.text

.global bs_uturn_btpass
bs_uturn_btpass:
    jumpifhalfword 0x0 0x02023D4A MOVE_BATON_PASS 0x81D7995
    attackcanceler
    accuracycheck 0x81D695E 0x0
    attackstring
    ppreduce
    calculatedamage
    attackanimation
    waitanimation
    missmessage
    cmd5c 0
    waitstate
    graphicalhpupdate 0
    datahpupdate 0
    critmessage
    waitmessage 0x40
    resultmessage
    waitmessage 0x40
    seteffectwithchancetarget
    faintpokemon 0x0 0x0 0x0
    jumpifcannotswitch 0x81 0x81D694E
    goto 0x81D79A0

.global as_uturn
as_uturn:
.byte 0x00, 0x05, 0x28, 0x00, 0x3B, 0x27, 0x0A, 0x01, 0x0C, 0x0C, 0x08, 0x19, 0x91, 0x00, 0xC0, 0x02
.word as_uturn_particle_one
.byte 0x02, 0x02, 0x0A, 0x00, 0xF6, 0xFF, 0x05, 0x03, 0xDD, 0x9B, 0x0B, 0x08, 0x02, 0x06, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x08, 0x00, 0x1F, 0x00, 0x05, 0x01, 0x05, 0x28, 0x00, 0x06, 0x28, 0x02, 0x54, 0x4E, 0x3D, 0x08
.byte 0x02, 0x02, 0x06, 0x00, 0x04, 0x00, 0x04, 0x04, 0x19, 0xBA, 0x00, 0x3F, 0x02
.word as_uturn_particle_two
.byte 0x82, 0x02, 0x0A, 0x00, 0xF6, 0xFF, 0x05, 0x01, 0x06, 0x28, 0x00, 0x97, 0x27, 0x03, 0x1D, 0x8B, 0x09, 0x08, 0x02, 0x05, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x02, 0xB0, 0x7C, 0x3E, 0x08, 0x83, 0x05, 0xF6
.byte 0xFF, 0xF8, 0xFF, 0x01, 0x00, 0x01, 0x00, 0x08, 0x00, 0x19, 0x74, 0x00, 0x3F, 0x04, 0x08, 0x02, 0xB0, 0x7C, 0x3E, 0x08, 0x83, 0x05, 0x0A, 0x00, 0x08, 0x00, 0x01, 0x00, 0x01, 0x00, 0x08, 0x00, 0x19, 0x86, 0x00, 0x3F, 0x05, 0x0B
.byte 0x01, 0x0D, 0x00, 0xF2, 0x27, 0x19, 0xD9, 0x00, 0xC0, 0x03, 0xDD, 0x9B, 0x0B, 0x08, 0x02, 0x06, 0x1F, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0xFF, 0xFF, 0x02, 0x50, 0xF1, 0x3F, 0x08, 0x02, 0x00, 0x08, 0xFF

.align 2
as_uturn_particle_one:
.byte 0x05, 0x28, 0x3B, 0x27, 0xD8, 0xC9, 0x3A, 0x08, 0xF4, 0x68, 0x3E, 0x08, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x1C, 0x23, 0x08, 0x85, 0x14, 0x0B, 0x08

.align 2
as_uturn_particle_two:
.byte 0x06, 0x28, 0x3B, 0x27, 0xE0, 0xC9, 0x3A, 0x08, 0x3C, 0x69, 0x3E, 0x08, 0x00, 0x00, 0x00, 0x00, 0xFC, 0x1C, 0x23, 0x08, 0x85, 0x14, 0x0B, 0x08