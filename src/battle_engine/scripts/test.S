#include <battle_script.h>

.align 2
.thumb
.text
.global bs_test
bs_test:
    callasm debug_some_test+1
    end


