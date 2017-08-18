/*.org 0x5f574 + 0x08000000
ldr r0, =ClearAllPalettes|1
bx r0
.pool

.org 0x89e8 + 0x08000000
ldr r1, =FindPalette|1
bx r1
.pool

.org 0x8928 + 0x08000000
ldr r1, =FindOrLoadPalette|1
bx r1
.pool

.org 0xdc9e0 + 0x08000000
ldr r3, =SetUpTreeDisguise|1
bx r3
.pool

.org 0xdc9f0 + 0x08000000
ldr r3, =SetUpRockDisguise|1
bx r3
.pool

.org 0xdca00 + 0x08000000
ldr r3, =SetUpWeirdDisguise|1
bx r3
.pool

.org 0x7a748 + 0x08000000
ldr r1, =PaletteNeedsFogBrightening|1
bx r1
.pool

.org 0x7abc0 + 0x08000000
ldr r1, =LoadCloudOrSandstormPalette|1
bx r1
.pool

.org 0x5e6b0 + 0x08000000
ldr r0, =SetPalNPC1|1
bx r0
.pool

.org 0x5ef78 + 0x08000000
ldr r0, =SetPalNPC2|1
bx r0
.pool

.org 0x5eab0 + 0x08000000
ldr r0, =SetPalNPC3|1
bx r0
.pool

.org 0x5ebc0 + 0x08000000
ldr r0, =SetPalNPC4|1
bx r0
.pool

.org 0xdadb4 + 0x08000000
ldr r2, =SetPalReflection|1
bx r2
.pool

.org 0xdc410 + 0x08000000
ldr r2, =SetPalSurf|1
bx r2
.pool

.org 0x87188 + 0x08000000
ldr r1, =SetPalFly|1
bx r1
.pool

.org 0x12d2ac + 0x08000000
ldr r0, =RefreshFameCheckerNPCs|1
bx r0
.pool

.org 0x71b8 + 0x08000000
ldr r0, =SetPalMisc|1
bx r0
.pool

.org 0x82664 + 0x08000000
ldr r3, =SetPalEmotionBubble|1
bx r3
.pool

.org 0xdb1ac + 0x08000000
ldr r3, =SetPalWarpArrow|1
bx r3
.pool

.org 0x13f434 + 0x08000000
ldr r0, =SetPalItemfinderArrow|1
bx r0
.pool

.org 0x12d7a8 + 0x08000000
ldr r1, =SetPalFameCheckerUnknown|1
bx r1
.pool

.org 0x7a2d0 + 0x08000000
ldr r0, =GetDarkeningType1|1
bx r0
.pool

.org 0x7a428 + 0x08000000
ldr r0, =GetDarkeningType2|1
bx r0
.pool

.org 0x7a544 + 0x08000000
ldr r0, =GetDarkeningType3|1
bx r0
.pool

.org 0x7aec4 + 0x08000000
ldr r1, =FogBrightenAll|1
bx r1
.pool

.org 0x7aaac + 0x08000000
ldr r0, =FogBrightenOnStep|1
bx r0
.pool

.org 0x7a644 + 0x08000000
ldr r0, =FogBrightenAndFadeIn|1
bx r0
.pool

.org 0x7a0a8 + 0x08000000
ldr r1, =GetFadeType1|1
bx r1
.pool

.org 0x7a860 + 0x08000000
ldr r2, =GetFadeType2|1
bx r2
.pool

.org 0x9d5a8 + 0x08000000
ldr r2, =SetPalFossilImage|1
bx r2
.pool

.org 0x9d538 + 0x08000000
ldr r1, =LoadPalFossilImage|1
bx r1
.pool

.org 0x9d568 + 0x08000000
ldr r1, =LoadPalFossilImage|1
bx r1
.pool

.org 0x15d4e8 + 0x08000000
ldr r2, =SetPalSSAnneWake|1
bx r2
.pool

.org 0x15d600 + 0x08000000
ldr r2, =SetPalSSAnneSmoke|1
bx r2
.pool

.org 0x7280 + 0x08000000
ldr r1, =DeleteOBJ|1
bx r1
.pool

.org 0xdaf88 + 0x08000000
ldr r0, =DeleteReflection|1
bx r0
.pool

.org 0xdb120 + 0x08000000
ldr r0, =DeleteWarpArrow|1
bx r0
.pool

//don't auto-load npc palettes into slot 0 or 0xA
.org 0x0805F5E8
bx lr

.org 0x0805F658
bx lr

.org 0x080DAEC4
bx lr

.org 0x080DAF20
bx lr

.org 0x0805F093
.byte 0xE0

//don't reset pal slot during player animation or reflection
.org 0x0805F114
lsl r0, #0x0

.org 0x080DAFB8
lsl r0, #0

//don't load rain palette on entering map
.org 0x08079C18
.byte 0x0
.byte 0x25
.byte 0xE
.byte 0xE0

//don't load sand palette on healing
.org 0x081D9895
.byte 0x7
.byte 0x9C
.byte 0xBE
.byte 0x3C
.byte 0x8
.byte 0x8D
.byte 0x3B
.byte 0x8
.byte 0x8
.byte 0x4

//don't treat slot 0xC as weather palette
.org 0x0807A31F
.byte 0xE0

//don't record brightened slots
.org 0x0807AAE7
.byte 0xE0

//pal slot of scroll arrow in frame checker
.org 0x0845FD52
.byte 0x9

//make it compatible with daniilS snowflakes routine
.org 0x0807A85E
.byte 0x80
.byte 0x18

.org 0x0807A872
.byte 1
.byte 0x22
.byte 0x5
.byte 0xE0*/

.org 0x0805E590
ldr r5, =npc_spawn_with_provided_template|1
bx r5

.pool

.org 0x08007280
ldr r1, =obj_delete_and_free_tiles_hook|1
bx r1

.pool

.org 0x0800779A
ldr r1, =obj_delete_all_hook|1
bx r1

.pool

.org 0x0805EE3C
push {r4, lr}
ldr r4, =npc_restore_state|1
bl bxr4
pop {r4}
pop {r0}
bx r0

bxr4:
bx r4

.pool