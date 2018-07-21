#include <pkmn_item_effects.h>

.align 2
.thumb
.text

.global item_list
item_list:

.string LAN_DE "Kein Item",14
.hword 0x0, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_0 
.byte 0, 0, 1, 4 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Meisterball",14
.hword 0x1, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_1 
.byte 0, 0, 3, 0 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Hyperball",14
.hword 0x2, 1200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_2 
.byte 0, 0, 3, 1 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 1, 0, 0, 0 

.string LAN_DE "Superball",14
.hword 0x3, 600 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_3 
.byte 0, 0, 3, 2 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 2, 0, 0, 0 

.string LAN_DE "Pokéball",14
.hword 0x4, 200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_4 
.byte 0, 0, 3, 3 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 3, 0, 0, 0 

.string LAN_DE "Safariball",14
.hword 0x5, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_5 
.byte 0, 0, 3, 4 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 4, 0, 0, 0 

.string LAN_DE "Netzball",14
.hword 0x6, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_6 
.byte 0, 0, 3, 5 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 5, 0, 0, 0 

.string LAN_DE "Tauchball",14
.hword 0x7, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_7 
.byte 0, 0, 3, 6 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 6, 0, 0, 0 

.string LAN_DE "Nestball",14
.hword 0x8, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_8 
.byte 0, 0, 3, 7 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 7, 0, 0, 0 

.string LAN_DE "Wiederball",14
.hword 0x9, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_9 
.byte 0, 0, 3, 8 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 8, 0, 0, 0 

.string LAN_DE "Timerball",14
.hword 0xA, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_10 
.byte 0, 0, 3, 9 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 9, 0, 0, 0 

.string LAN_DE "Luxusball",14
.hword 0xB, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_11 
.byte 0, 0, 3, 10 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 10, 0, 0, 0 

.string LAN_DE "Premierball",14
.hword 0xC, 200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_12 
.byte 0, 0, 3, 11 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 11, 0, 0, 0 

.string LAN_DE "Trank",14
.hword 0xD, 300 
.byte ITEM_EFFECT_NOEFFECT, 14 
.word str_item_description_13 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Gegengift",14
.hword 0xE, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_14 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Feuerheiler",14
.hword 0xF, 250 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_15 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisheiler",14
.hword 0x10, 250 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_16 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Aufwecker",14
.hword 0x11, 250 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_17 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Para-Heiler",14
.hword 0x12, 200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_18 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Genesung",14
.hword 0x13, 3000 
.byte ITEM_EFFECT_NOEFFECT, 255 
.word str_item_description_19 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Trank",14
.hword 0x14, 2500 
.byte ITEM_EFFECT_NOEFFECT, 255 
.word str_item_description_20 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Hypertrank",14
.hword 0x15, 1400 
.byte ITEM_EFFECT_NOEFFECT, 200 
.word str_item_description_21 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Supertrank",14
.hword 0x16, 700 
.byte ITEM_EFFECT_NOEFFECT, 50 
.word str_item_description_22 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Hyperheiler",14
.hword 0x17, 600 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_23 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Beleber",14
.hword 0x18, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_24 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Beleber",14
.hword 0x19, 4000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_25 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Tafelwasser",14
.hword 0x1A, 200 
.byte ITEM_EFFECT_NOEFFECT, 50 
.word str_item_description_26 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Sprufel",14
.hword 0x1B, 300 
.byte ITEM_EFFECT_NOEFFECT, 60 
.word str_item_description_27 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Limonade",14
.hword 0x1C, 350 
.byte ITEM_EFFECT_NOEFFECT, 80 
.word str_item_description_28 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Kuhmuh-Milch",14
.hword 0x1D, 500 
.byte ITEM_EFFECT_NOEFFECT, 100 
.word str_item_description_29 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Energiestaub",14
.hword 0x1E, 500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_30 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Kraftwurzel",14
.hword 0x1F, 800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_31 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Heilpuder",14
.hword 0x20, 450 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_32 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Vitalkraut",14
.hword 0x21, 2800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_33 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Äther",14
.hword 0x22, 1200 
.byte ITEM_EFFECT_NOEFFECT, 10 
.word str_item_description_34 
.byte 0, 0, 1, 1 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Äther",14
.hword 0x23, 2000 
.byte ITEM_EFFECT_NOEFFECT, 255 
.word str_item_description_35 
.byte 0, 0, 1, 1 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Elixier",14
.hword 0x24, 3000 
.byte ITEM_EFFECT_NOEFFECT, 10 
.word str_item_description_36 
.byte 0, 0, 1, 1 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Elixier",14
.hword 0x25, 4500 
.byte ITEM_EFFECT_NOEFFECT, 255 
.word str_item_description_37 
.byte 0, 0, 1, 1 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Lavakeks",14
.hword 0x26, 200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_38 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Blaue Flöte",14
.hword 0x27, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_39 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Gelbe Flöte",14
.hword 0x28, 200 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_40 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Rote Flöte",14
.hword 0x29, 300 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_41 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Schw. Flöte",14
.hword 0x2A, 400 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_42 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Weiße Flöte",14
.hword 0x2B, 500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_43 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Beerensaft",14
.hword 0x2C, 150 
.byte ITEM_EFFECT_ORANBERRY, 50 
.word str_item_description_44 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Zauberasche",14
.hword 0x2D, 65000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_45 
.byte 0, 0, 1, 1 
.word 0x80A176D 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Küstensalz",14
.hword 0x2E, 20 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_46 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Küstenschale",14
.hword 0x2F, 20 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_47 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Purpurstück",14
.hword 0x30, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_48 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Inidgostück",14
.hword 0x31, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_49 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gelbstück",14
.hword 0x32, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_50 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Grünstück",14
.hword 0x33, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_51 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Herzkonfekt",14
.hword 0x34, 50 
.byte ITEM_EFFECT_NOEFFECT, 20 
.word str_item_description_52 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Galette",14
.hword 0x35, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_53 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Spezialität",14
.hword 0x36, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_54 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Stratos-Eis",14
.hword 0x37, 50 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_55 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Wutkeks",14
.hword 0x38, 150 
.byte ITEM_EFFECT_NOEFFECT, 20 
.word str_item_description_56 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Yantarasablé",14
.hword 0x39, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_57 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Zauberfeder",14
.hword 0x3A, 45000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_58 
.byte 0, 0, 1, 1 
.word 0x80A176D 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Honig",14
.hword 0x3B, 100 
.byte ITEM_EFFECT_ORANBERRY, 50 
.word str_item_description_59 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Pokéwedel",14
.hword 0x3C, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_60 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A2011 
.byte 0, 0, 0, 0 

