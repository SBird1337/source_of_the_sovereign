#include <types.h>
#include <game_engine.h>
#include <config.h>
extern char** text_lookup_array;   

void** loadpointer = (void**)((0x03000EB0 + 0x64));
extern char* get_text_pointer_from_lookup();
void sp_load_text_person()
{
    *loadpointer = get_text_pointer_from_lookup();
    return;
}