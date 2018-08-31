#include <script/language.h>

.text
.thumb
.align 2

.global debug_script
debug_script:
    lock
    faceplayer
    callasm blackboard_start+1
    release
    end

debug:
    .string LAN_DE "debug script"