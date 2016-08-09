#include <bpre.h>
#include "custom_structs.h"
#include "custom_structs_malloc.h"

void malloc_battle_structs()
{
	custom_battle_struct.ptr=(struct custom_battle_struct*)malloc(sizeof(struct custom_battle_struct));
	custom_battle_struct.ptr->side_affecting[0].sticky_web=1;
}

void free_battle_structs()
{
	free(custom_battle_struct.ptr);
	custom_battle_struct.ptr=0;
}