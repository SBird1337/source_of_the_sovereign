// songtable repointing

.org 0x081DD11C
.word _songtable

.org 0x081DD150
.word _songtable

.org 0x081DD19C
.word _songtable

.org 0x081DD1F0
.word _songtable

.org 0x081DD224
.word _songtable



// titlescreen cry id fix

.org 0x080791EE
ldr r2, =titlescreen_cry_id_override+1
bx  r2
.pool



// titlescreen music length extension
.org 0x08078C1C
    .word 0x18D8 // 53 seconds * 2 (loops) * 60 fps


// high quality mixer installation stuff

.org 0x080007B4
    .word  0x0203E000   // new PCM work area

.org 0x081DD0B4
    .word  main_mixer   // new mixer ROM location
    .word  0x03005F50   // new mixer RAM location (used for loading)
    .halfword mixer_size
    .halfword 0x400        // CpuSet, copy code by 32 bit units
    .word  0x0203E000   // new PCM work area

.org 0x081DD0C8
     // set correct sound driver operation mode
     // 12 channels at 31536 Hz samplerate
    .byte  0x00, 0xCC, 0x99, 0x00

.org 0x081DC094
    .word  0x03005F50+1 // new mixer RAM location (used for branch)



// new cry tables

.org 0x080720C8
    .include "patches/disable_cry_table_blocks.s"

.org 0x08043304    // cry-ID = poke-ID
    lsl r0, r0, #0x10
    lsr r0, r0, #0x10
    bx  lr

// trainer music overrides

.org 0x0808064C // encounter music ([!] Box) song hook
    LDR R1, =mhk_intro_music_id_to_song|1
    BL  _call_via_r1
    B   0x080806BA
    .pool

.org 0x08044090
    LDR R1, =mhk_current_map_music_set_default_for_battle|1
    BX  R1
    .pool

.org 0x080156FE // trainer victory music hook
    LDR R0, =mhk_trainer_battle_play_defeat|1
    BL  _call_via_r0
    B   0x0801576E
    .pool

.org 0x08021D46  // wild poke defeated
    BL  _call_via_r0
.org 0x08021D94
    .word   mhk_wild_poke_def_music|1

.org 0x0807F9F8
    LDR R1, =0x0807FA3E
    BL  _call_via_r1
    MOV R1, R0
    B   0x0807FA3E
    .pool

.org 0x080159D0
    LDR R0, =mhk_fadeout|1
    BL  _call_via_r0
    B   0x080159DC
    .pool