.string LAN_DE "Rabattmarke",14
.hword 0x3D, 20 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_61 
.byte 0, 0, 1, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Fähig.Kapsel",14
.hword 0x3E, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_62 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kp-Plus",14
.hword 0x3F, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_63 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Protein",14
.hword 0x40, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_64 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisen",14
.hword 0x41, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_65 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Carbon",14
.hword 0x42, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_66 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kalzium",14
.hword 0x43, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_67 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sonerbonbon",14
.hword 0x44, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_68 
.byte 0, 0, 1, 1 
.word 0x80A1735 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ap-Plus",14
.hword 0x45, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_69 
.byte 0, 0, 1, 1 
.word 0x80A1719 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zink",14
.hword 0x46, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_70 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ap-Top",14
.hword 0x47, 9800 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_71 
.byte 0, 0, 1, 1 
.word 0x80A1719 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ultratrank",14
.hword 0x48, 1000 
.byte ITEM_EFFECT_NOEFFECT, 100 
.word str_item_description_72 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Megablock",14
.hword 0x49, 700 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_73 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "Angriffplus",14
.hword 0x4A, 650 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_74 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Angriff",14
.hword 0x4B, 500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_75 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Abwehr",14
.hword 0x4C, 550 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_76 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Tempo",14
.hword 0x4D, 350 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_77 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Treffer",14
.hword 0x4E, 950 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_78 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Spezial",14
.hword 0x4F, 350 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_79 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "Poképuppe",14
.hword 0x50, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_80 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A2011 
.byte 0, 0, 0, 0 

.string LAN_DE "Eneco-Rute",14
.hword 0x51, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_81 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A2011 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Sp.Vert.",14
.hword 0x52, 350 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_82 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "Superschutz",14
.hword 0x53, 500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_83 
.byte 0, 0, 1, 4 
.word 0x80A1999 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Top-Schutz",14
.hword 0x54, 700 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_84 
.byte 0, 0, 1, 4 
.word 0x80A1999 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fluchtseil",14
.hword 0x55, 550 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_85 
.byte 0, 0, 1, 4 
.word 0x80A1BAD 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schutz",14
.hword 0x56, 350 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_86 
.byte 0, 0, 1, 4 
.word 0x80A1999 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Abwehrfeder",14
.hword 0x57, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_87 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Espritfeder",14
.hword 0x58, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_88 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flinkfeder",14
.hword 0x59, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_89 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Geniefeder",14
.hword 0x5A, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_90 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Heilfeder",14
.hword 0x5B, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_91 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kraftfeder",14
.hword 0x5C, 3000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_92 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sonnenstein",14
.hword 0x5D, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_93 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mondstein",14
.hword 0x5E, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_94 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feuerstein",14
.hword 0x5F, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_95 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Donnerstein",14
.hword 0x60, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_96 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wasserstein",14
.hword 0x61, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_97 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Blattstein",14
.hword 0x62, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_98 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Finsterstein",14
.hword 0x63, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_99 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Funkelstein",14
.hword 0x64, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_100 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Leuchtstein",14
.hword 0x65, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_101 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Shocker",14
.hword 0x66, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_102 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "IM-Schocker",14
.hword 0x67, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_103 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Minipilz",14
.hword 0x68, 250 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_104 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Riesenpilz",14
.hword 0x69, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_105 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Perle",14
.hword 0x6A, 700 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_106 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Riesenperle",14
.hword 0x6B, 3750 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_107 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sternenstaub",14
.hword 0x6C, 2000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_108 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sternenstück",14
.hword 0x6D, 4900 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_109 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Herzschuppe",14
.hword 0x6E, 5000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_110 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Koakobeere",14
.hword 0x6F, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_111 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Foepasbeere",14
.hword 0x70, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_112 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kerzalbeere",14
.hword 0x71, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_113 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Grindobeere",14
.hword 0x72, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_114 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kiroyabeere",14
.hword 0x73, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_115 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rospelbeere",14
.hword 0x74, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_116 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Grarzbeere",14
.hword 0x75, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_117 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schukebeere",14
.hword 0x76, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_118 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kobabeere",14
.hword 0x77, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_119 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pyapabeere",14
.hword 0x78, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_120 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tanigabeere",14
.hword 0x79, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_121 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Chiaribeere",14
.hword 0x7A, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_122 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zitarzbeere",14
.hword 0x7B, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_123 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Terirobeere",14
.hword 0x7C, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_124 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Burleobeere",14
.hword 0x7D, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_125 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Babiribeere",14
.hword 0x7E, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_126 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Latchibeere",14
.hword 0x7F, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_127 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wunfrubeere",14
.hword 0x80, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_128 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eipfelbeere",14
.hword 0x81, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_129 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Jabocabeere",14
.hword 0x82, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_130 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Roselbeere",14
.hword 0x83, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_131 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Hibisbeere",14
.hword 0x84, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_132 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Amrenabeere",14
.hword 0x85, 200 
.byte ITEM_EFFECT_CHERIBERRY, 0 
.word str_item_description_133 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Maronbeere",14
.hword 0x86, 250 
.byte ITEM_EFFECT_CHESTOBERRY, 0 
.word str_item_description_134 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Pirsifbeere",14
.hword 0x87, 100 
.byte ITEM_EFFECT_PECHABERRY, 0 
.word str_item_description_135 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Fragiabeere",14
.hword 0x88, 250 
.byte ITEM_EFFECT_RAWSTBERRY, 0 
.word str_item_description_136 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Wilbirbeere",14
.hword 0x89, 250 
.byte ITEM_EFFECT_ASPEARBERRY, 0 
.word str_item_description_137 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Jonagobeere",14
.hword 0x8A, 2000 
.byte ITEM_EFFECT_LEPPABERRY, 10 
.word str_item_description_138 
.byte 0, 0, 5, 1 
.word 0x80A16FD 
.byte 0, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Sinelbeere",14
.hword 0x8B, 100 
.byte ITEM_EFFECT_ORANBERRY, 10 
.word str_item_description_139 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Persimbeere",14
.hword 0x8C, 150 
.byte ITEM_EFFECT_PERSIMBERRY, 0 
.word str_item_description_140 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Prunusbeere",14
.hword 0x8D, 600 
.byte ITEM_EFFECT_LUMBERRY, 0 
.word str_item_description_141 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Tsitrubeere",14
.hword 0x8E, 400 
.byte ITEM_EFFECT_ORANBERRY, 30 
.word str_item_description_142 
.byte 0, 0, 5, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Giefebeere",14
.hword 0x8F, 2500 
.byte ITEM_EFFECT_FIGYBERRY, 254 
.word str_item_description_143 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Wikibeere",14
.hword 0x90, 2500 
.byte ITEM_EFFECT_WIKIBERRY, 254 
.word str_item_description_144 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Magobeere",14
.hword 0x91, 2500 
.byte ITEM_EFFECT_MAGOBERRY, 254 
.word str_item_description_145 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Gauvebeere",14
.hword 0x92, 2500 
.byte ITEM_EFFECT_AGUAVBERRY, 254 
.word str_item_description_146 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Yapabeere",14
.hword 0x93, 2500 
.byte ITEM_EFFECT_IAPAPABERRY, 254 
.word str_item_description_147 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Himmihbeere",14
.hword 0x94, 1500 
.byte ITEM_EFFECT_ORANBERRY, 50 
.word str_item_description_148 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Morbbeere",14
.hword 0x95, 1500 
.byte ITEM_EFFECT_ORANBERRY, 80 
.word str_item_description_149 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Nanabeere",14
.hword 0x96, 1500 
.byte ITEM_EFFECT_ORANBERRY, 100 
.word str_item_description_150 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Nirbebeere",14
.hword 0x97, 1500 
.byte ITEM_EFFECT_ORANBERRY, 150 
.word str_item_description_151 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Sananabeere",14
.hword 0x98, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_152 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Granabeere",14
.hword 0x99, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_153 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Setangbeere",14
.hword 0x9A, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_154 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Qualotbeere",14
.hword 0x9B, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_155 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Honmelbeere",14
.hword 0x9C, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_156 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Labrusbeere",14
.hword 0x9D, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_157 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tamotbeere",14
.hword 0x9E, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_158 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Saimbeere",14
.hword 0x9F, 1500 
.byte ITEM_EFFECT_ORANBERRY, 200 
.word str_item_description_159 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Magostbeere",14
.hword 0xA0, 1500 
.byte ITEM_EFFECT_ORANBERRY, 255 
.word str_item_description_160 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Rabutabeere",14
.hword 0xA1, 1500 
.byte ITEM_EFFECT_ORANBERRY, 255 
.word str_item_description_161 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Tronzibeere",14
.hword 0xA2, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_162 
.byte 0, 0, 5, 4 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Kiwanbeere",14
.hword 0xA3, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_163 
.byte 0, 0, 5, 4 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Pallmbeere",14
.hword 0xA4, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_164 
.byte 0, 0, 5, 4 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Wasmelbeere",14
.hword 0xA5, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_165 
.byte 0, 0, 5, 4 
.word 0x80A16FD 
.byte 1, 0, 0, 0 
.word 0x80A1FF5 
.byte 0, 0, 0, 0 

