#include <script_language.h>

.align 2
.thumb

.global the_old_test_script
the_old_test_script:

lock
faceplayer
setvar 0x8000 0x7C00
setvar 0x5006 8
special 0x68
waitstate
msgbox str_test_text 0x6
release
end