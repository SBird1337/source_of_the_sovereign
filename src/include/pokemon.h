#ifndef POKE_INDICES_H
#define POKE_INDICES_H

#define POKE_PIKACHU 0x19
#define POKE_CUBONE 0x68
#define POKE_MAROWAK 0x69
#define POKE_FARFETCHD 0x53
#define POKE_CHANSEY 0x71
#define POKE_DITTO 132
#define POKE_CLAMPERL 0x175
#define POKE_LATIAS 0x197
#define POKE_LATIOS 0x198
#define POKE_CHERRIM 0x200
#define POKE_DIALGA 0x218
#define POKE_PALKIA 0x219
#define POKE_GIRATINA 0x21C || 0x21C //for that another form

struct pokemon_data
{
    u8 hp;
    u8 attack;
    u8 defence;
    u8 speed;
    u8 sp_attack;
    u8 sp_defence;
    u8 type_one;
    u8 type_two;
    u8 catch_rate;
    u8 base_exp_yield;
    u16 effort_yield;
    u16 item_one;
    u16 item_two;
    u8 gender;
    u8 egg_cycles;
    u8 base_friendship;
    u8 level_type;
    u8 egg_group_one;
    u8 egg_group_two;
    u8 ability_one;
    u8 ability_two;
    u8 safari_rate;
    u8 color_flip;
    u16 padding;
};

extern struct pokemon_data pokemon_stats[1300];

#endif /* POKE_INDICES_H */