.string LAN_DE "Durinbeere",14
.hword 0xA6, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_166 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Myrtilbeere",14
.hword 0xA7, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_167 
.byte 0, 0, 5, 4 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Lydzibeere",14
.hword 0xA8, 1500 
.byte ITEM_EFFECT_LIECHIBERRY, 10 
.word str_item_description_168 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Liganbeere",14
.hword 0xA9, 1500 
.byte ITEM_EFFECT_GANLONBERRY, 10 
.word str_item_description_169 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Salkabeere",14
.hword 0xAA, 1500 
.byte ITEM_EFFECT_SALACBERRY, 10 
.word str_item_description_170 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tahaybeere",14
.hword 0xAB, 1500 
.byte ITEM_EFFECT_PETAYABERRY, 10 
.word str_item_description_171 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Apikobeere",14
.hword 0xAC, 1500 
.byte ITEM_EFFECT_APICOTBERRY, 10 
.word str_item_description_172 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lansatbeere",14
.hword 0xAD, 1500 
.byte ITEM_EFFECT_LANSATBERRY, 10 
.word str_item_description_173 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Krambobeere",14
.hword 0xAE, 1500 
.byte ITEM_EFFECT_STARFBERRY, 10 
.word str_item_description_174 
.byte 0, 0, 5, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Enigmabeere",14
.hword 0xAF, 95000 
.byte ITEM_EFFECT_ORANBERRY, 255 
.word str_item_description_175 
.byte 0, 0, 5, 1 
.word 0x80A176D 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Akibeere",14
.hword 0xB0, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_176 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tarabeere",14
.hword 0xB1, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_177 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Banngefäß",14
.hword 0xB2, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_178 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Blendpuder",14
.hword 0xB3, 10 
.byte ITEM_EFFECT_BRIGHTPOWDER, 10 
.word str_item_description_179 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schlohkraut",14
.hword 0xB4, 100 
.byte ITEM_EFFECT_WHITEHERB, 0 
.word str_item_description_180 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machoband",14
.hword 0xB5, 3000 
.byte ITEM_EFFECT_MACHOBRACE, 0 
.word str_item_description_181 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ep-Teiler",14
.hword 0xB6, 3000 
.byte ITEM_EFFECT_EXPSHARE, 0 
.word str_item_description_182 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flinkklaue",14
.hword 0xB7, 100 
.byte ITEM_EFFECT_QUICKCLAW, 20 
.word str_item_description_183 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sanftglocke",14
.hword 0xB8, 100 
.byte ITEM_EFFECT_SOOTHEBELL, 0 
.word str_item_description_184 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mentalkraut",14
.hword 0xB9, 100 
.byte ITEM_EFFECT_MENTALHERB, 0 
.word str_item_description_185 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wahlband",14
.hword 0xBA, 200 
.byte ITEM_EFFECT_CHOICEBAND, 0 
.word str_item_description_186 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "King-Stein",14
.hword 0xBB, 100 
.byte ITEM_EFFECT_KINGSROCK, 10 
.word str_item_description_187 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Silberstaub",14
.hword 0xBC, 100 
.byte ITEM_EFFECT_SILVERPOWDER, 10 
.word str_item_description_188 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Münzamulett",14
.hword 0xBD, 100 
.byte ITEM_EFFECT_AMULETCOIN, 10 
.word str_item_description_189 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schutzband",14
.hword 0xBE, 200 
.byte ITEM_EFFECT_CLENSEATAG, 0 
.word str_item_description_190 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Seelentau",14
.hword 0xBF, 200 
.byte ITEM_EFFECT_SOULDEW, 0 
.word str_item_description_191 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Abysszahn",14
.hword 0xC0, 200 
.byte ITEM_EFFECT_DEEPSEATOOTH, 0 
.word str_item_description_192 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Abyssplatte",14
.hword 0xC1, 200 
.byte ITEM_EFFECT_DEEPSEASCALE, 0 
.word str_item_description_193 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rauchball",14
.hword 0xC2, 200 
.byte ITEM_EFFECT_SMOKEBALL, 0 
.word str_item_description_194 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ewigstein",14
.hword 0xC3, 200 
.byte ITEM_EFFECT_EVERSTONE, 0 
.word str_item_description_195 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fokus-Band",14
.hword 0xC4, 200 
.byte ITEM_EFFECT_FOCUSBAND, 10 
.word str_item_description_196 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Glücks-Ei",14
.hword 0xC5, 200 
.byte ITEM_EFFECT_LUCKYEGG, 0 
.word str_item_description_197 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Scope-Linse",14
.hword 0xC6, 200 
.byte ITEM_EFFECT_SCOPELENS, 0 
.word str_item_description_198 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Metallmantel",14
.hword 0xC7, 100 
.byte ITEM_EFFECT_METALCOAT, 20 
.word str_item_description_199 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Überreste",14
.hword 0xC8, 200 
.byte ITEM_EFFECT_LEFTOVERS, 10 
.word str_item_description_200 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Drachenhaut",14
.hword 0xC9, 2100 
.byte ITEM_EFFECT_DRAGONSCALE, 10 
.word str_item_description_201 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kugelblitz",14
.hword 0xCA, 100 
.byte ITEM_EFFECT_LIGHTBALL, 0 
.word str_item_description_202 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pudersand",14
.hword 0xCB, 100 
.byte ITEM_EFFECT_SOFTSAND, 20 
.word str_item_description_203 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Granitstein",14
.hword 0xCC, 100 
.byte ITEM_EFFECT_HARDSTONE, 20 
.word str_item_description_204 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wundersaat",14
.hword 0xCD, 100 
.byte ITEM_EFFECT_MIRACLESEED, 20 
.word str_item_description_205 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schattenglas",14
.hword 0xCE, 100 
.byte ITEM_EFFECT_BLACKGLASSES, 20 
.word str_item_description_206 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schwarzgurt",14
.hword 0xCF, 100 
.byte ITEM_EFFECT_BLACKBELT, 20 
.word str_item_description_207 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Magnet",14
.hword 0xD0, 100 
.byte ITEM_EFFECT_MAGNET, 20 
.word str_item_description_208 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zauberwasser",14
.hword 0xD1, 100 
.byte ITEM_EFFECT_MYSTICWATER, 20 
.word str_item_description_209 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Hackattack",14
.hword 0xD2, 100 
.byte ITEM_EFFECT_SHARPBEAK, 20 
.word str_item_description_210 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Giftstich",14
.hword 0xD3, 100 
.byte ITEM_EFFECT_POISONBARB, 20 
.word str_item_description_211 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ewiges Eis",14
.hword 0xD4, 100 
.byte ITEM_EFFECT_NEVERMELTICE, 20 
.word str_item_description_212 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Bannsticker",14
.hword 0xD5, 100 
.byte ITEM_EFFECT_SPELLTAG, 20 
.word str_item_description_213 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Krummlöffel",14
.hword 0xD6, 100 
.byte ITEM_EFFECT_TWISTEDSPOON, 20 
.word str_item_description_214 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Holzkohle",14
.hword 0xD7, 100 
.byte ITEM_EFFECT_CHARCOAL, 20 
.word str_item_description_215 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Drachenzahn",14
.hword 0xD8, 100 
.byte ITEM_EFFECT_DRAGONFANG, 20 
.word str_item_description_216 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Seidenschal",14
.hword 0xD9, 100 
.byte ITEM_EFFECT_SILKSCARF, 20 
.word str_item_description_217 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Upgrade",14
.hword 0xDA, 2100 
.byte ITEM_EFFECT_UPGRADE, 0 
.word str_item_description_218 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Seegesang",14
.hword 0xDB, 200 
.byte ITEM_EFFECT_SHELLBELL, 8 
.word str_item_description_219 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Seerauch",14
.hword 0xDC, 9600 
.byte ITEM_EFFECT_MYSTICWATER, 10 
.word str_item_description_220 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Laxrauch",14
.hword 0xDD, 9600 
.byte ITEM_EFFECT_BRIGHTPOWDER, 10 
.word str_item_description_221 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lucky Punch",14
.hword 0xDE, 10 
.byte ITEM_EFFECT_LUCKYPUNCH, 0 
.word str_item_description_222 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Metallstaub",14
.hword 0xDF, 10 
.byte ITEM_EFFECT_METALPOWDER, 0 
.word str_item_description_223 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kampfknochen",14
.hword 0xE0, 500 
.byte ITEM_EFFECT_THICKCLUB, 0 
.word str_item_description_224 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lauchstange",14
.hword 0xE1, 200 
.byte ITEM_EFFECT_STICK, 0 
.word str_item_description_225 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Akku",14
.hword 0xE2, 200 
.byte ITEM_EFFECT_CELLBATTERY, 0 
.word str_item_description_226 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Beulenhelm",14
.hword 0xE3, 200 
.byte ITEM_EFFECT_ROCKYHELMET, 0 
.word str_item_description_227 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisbrocken",14
.hword 0xE4, 200 
.byte ITEM_EFFECT_ICYROCK, 0 
.word str_item_description_228 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Glattbrocken",14
.hword 0xE5, 200 
.byte ITEM_EFFECT_SMOOTHROCK, 0 
.word str_item_description_229 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Heißbrocken",14
.hword 0xE6, 200 
.byte ITEM_EFFECT_HEATROCK, 0 
.word str_item_description_230 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nassbrocken",14
.hword 0xE7, 200 
.byte ITEM_EFFECT_DAMPROCK, 0 
.word str_item_description_231 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisenkugel",14
.hword 0xE8, 200 
.byte ITEM_EFFECT_IRONBALL, 0 
.word str_item_description_232 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Evolith",14
.hword 0xE9, 1000 
.byte ITEM_EFFECT_EVIOLITE, 0 
.word str_item_description_233 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fatumknoten",14
.hword 0xEA, 200 
.byte ITEM_EFFECT_DESTINYKNOT, 0 
.word str_item_description_234 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fluchtknopf",14
.hword 0xEB, 200 
.byte ITEM_EFFECT_EJECTBUTTON, 0 
.word str_item_description_235 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Giftschleim",14
.hword 0xEC, 200 
.byte ITEM_EFFECT_BLACKSLUDGE, 10 
.word str_item_description_236 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Großlinse",14
.hword 0xED, 200 
.byte ITEM_EFFECT_WIDELENS, 0 
.word str_item_description_237 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schlauglas",14
.hword 0xEE, 200 
.byte ITEM_EFFECT_WISEGLASSES, 0 
.word str_item_description_238 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zoomlinse",14
.hword 0xEF, 200 
.byte ITEM_EFFECT_ZOOMLENS, 0 
.word str_item_description_239 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Griffklaue",14
.hword 0xF0, 200 
.byte ITEM_EFFECT_GRIPCLAW, 0 
.word str_item_description_240 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Großwurzel",14
.hword 0xF1, 200 
.byte ITEM_EFFECT_BIGROOT, 0 
.word str_item_description_241 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Expertengurt",14
.hword 0xF2, 200 
.byte ITEM_EFFECT_EXPERTBELT, 0 
.word str_item_description_242 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fokusgurt",14
.hword 0xF3, 200 
.byte ITEM_EFFECT_FOCUSSASH, 0 
.word str_item_description_243 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Klammerband",14
.hword 0xF4, 200 
.byte ITEM_EFFECT_BINDINGBAND, 0 
.word str_item_description_244 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Klettdorn",14
.hword 0xF5, 200 
.byte ITEM_EFFECT_STICKYBARB, 0 
.word str_item_description_245 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Knolle",14
.hword 0xF6, 200 
.byte ITEM_EFFECT_ABSORBBULB, 0 
.word str_item_description_246 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Energiekraut",14
.hword 0xF7, 200 
.byte ITEM_EFFECT_POWERHERB, 0 
.word str_item_description_247 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Leichtstein",14
.hword 0xF8, 200 
.byte ITEM_EFFECT_FLOATSTONE, 0 
.word str_item_description_248 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Leuchtmoos",14
.hword 0xF9, 200 
.byte ITEM_EFFECT_LUMINOUSMOSS, 0 
.word str_item_description_249 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lichtlehm",14
.hword 0xFA, 200 
.byte ITEM_EFFECT_LIGHTCLAY, 0 
.word str_item_description_250 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Luftballon",14
.hword 0xFB, 200 
.byte ITEM_EFFECT_AIRBALLOON, 0 
.word str_item_description_251 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Metronom",14
.hword 0xFC, 200 
.byte ITEM_EFFECT_METRONOME, 0 
.word str_item_description_252 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Muskelband",14
.hword 0xFD, 200 
.byte ITEM_EFFECT_MUSCLEBAND, 0 
.word str_item_description_253 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Offen.weste",14
.hword 0xFE, 200 
.byte ITEM_EFFECT_ASSAULTVEST, 0 
.word str_item_description_254 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Heiß-Orb",14
.hword 0xFF, 200 
.byte ITEM_EFFECT_FLAMEORB, 0 
.word str_item_description_255 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Leben-Orb",14
.hword 0x100, 200 
.byte ITEM_EFFECT_LIFEORB, 30 
.word str_item_description_256 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Toxik-Orb",14
.hword 0x101, 200 
.byte ITEM_EFFECT_TOXICORB, 0 
.word str_item_description_257 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rote Karte",14
.hword 0x102, 200 
.byte ITEM_EFFECT_REDCARD, 0 
.word str_item_description_258 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Scharfklaue",14
.hword 0x103, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_259 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Scharfzahn",14
.hword 0x104, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_260 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schneeball",14
.hword 0x105, 200 
.byte ITEM_EFFECT_SNOWBALL, 0 
.word str_item_description_261 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schutzbrille",14
.hword 0x106, 1000 
.byte ITEM_EFFECT_SAFETYGOOGLES, 0 
.word str_item_description_262 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schw.schutz",14
.hword 0x107, 1000 
.byte ITEM_EFFECT_WEAKNESSPOLICY, 0 
.word str_item_description_263 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schwerschwf.",14
.hword 0x108, 200 
.byte ITEM_EFFECT_LAGGINGTAIL, 0 
.word str_item_description_264 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wahlglas",14
.hword 0x109, 200 
.byte ITEM_EFFECT_CHOICESPECS, 1 
.word str_item_description_265 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wahlschal",14
.hword 0x10A, 200 
.byte ITEM_EFFECT_CHOICESCARF, 2 
.word str_item_description_266 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wechselhülle",14
.hword 0x10B, 100 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_267 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zielscheibe",14
.hword 0x10C, 200 
.byte ITEM_EFFECT_RINGTARGET, 0 
.word str_item_description_268 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Bodenjuwel",14
.hword 0x10D, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_269 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Drakojuwel",14
.hword 0x10E, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_270 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisjuwel",14
.hword 0x10F, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_271 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Elektrojuwel",14
.hword 0x110, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_272 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Geistjuwel",14
.hword 0x111, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_273 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gesteinjuwel",14
.hword 0x112, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_274 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Giftjuwel",14
.hword 0x113, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_275 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feuerjuwel",14
.hword 0x114, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_276 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flugjuwel",14
.hword 0x115, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_277 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Käferjuwel",14
.hword 0x116, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_278 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kampfjuwel",14
.hword 0x117, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_279 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Normaljuwel",14
.hword 0x118, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_280 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pflanzjuwel",14
.hword 0x119, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_281 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Psychojuwel",14
.hword 0x11A, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_282 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Stahljuwel",14
.hword 0x11B, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_283 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Unlichtjuwel",14
.hword 0x11C, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_284 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wasserjuwel",14
.hword 0x11D, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_285 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feenjuwel",14
.hword 0x11E, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 50 
.word str_item_description_286 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wahrspiegel",14
.hword 0x11F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_287 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gracidea",14
.hword 0x120, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_288 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 71",14
.hword 0x121, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_289 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 72",14
.hword 0x122, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_290 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 73",14
.hword 0x123, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_291 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 74",14
.hword 0x124, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_292 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 75",14
.hword 0x125, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_293 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 76",14
.hword 0x126, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_294 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 77",14
.hword 0x127, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_295 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 78",14
.hword 0x128, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_296 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 79",14
.hword 0x129, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_297 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 80",14
.hword 0x12A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_298 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 81",14
.hword 0x12B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_299 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 82",14
.hword 0x12C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_300 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 83",14
.hword 0x12D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_301 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 84",14
.hword 0x12E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_302 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 85",14
.hword 0x12F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_303 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 86",14
.hword 0x130, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_304 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 87",14
.hword 0x131, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_305 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 88",14
.hword 0x132, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_306 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 89",14
.hword 0x133, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_307 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 90",14
.hword 0x134, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_308 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 91",14
.hword 0x135, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_309 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 92",14
.hword 0x136, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_310 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 93",14
.hword 0x137, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_311 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 94",14
.hword 0x138, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_312 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 95",14
.hword 0x139, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_313 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 96",14
.hword 0x13A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_314 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 97",14
.hword 0x13B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_315 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 98",14
.hword 0x13C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_316 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 99",14
.hword 0x13D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_317 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 100",14
.hword 0x13E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_318 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 101",14
.hword 0x13F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_319 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 102",14
.hword 0x140, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_320 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 103",14
.hword 0x141, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_321 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 104",14
.hword 0x142, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_322 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 105",14
.hword 0x143, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_323 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 106",14
.hword 0x144, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_324 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 107",14
.hword 0x145, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_325 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 108",14
.hword 0x146, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_326 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 109",14
.hword 0x147, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_327 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 110",14
.hword 0x148, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_328 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 111",14
.hword 0x149, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_329 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 112",14
.hword 0x14A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_330 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 113",14
.hword 0x14B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_331 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 114",14
.hword 0x14C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_332 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 115",14
.hword 0x14D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_333 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 116",14
.hword 0x14E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_334 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 117",14
.hword 0x14F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_335 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 118",14
.hword 0x150, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_336 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 119",14
.hword 0x151, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_337 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 120",14
.hword 0x152, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_338 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 01",14
.hword 0x153, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_339 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 02",14
.hword 0x154, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_340 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 03",14
.hword 0x155, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_341 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 04",14
.hword 0x156, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_342 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 05",14
.hword 0x157, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_343 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 06",14
.hword 0x158, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_344 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 07",14
.hword 0x159, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_345 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM 08",14
.hword 0x15A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_346 
.byte 1, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Helixfossil",14
.hword 0x15B, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_347 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Domfossil",14
.hword 0x15C, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_348 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Altbernstein",14
.hword 0x15D, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_349 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Klauenfossil",14
.hword 0x15E, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_350 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wurzelfossil",14
.hword 0x15F, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_351 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kopffossil",14
.hword 0x160, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_352 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Panzerfossil",14
.hword 0x161, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_353 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schildfossil",14
.hword 0x162, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_354 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Federfossil",14
.hword 0x163, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_355 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kieferfossil",14
.hword 0x164, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_356 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flossenfos.",14
.hword 0x165, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_357 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Meteorit",14
.hword 0x166, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_358 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "DNS-Keil",14
.hword 0x167, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_359 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fahrrad",14
.hword 0x168, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_360 
.byte 1, 1, 2, 2 
.word 0x80A122D 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Karte",14
.hword 0x169, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_361 
.byte 1, 1, 2, 4 
.word 0x80A1C61 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kampffahnder",14
.hword 0x16A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_362 
.byte 1, 1, 2, 4 
.word 0x80A1D9D 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ruhmesdatei",14
.hword 0x16B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_363 
.byte 1, 1, 2, 4 
.word 0x80A1CF9 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "VM/TM-Box",14
.hword 0x16C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_364 
.byte 1, 1, 2, 4 
.word 0x80A1789 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Beerentüte",14
.hword 0x16D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_365 
.byte 1, 1, 2, 4 
.word 0x80A1821 
.byte 3, 0, 0, 0 
.word 0x80A18B9 
.byte 0, 0, 0, 0 

