#include <script_language.h>

.align 2
.thumb

.global scr_map_test
scr_map_test:
lock
faceplayer
msgbox str_test_text 0x6
release
end

.global scr_trainer_test
scr_trainer_test:
trainerbattle 0 5 0 str_test_text str_test_text