#include <battle.h>

u8 defog_field()
{
    u8 side_defender = get_side_from_bank(battle_defender_bank);
    u8 side_attacker = get_side_from_bank(battle_attacker_bank);
    
    side_affecting_halfword[side_defender].light_screen_on = false;
    side_affecting_halfword[side_defender].reflect_on = false;
    side_affecting_halfword[side_defender].mist_on = false;
    side_affecting_halfword[side_defender].spikes_on = false;
    side_affecting_halfword[side_defender].safeguard_on = false;
    
    side_affecting_halfword[side_attacker].safeguard_on = false;
    side_affecting_halfword[side_attacker].mist_on = false;
    side_affecting_halfword[side_attacker].spikes_on = false;
    
    battle_side_timers[side_defender].lightscreen_timer = 0;
    battle_side_timers[side_defender].reflect_timer = 0;
    
    battle_side_timers[side_defender].mist_timer = 0;
    battle_side_timers[side_defender].safeguard_timer = 0;
    battle_side_timers[side_defender].spikes_amount = 0;
    
    battle_side_timers[side_attacker].mist_timer = 0;
    battle_side_timers[side_attacker].safeguard_timer = 0;
    battle_side_timers[side_attacker].spikes_amount = 0;
    
    custom_battle_elements.ptr->side_affecting[side_attacker].stealth_rock = false;
    custom_battle_elements.ptr->side_affecting[side_attacker].sticky_web = false;
    custom_battle_elements.ptr->side_affecting[side_attacker].toxic_spikes_psn = false;
    custom_battle_elements.ptr->side_affecting[side_attacker].toxic_spikes_badpsn = false;
    
    custom_battle_elements.ptr->side_affecting[side_defender].stealth_rock = false;
    custom_battle_elements.ptr->side_affecting[side_defender].sticky_web = false;
    custom_battle_elements.ptr->side_affecting[side_defender].toxic_spikes_psn = false;
    custom_battle_elements.ptr->side_affecting[side_defender].toxic_spikes_badpsn = false;
    
    return false;
}