.string LAN_DE "Itemradar",14
.hword 0x16E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_366 
.byte 1, 1, 2, 2 
.word 0x80A1439 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Münzkorb",14
.hword 0x16F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_367 
.byte 1, 1, 2, 4 
.word 0x80A1461 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pokéflöte",14
.hword 0x170, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_368 
.byte 1, 1, 2, 4 
.word 0x80A156D 
.byte 2, 0, 0, 0 
.word 0x80A1E65 
.byte 0, 0, 0, 0 

.string LAN_DE "Angel",14
.hword 0x171, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_369 
.byte 1, 1, 2, 2 
.word 0x80A1339 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Profiangel",14
.hword 0x172, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_370 
.byte 1, 1, 2, 2 
.word 0x80A1339 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 1, 0, 0, 0 

.string LAN_DE "Superangel",14
.hword 0x173, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_371 
.byte 1, 1, 2, 2 
.word 0x80A1339 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 2, 0, 0, 0 

.string LAN_DE "Entonkanne",14
.hword 0x174, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_372 
.byte 1, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wüstenglas",14
.hword 0x175, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_373 
.byte 1, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Silph Scope",14
.hword 0x176, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_374 
.byte 1, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 01",14
.hword 0x177, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_375 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 02",14
.hword 0x178, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_376 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 03",14
.hword 0x179, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_377 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 04",14
.hword 0x17A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_378 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 05",14
.hword 0x17B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_379 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 06",14
.hword 0x17C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_380 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 07",14
.hword 0x17D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_381 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 08",14
.hword 0x17E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_382 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 09",14
.hword 0x17F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_383 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 10",14
.hword 0x180, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_384 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 11",14
.hword 0x181, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_385 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 12",14
.hword 0x182, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_386 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 13",14
.hword 0x183, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_387 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 14",14
.hword 0x184, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_388 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 15",14
.hword 0x185, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_389 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 16",14
.hword 0x186, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_390 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 17",14
.hword 0x187, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_391 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 18",14
.hword 0x188, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_392 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 19",14
.hword 0x189, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_393 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 20",14
.hword 0x18A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_394 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 21",14
.hword 0x18B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_395 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 22",14
.hword 0x18C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_396 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 23",14
.hword 0x18D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_397 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 24",14
.hword 0x18E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_398 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 25",14
.hword 0x18F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_399 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 26",14
.hword 0x190, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_400 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 27",14
.hword 0x191, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_401 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 28",14
.hword 0x192, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_402 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 29",14
.hword 0x193, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_403 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 30",14
.hword 0x194, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_404 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 31",14
.hword 0x195, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_405 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 32",14
.hword 0x196, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_406 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 33",14
.hword 0x197, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_407 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 34",14
.hword 0x198, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_408 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 35",14
.hword 0x199, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_409 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 36",14
.hword 0x19A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_410 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 37",14
.hword 0x19B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_411 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 38",14
.hword 0x19C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_412 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 39",14
.hword 0x19D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_413 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 40",14
.hword 0x19E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_414 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 41",14
.hword 0x19F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_415 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 42",14
.hword 0x1A0, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_416 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 43",14
.hword 0x1A1, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_417 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 44",14
.hword 0x1A2, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_418 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 45",14
.hword 0x1A3, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_419 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 46",14
.hword 0x1A4, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_420 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 47",14
.hword 0x1A5, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_421 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 48",14
.hword 0x1A6, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_422 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 49",14
.hword 0x1A7, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_423 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 50",14
.hword 0x1A8, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_424 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 51",14
.hword 0x1A9, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_425 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 52",14
.hword 0x1AA, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_426 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 53",14
.hword 0x1AB, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_427 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 54",14
.hword 0x1AC, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_428 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 55",14
.hword 0x1AD, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_429 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 56",14
.hword 0x1AE, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_430 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 57",14
.hword 0x1AF, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_431 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 58",14
.hword 0x1B0, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_432 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 59",14
.hword 0x1B1, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_433 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 60",14
.hword 0x1B2, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_434 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 61",14
.hword 0x1B3, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_435 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 62",14
.hword 0x1B4, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_436 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 63",14
.hword 0x1B5, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_437 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 64",14
.hword 0x1B6, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_438 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 65",14
.hword 0x1B7, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_439 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 66",14
.hword 0x1B8, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_440 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 67",14
.hword 0x1B9, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_441 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 68",14
.hword 0x1BA, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_442 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 69",14
.hword 0x1BB, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_443 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TM 70",14
.hword 0x1BC, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_444 
.byte 0, 0, 4, 1 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Angriff 2",14
.hword 0x1BD, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_445 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Abwehr 2",14
.hword 0x1BE, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_446 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Tempo 2",14
.hword 0x1BF, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_447 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Treffer 2",14
.hword 0x1C0, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_448 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Spezial 2",14
.hword 0x1C1, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_449 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Sp.Vert. 2",14
.hword 0x1C2, 1500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_450 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Angriff 3",14
.hword 0x1C3, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_451 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Abwehr 3",14
.hword 0x1C4, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_452 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Tempo 3",14
.hword 0x1C5, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_453 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Treffer 3",14
.hword 0x1C6, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_454 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Spezial 3",14
.hword 0x1C7, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_455 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Sp.Vert. 3",14
.hword 0x1C8, 2500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_456 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Angriff 6",14
.hword 0x1C9, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_457 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Abwehr 6",14
.hword 0x1CA, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_458 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Tempo 6",14
.hword 0x1CB, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_459 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Treffer 6",14
.hword 0x1CC, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_460 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Spezial 6",14
.hword 0x1CD, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_461 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "X-Sp.Vert. 6",14
.hword 0x1CE, 6500 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_462 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 2, 0, 0, 0 
.word 0x80A1E7D 
.byte 0, 0, 0, 0 

