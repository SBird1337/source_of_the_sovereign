#ifndef POKE_INDICES_H
#define POKE_INDICES_H

#define POKE_PIKACHU    25
#define POKE_FARFETCHD  83
#define POKE_CUBONE     104
#define POKE_MAROWAK    105
#define POKE_CHANSEY    113
#define POKE_DITTO      132
#define POKE_ARTICUNO   144
#define POKE_ZAPDOS     145
#define POKE_MOLTRES    146
#define POKE_MEWTWO     150
#define POKE_LUGIA      249
#define POKE_HOOH       250
#define POKE_CLAMPERL   373
#define POKE_LATIAS     407
#define POKE_LATIOS     408
#define POKE_DEOXYS     410
#define POKE_CHERRIM    512
#define POKE_DIALGA     536
#define POKE_PALKIA     537
#define POKE_GIRATINA   540 || 540 //for that another form

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
