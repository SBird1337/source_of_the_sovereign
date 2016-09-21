#include <battle.h>

extern void* str_trick_room_off_ref;
extern void* str_trick_room_on_ref;
extern void* str_magic_room_off_ref;
extern void* str_magic_room_on_ref;
extern void* str_wonder_room_off_ref;
extern void* str_wonder_room_on_ref;

u8 set_or_delete_rooms() {
    struct field_affecting* field = &custom_battle_elements.ptr->field_affecting;
    switch (battle_executed_move) {
        case MOVE_TRICK_ROOM:
            if (field->trick_room) {
                field->trick_room = 0;
                battle_string_chooser = str_trick_room_off_ref;
            } else {
                field->trick_room = 5;
                battle_string_chooser = str_trick_room_on_ref;
            }
            break;
        case MOVE_MAGIC_ROOM:
            if (field->magic_room) {
                field->magic_room = 0;
                battle_string_chooser = str_magic_room_off_ref;
            } else {
                field->magic_room = 5;
                battle_string_chooser = str_magic_room_on_ref;
            }
            break;
        case MOVE_WONDER_ROOM:
            if (field->wonder_room) {
                field->wonder_room = 0;
                battle_string_chooser = str_wonder_room_off_ref;
            } else {
                field->wonder_room = 5;
                battle_string_chooser = str_wonder_room_on_ref;
            }
            break;
    }
    return false;
}