.string LAN_DE "Adamant-Orb",14
.hword 0x1CF, 65000 
.byte ITEM_EFFECT_ADAMANTORB, 0 
.word str_item_description_463 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flottstaub",14
.hword 0x1D0, 10 
.byte ITEM_EFFECT_QUICKPOWDER, 0 
.word str_item_description_464 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Platinum-Orb",14
.hword 0x1D1, 65000 
.byte ITEM_EFFECT_GRISEOUSORB, 0 
.word str_item_description_465 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Weiß-Orb",14
.hword 0x1D2, 65000 
.byte ITEM_EFFECT_LUSTROUSORB, 0 
.word str_item_description_466 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Blitztafel",14
.hword 0x1D3, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_467 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Dracotafel",14
.hword 0x1D4, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_468 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisentafel",14
.hword 0x1D5, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_469 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Erdtafel",14
.hword 0x1D6, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_470 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fausttafel",14
.hword 0x1D7, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_471 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feentafel",14
.hword 0x1D8, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_472 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feuertafel",14
.hword 0x1D9, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_473 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Frosttafel",14
.hword 0x1DA, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_474 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Furchtafel",14
.hword 0x1DB, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_475 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gifttafel",14
.hword 0x1DC, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_476 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Hirntafel",14
.hword 0x1DD, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_477 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Käfertafel",14
.hword 0x1DE, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_478 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Spuktafel",14
.hword 0x1DF, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_479 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Steintafel",14
.hword 0x1E0, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_480 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wassertafel",14
.hword 0x1E1, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_481 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wiesentafel",14
.hword 0x1E2, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_482 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wolkentafel",14
.hword 0x1E3, 2000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 30 
.word str_item_description_483 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Aquamodul",14
.hword 0x1E4, 1000 
.byte ITEM_EFFECT_DOUSEDRIVE, 0 
.word str_item_description_484 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Blitzmodul",14
.hword 0x1E5, 1000 
.byte ITEM_EFFECT_SHOCKDRIVE, 0 
.word str_item_description_485 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flammenmodul",14
.hword 0x1E6, 1000 
.byte ITEM_EFFECT_BURNDRIVE, 0 
.word str_item_description_486 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gefriermodul",14
.hword 0x1E7, 1000 
.byte ITEM_EFFECT_CHILLDRIVE, 0 
.word str_item_description_487 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Absolnit",14
.hword 0x1E8, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_488 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Aeroda.onit",14
.hword 0x1E9, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_489 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Altarianit",14
.hword 0x1EA, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_490 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ampharosnit",14
.hword 0x1EB, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_491 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Banetteonit",14
.hword 0x1EC, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_492 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Bibornit",14
.hword 0x1ED, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_493 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Bisaflornit",14
.hword 0x1EE, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_494 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Brutal.nit",14
.hword 0x1EF, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_495 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Cameruptnit",14
.hword 0x1F0, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_496 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Despotarnit",14
.hword 0x1F1, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_497 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Diancienit",14
.hword 0x1F2, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_498 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Firnontornit",14
.hword 0x1F3, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_499 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flunkifernit",14
.hword 0x1F4, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_500 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Galagladinit",14
.hword 0x1F5, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_501 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Garadosnit",14
.hword 0x1F6, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_502 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gengarnit",14
.hword 0x1F7, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_503 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gewaldronit",14
.hword 0x1F8, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_504 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gluraknit X",14
.hword 0x1F9, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_505 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gluraknit Y",14
.hword 0x1FA, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_506 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Guardevoirn.",14
.hword 0x1FB, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_507 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Hundemonit",14
.hword 0x1FC, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_508 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kangamanit",14
.hword 0x1FD, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_509 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Knakracknit",14
.hword 0x1FE, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_510 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lahmusnit",14
.hword 0x1FF, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_511 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Latiasnit",14
.hword 0x200, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_512 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Latiosnit",14
.hword 0x201, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_513 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lohgocknit",14
.hword 0x202, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_514 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lucarionit",14
.hword 0x203, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_515 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Meditalisnit",14
.hword 0x204, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_516 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Metagrossnit",14
.hword 0x205, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_517 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mewtunit X",14
.hword 0x206, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_518 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mewtunit Y",14
.hword 0x207, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_519 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ohrdochnit",14
.hword 0x208, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_520 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pinsirnit",14
.hword 0x209, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_521 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rexblisarnit",14
.hword 0x20A, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_522 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Scheroxnit",14
.hword 0x20B, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_523 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schlapornit",14
.hword 0x20C, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_524 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Simsalanit",14
.hword 0x20D, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_525 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Skarabornit",14
.hword 0x20E, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_526 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Stahlosnit",14
.hword 0x20F, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_527 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Stollossnit",14
.hword 0x210, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_528 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sumpexnit",14
.hword 0x211, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_529 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Taubossnit",14
.hword 0x212, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_530 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tohaidonit",14
.hword 0x213, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_531 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Turtoknit",14
.hword 0x214, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_532 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Voltensonit",14
.hword 0x215, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_533 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zobirisnit",14
.hword 0x216, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_534 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "R. Edelstein",14
.hword 0x217, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_535 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "B. Edelstein",14
.hword 0x218, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_536 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ä. Edelstein",14
.hword 0x219, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_537 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Glücksrauch",14
.hword 0x21A, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_538 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lahmrauch",14
.hword 0x21B, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_539 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rosenrauch",14
.hword 0x21C, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_540 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Scheuchrauch",14
.hword 0x21D, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_541 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schrägrauch",14
.hword 0x21E, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_542 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Steinrauch",14
.hword 0x21F, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_543 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wellenrauch",14
.hword 0x220, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_544 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtband",14
.hword 0x221, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_545 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtgewicht",14
.hword 0x222, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_546 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtgurt",14
.hword 0x223, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_547 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtkette",14
.hword 0x224, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_548 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtlinse",14
.hword 0x225, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_549 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Machtreif",14
.hword 0x226, 3000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_550 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Atemgerät",14
.hword 0x227, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_551 
.byte 1, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gischtglocke",14
.hword 0x228, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_552 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Klarglocke",14
.hword 0x229, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_553 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mega-Armreif",14
.hword 0x22A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_554 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Levelball",14
.hword 0x22B, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_555 
.byte 0, 0, 3, 20 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Köderball",14
.hword 0x22C, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_556 
.byte 0, 0, 3, 22 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Mondball",14
.hword 0x22D, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_557 
.byte 0, 0, 3, 23 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Freundesball",14
.hword 0x22E, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_558 
.byte 0, 0, 3, 18 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Turboball",14
.hword 0x22F, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_559 
.byte 0, 0, 3, 17 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Schwerball",14
.hword 0x230, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_560 
.byte 0, 0, 3, 19 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Sympalball",14
.hword 0x231, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_561 
.byte 0, 0, 3, 21 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Turnierball",14
.hword 0x232, 600 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_562 
.byte 0, 0, 3, 2 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Heilball",14
.hword 0x233, 300 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_563 
.byte 0, 0, 3, 15 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Finsterball",14
.hword 0x234, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_564 
.byte 0, 0, 3, 13 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Jubelball",14
.hword 0x235, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_565 
.byte 0, 0, 3, 16 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Flottball",14
.hword 0x236, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_566 
.byte 0, 0, 3, 12 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Parkball",14
.hword 0x237, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_567 
.byte 0, 0, 3, 14 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Traumball",14
.hword 0x238, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_568 
.byte 0, 0, 3, 0 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Alter Heller",14
.hword 0x239, 10000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_569 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alter Taler",14
.hword 0x23A, 20000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_570 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alter Dukat",14
.hword 0x23B, 30000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_571 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alte Vase",14
.hword 0x23C, 40000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_572 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alter Reif",14
.hword 0x23D, 50000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_573 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alte Statue",14
.hword 0x23E, 60000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_574 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Alte Krone",14
.hword 0x23F, 65000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_575 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nugget",14
.hword 0x240, 5000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_576 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Riesennugget",14
.hword 0x241, 10000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_577 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Triperle",14
.hword 0x242, 30000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_578 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Duftpilz",14
.hword 0x243, 6250 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_579 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Spiritkern",14
.hword 0x244, 1050 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_580 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Steinknochen",14
.hword 0x245, 30000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_581 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Azurflöte",14
.hword 0x246, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_582 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Skulptur",14
.hword 0x247, 10 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_583 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kometstück",14
.hword 0x248, 8000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_584 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Dubiosdisc",14
.hword 0x249, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_585 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Duftbeutel",14
.hword 0x24A, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_586 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Düsterumhang",14
.hword 0x24B, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_587 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Magmaisierer",14
.hword 0x24C, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_588 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ovaler Stein",14
.hword 0x24D, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_589 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sahnehäubch.",14
.hword 0x24E, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_590 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schönschuppe",14
.hword 0x24F, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_591 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schützer",14
.hword 0x250, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_592 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Stromisierer",14
.hword 0x251, 15000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_593 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rote Kugel",14
.hword 0x252, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_594 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Blaue Kugel",14
.hword 0x253, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_595 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Grüne Kugel",14
.hword 0x254, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_596 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Magmastein",14
.hword 0x255, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_597 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lunarfeder",14
.hword 0x256, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_598 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Dunkelstein",14
.hword 0x257, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_599 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Lichtstein",14
.hword 0x258, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_600 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Geheimtrank",14
.hword 0x259, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_601 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Meteorstück",14
.hword 0x25A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_602 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Buntschwinge",14
.hword 0x25B, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_603 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Silberflügel",14
.hword 0x25C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_604 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Bootsticket",14
.hword 0x25D, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_605 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Tarnanzug",14
.hword 0x25E, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_606 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fahrschein",14
.hword 0x25F, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_607 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "TMVM-Box",14
.hword 0x260, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_608 
.byte 1, 1, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Rote Kette",14
.hword 0x261, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_609 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Talisman",14
.hword 0x262, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_610 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mytokristall",14
.hword 0x263, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_611 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fäh.-Appell",14
.hword 0x264, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_612 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Itemabwurf",14
.hword 0x265, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_613 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Itemappell",14
.hword 0x266, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_614 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Umkehrappell",14
.hword 0x267, 1500 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_615 
.byte 0, 0, 1, 1 
.word 0x80A16E1 
.byte 1, 0, 0, 0 
.word 0x80A1FBD 
.byte 0, 0, 0, 0 

