#include <constants/pkmns.h>

.text
.thumb

.global titlescreen_cry_id_override

.align 2

titlescreen_cry_id_override:
    //ldr     r0, =PKMN_DEOXYS
    //mov     r1, #0
    //ldr     r2, =0x08071DF0+1       // cry_related
    //bl      _call_via_r2
    mov     r0, #80
    ldr     r1, =m4aSongNumStart
    bl      _call_via_r1
    ldrb    r0, [r4, #0xC]
    ldr     r1, =0x080791F8+1       // hook return address
    bx      r1

.align 2
_call_via_r1:
    bx      r1
