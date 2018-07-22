#include <script/language.h>

.text
.thumb
.align 2

.global debug_script
debug_script:
    lock
    faceplayer
    giveitem 1 1 0
    msgbox debug 6
    release
    end

debug:
    .string LAN_DE "debug script"