.string LAN_DE "Ovalpin",14
.hword 0x268, 0 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_616 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schillerpin",14
.hword 0x269, 0 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_617 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Äon-Flöte",14
.hword 0x26A, 0 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_618 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Normium Z",14
.hword 0x26B, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_619 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pyrium Z",14
.hword 0x26C, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_620 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Aquium Z",14
.hword 0x26D, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_621 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Voltium Z",14
.hword 0x26E, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_622 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Botanium Z",14
.hword 0x26F, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_623 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Glacium Z",14
.hword 0x270, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_624 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Battalium Z",14
.hword 0x271, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_625 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Toxium Z",14
.hword 0x272, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_626 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Terrium Z",14
.hword 0x273, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_627 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Aerium Z",14
.hword 0x274, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_628 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Psium Z",14
.hword 0x275, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_629 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Insectium Z",14
.hword 0x276, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_630 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Petrium Z",14
.hword 0x277, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_631 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Phantomium Z",14
.hword 0x278, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_632 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Dracium Z",14
.hword 0x279, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_633 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Noctium Z",14
.hword 0x27A, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_634 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Metallium Z",14
.hword 0x27B, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_635 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sylphium Z",14
.hword 0x27C, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_636 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Pikachium Z",14
.hword 0x27D, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_637 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Silberkorken",14
.hword 0x27E, 5000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_638 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Goldkorken",14
.hword 0x27F, 10000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_639 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Z-Ring",14
.hword 0x280, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_640 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Silvarron. Z",14
.hword 0x281, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_641 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Fuegronium Z",14
.hword 0x282, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_642 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Primaren. Z",14
.hword 0x283, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_643 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kapium Z",14
.hword 0x284, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_644 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "A-Raichun. Z",14
.hword 0x285, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_645 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Relaxonium Z",14
.hword 0x286, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_646 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Evolium Z",14
.hword 0x287, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_647 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mewnium Z",14
.hword 0x288, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_648 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ash-Pika. Z",14
.hword 0x289, 100 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_649 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Glitzerstein",14
.hword 0x28A, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_650 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Zitterorb",14
.hword 0x28B, 200 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_651 
.byte 0, 0, 1, 1 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Z-Würfel",14
.hword 0x28C, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_652 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eisstein",14
.hword 0x28D, 15000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_653 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Ultraball",14
.hword 0x28E, 1000 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_654 
.byte 0, 0, 3, 23 
.word 0x0 
.byte 2, 0, 0, 0 
.word 0x80A1E1D 
.byte 0, 0, 0, 0 

