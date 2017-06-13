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

.global scr_trigger_test
scr_trigger_test:
lockall
msgbox str_test_text 6
applymovement 0xFF move_data
waitmovement 0x0
releaseall
end

.global scr_trigger_test_two
scr_trigger_test_two:
lockall
msgbox str_test_text_two 6
applymovement 0xFF move_data
waitmovement 0x0
setvar 0x5011
releaseall
end

move_data:
.byte APPLYMOVE_JUMP_ONE_DOWN, APPLYMOVE_END