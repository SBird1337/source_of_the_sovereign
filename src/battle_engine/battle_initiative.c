#include "battle_initiative.h"

struct move_info move_table[1024];

enum init_enum get_first_to_strike(u8 bank_one, u8 bank_two, u8 ignore_prio) {
    enum init_enum result = TIE;
    //TODO: implement quash
    if (!ignore_prio) {
        u16 move_one = battle_participants[bank_one].moves[battle_stuff_ptr.ptr->chosen_move_position[bank_one]];
        u16 move_two = battle_participants[bank_two].moves[battle_stuff_ptr.ptr->chosen_move_position[bank_two]];

        s8 prio_one = 0;
        s8 prio_two = 0;
        //note priority changing effects and abilities not added as of yet
        if (battle_menu_chosen_item[bank_one] == 0)
            prio_one = move_table[move_one].priority;
        if (battle_menu_chosen_item[bank_two] == 0)
            prio_two = move_table[move_two].priority;
        if (prio_one > prio_two)
            result = ONE;
        else if (prio_two > prio_one)
            result = TWO;
    }
    if (result == TIE) {
        //TODO: calculate item effects
        //TODO: calculate speed
    }
    return result;
}