.string LAN_DE "Nektar-Rot",14
.hword 0x28F, 300 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_655 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nektar-Gelb",14
.hword 0x290, 300 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_656 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nektar-Rosa",14
.hword 0x291, 300 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_657 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nektar-Purp.",14
.hword 0x292, 300 
.byte ITEM_EFFECT_EMPTY_EFFECT, 0 
.word str_item_description_658 
.byte 0, 0, 1, 1 
.word 0x80A1751 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Sonnenflöte",14
.hword 0x293, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_659 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Mondflöte",14
.hword 0x294, 0 
.byte ITEM_EFFECT_NOEFFECT, 0 
.word str_item_description_660 
.byte 0, 0, 2, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feldschicht",14
.hword 0x295, 100 
.byte ITEM_EFFECT_EMPTY_EFFECT, 20 
.word str_item_description_661 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Schutzpolst.",14
.hword 0x296, 100 
.byte ITEM_EFFECT_EMPTY_EFFECT, 20 
.word str_item_description_662 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Elekt.-Samen",14
.hword 0x297, 4000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 20 
.word str_item_description_663 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Psycho-Samen",14
.hword 0x298, 4000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 20 
.word str_item_description_664 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Nebel-Samen",14
.hword 0x299, 4000 
.byte ITEM_EFFECT_EMPTY_EFFECT, 20 
.word str_item_description_665 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gras-Samen",14
.hword 0x29A, 4000 
.byte ITEM_EFFECT_NOEFFECT, 20 
.word str_item_description_666 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Kampf-Disc",14
.hword 0x29B, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_667 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Flug-Disc",14
.hword 0x29C, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_668 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gift-Disc",14
.hword 0x29D, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_669 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Boden-Disc",14
.hword 0x29E, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_670 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Steins-Disc",14
.hword 0x29F, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_671 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Käfer-Disc",14
.hword 0x2A0, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_672 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Geister-Disc",14
.hword 0x2A1, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_673 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Stahl-Disc",14
.hword 0x2A2, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_674 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feuer-Disc",14
.hword 0x2A3, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_675 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Wasser-Disc",14
.hword 0x2A4, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_676 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Gras-Disc",14
.hword 0x2A5, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_677 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Elektro-Disc",14
.hword 0x2A6, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_678 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Psycho-Disc",14
.hword 0x2A7, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_679 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Eis-Disc",14
.hword 0x2A8, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_680 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Drachen-Disc",14
.hword 0x2A9, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_681 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Unlicht-Disc",14
.hword 0x2AA, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_682 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Feen-Disc",14
.hword 0x2AB, 1000 
.byte ITEM_EFFECT_NOEFFECT, 30 
.word str_item_description_683 
.byte 0, 0, 1, 4 
.word 0x80A2239 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Angriffplus2",14
.hword 0x2AC, 0 
.byte 0, 0 
.word str_item_description_684 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 

.string LAN_DE "Angriffplus3",14
.hword 0x2AD, 0 
.byte 0, 0 
.word str_item_description_685 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0 
.word 0x0 
.byte 0, 0, 0, 0