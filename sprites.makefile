AS = arm-none-eabi-as
AR = arm-none-eabi-ar
LD = arm-none-eabi-ld

GFX_BUILD_DIR = gfx_build
TMP_LD = $(GFX_BUILD_DIR)/tmp.ld

LDFLAGS   := -z muldefs

ASSET_ROOT = sots-private/assets

SPRITES_BINARY = object/pkmn_sprites.o

PNG_TITLE_BG := $(ASSET_ROOT)/misc/title/title_tileset_background.png
PNG_TITLE_AEON := $(ASSET_ROOT)/misc/title/title_tileset_latias_latios_deoxys.png
PNG_TITLE_LOGO := $(ASSET_ROOT)/misc/title/title_tileset_logo_name.png
PNG_TITLE_START := $(ASSET_ROOT)/misc/title/title_tileset_press_start.png
PNG_TITLE_CLOUD := $(ASSET_ROOT)/misc/title/title_sprite_sky.png

PNG_HERO := $(ASSET_ROOT)/misc/char/hero_backsprite.png
PNG_HEROINE := $(ASSET_ROOT)/misc/char/heroine_backsprite.png
PNG_HERO_B := $(ASSET_ROOT)/misc/char/hero_bag.png
PNG_HEROINE_B := $(ASSET_ROOT)/misc/char/heroine_bag.png

S_HERO := $(GFX_BUILD_DIR)/char/hero_backsprite.S
S_HEROINE := $(GFX_BUILD_DIR)/char/heroine_backsprite.S
S_HERO_B := $(GFX_BUILD_DIR)/char/hero_bag.S
S_HEROINE_B := $(GFX_BUILD_DIR)/char/heroine_bag.S

O_HERO := $(GFX_BUILD_DIR)/char/hero_backsprite.o
O_HEROINE := $(GFX_BUILD_DIR)/char/heroine_backsprite.o
O_HERO_B := $(GFX_BUILD_DIR)/char/hero_bag.o
O_HEROINE_B := $(GFX_BUILD_DIR)/char/heroine_bag.o

PNG_BOOT := $(ASSET_ROOT)/misc/boot/boot_tileset.png

S_BOOT := $(GFX_BUILD_DIR)/boot/boot_tileset.S

O_BOOT := $(GFX_BUILD_DIR)/boot/boot_tileset.o

S_TITLE_BG := $(GFX_BUILD_DIR)/title_screen/title_tileset_background.S
S_TITLE_AEON := $(GFX_BUILD_DIR)/title_screen/title_tileset_latias_latios_deoxys.S
S_TITLE_LOGO := $(GFX_BUILD_DIR)/title_screen/title_tileset_logo_name.S
S_TITLE_START := $(GFX_BUILD_DIR)/title_screen/title_tileset_press_start.S
S_TITLE_CLOUD := $(GFX_BUILD_DIR)/title_screen/title_sprite_sky.S

O_TITLE_BG := $(GFX_BUILD_DIR)/title_screen/title_tileset_background.o
O_TITLE_AEON := $(GFX_BUILD_DIR)/title_screen/title_tileset_latias_latios_deoxys.o
O_TITLE_LOGO := $(GFX_BUILD_DIR)/title_screen/title_tileset_logo_name.o
O_TITLE_START := $(GFX_BUILD_DIR)/title_screen/title_tileset_press_start.o
O_TITLE_CLOUD := $(GFX_BUILD_DIR)/title_screen/title_sprite_sky.o

TITLE_OBJ := $(O_TITLE_BG) $(O_TITLE_AEON) $(O_TITLE_LOGO) $(O_TITLE_START) $(O_TITLE_CLOUD)
HERO_OBJ := $(O_HERO) $(O_HEROINE) $(O_HERO_B) $(O_HEROINE_B)

ITEM_PNG = $(sort $(wildcard $(ASSET_ROOT)/item_icons/*.png))
ITEM_OBJ = $(addprefix $(GFX_BUILD_DIR)/item/,$(notdir $(ITEM_PNG:.png=.o)))

NORMAL_PNG = $(sort $(wildcard $(ASSET_ROOT)/pkmn_sprites/normal_*.png))
NORMAL_PAL_OBJ = $(addprefix $(GFX_BUILD_DIR)/sprites/normal_pal/,$(notdir $(NORMAL_PNG:.png=.o)))

SHINY_PNG = $(sort $(wildcard $(ASSET_ROOT)/pkmn_sprites/shiny_*.png))
SHINY_PAL_OBJ = $(addprefix $(GFX_BUILD_DIR)/sprites/shiny_pal/,$(notdir $(SHINY_PNG:.png=.o)))

SPRITE_FRONT_OBJ = $(addprefix $(GFX_BUILD_DIR)/sprites/front_sprites/,$(notdir $(NORMAL_PNG:.png=.o)))
SPRITE_BACK_OBJ = $(addprefix $(GFX_BUILD_DIR)/sprites/back_sprites/,$(notdir $(NORMAL_PNG:.png=.o)))

OW_PNG = $(sort $(wildcard $(ASSET_ROOT)/overworld/*.png))
OW_OBJ = $(addprefix $(GFX_BUILD_DIR)/overworlds/,$(notdir $(OW_PNG:.png=.o)))

TS_PNG = $(sort $(wildcard $(ASSET_ROOT)/trainer_sprites/*.png))
TS_OBJ = $(addprefix $(GFX_BUILD_DIR)/trainer_sprites/,$(notdir $(TS_PNG:.png=.o)))

CASTFORM_PNG = $(ASSET_ROOT)/pkmn_sprites/castform/castform.png
NORMAL_CASTFORM_PAL_OBJ = $(GFX_BUILD_DIR)/sprites/castform/castform_normal_pal.o
SHINY_CASTFORM_PAL_OBJ = $(GFX_BUILD_DIR)/sprites/castform/castform_shiny_pal.o
CASTFORM_FRONT_OBJ = $(GFX_BUILD_DIR)/sprites/castform/castform_front.o
CASTFORM_BACK_OBJ = $(GFX_BUILD_DIR)/sprites/castform/castform_back.o


all: $(SPRITES_BINARY)

.PHONY: clean
clean:
	rm -f $(TMP_FILE) $(GFX_BUILD_DIR)/sprites/castform/*
	rm -f $(GFX_BUILD_DIR)/sprites/normal_pal/*
	rm -f $(GFX_BUILD_DIR)/sprites/shiny_pal/*
	rm -f $(GFX_BUILD_DIR)/sprites/front_sprites/*
	rm -f $(GFX_BUILD_DIR)/sprites/back_sprites/*
	rm -f $(GFX_BUILD_DIR)/overworlds/*

$(SPRITES_BINARY): $(NORMAL_PAL_OBJ) $(HERO_OBJ) $(SHINY_PAL_OBJ) $(SPRITE_FRONT_OBJ) $(SPRITE_BACK_OBJ) $(NORMAL_CASTFORM_PAL_OBJ) $(SHINY_CASTFORM_PAL_OBJ) $(CASTFORM_FRONT_OBJ) $(CASTFORM_BACK_OBJ) $(OW_OBJ) $(TS_OBJ) $(ITEM_OBJ) $(TITLE_OBJ) $(O_BOOT)
	echo "INPUT($^)" > $(TMP_LD)
	$(LD) -r -o $@ -T $(TMP_LD)

# Characters
$(GFX_BUILD_DIR)/char/%.o: $(GFX_BUILD_DIR)/char/%.S
	$(AS) -o $@ $<

$(S_HERO): $(PNG_HERO)
	grit $< -fts -fh! -gt -gB4 -gz! -p -pzl -m! -pu16 -o $@

$(S_HERO_B): $(PNG_HERO_B)
	grit $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -pu16 -o $@

$(S_HEROINE): $(PNG_HEROINE)
	grit $< -fts -fh! -gt -gB4 -gz! -p -pzl -m! -pu16 -o $@

$(S_HEROINE_B): $(PNG_HEROINE_B)
	grit $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -pu16 -o $@


# Boot Screen
$(GFX_BUILD_DIR)/boot/%.o: $(GFX_BUILD_DIR)/boot/%.S
	$(AS) -o $@ $<

$(S_BOOT): $(PNG_BOOT)
	grit $< -fts -fh! -gt -gB4 -gzl -p -pz! -m -mzl -mRtpf -pu16 -o $@

# Special titlescreen targets
$(GFX_BUILD_DIR)/title_screen/%.o: $(GFX_BUILD_DIR)/title_screen/%.S
	$(AS) -o $@ $<

$(S_TITLE_BG): $(PNG_TITLE_BG)
	grit $< -fts -fh! -gt -gB4 -gzl -p! -pz! -m -mzl -mp 4 -mRtf -pu16 -o $@

$(S_TITLE_AEON): $(PNG_TITLE_AEON)
	grit $< -fts -fh! -gt -gB4 -gzl -p! -pz! -m -mzl -mp 2 -mRtf -pu16 -o $@

$(S_TITLE_LOGO): $(PNG_TITLE_LOGO)
	grit $< -fts -fh! -gt -gB8 -gzl -p! -pz! -m -mzl -mRtf -pu16 -o $@

$(S_TITLE_START): $(PNG_TITLE_START)
	grit $< -fts -fh! -gt -gB4 -gzl -p! -pz! -m -mzl -mp 3 -mRtf -pu16 -o $@

$(S_TITLE_CLOUD): $(PNG_TITLE_CLOUD)
	grit $< -fts -fh! -gt -gB4 -gzl -p -pz! -m! -pu16 -o $@



# Item Targets
$(GFX_BUILD_DIR)/item/%.o: $(GFX_BUILD_DIR)/item/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/item/%.s
$(GFX_BUILD_DIR)/item/%.s: $(ASSET_ROOT)/item_icons/%.png
	grit $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -pu16 -o $@

# OW Targets
$(GFX_BUILD_DIR)/overworlds/%.o: $(GFX_BUILD_DIR)/overworlds/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/overworlds/%.s
$(GFX_BUILD_DIR)/overworlds/%.s: $(ASSET_ROOT)/overworld/%.png
	grit $< -fts -fh! -gt -gB4 -gz! -p -pz! -m! -pu16 -o $@

# Trainer Sprite Targets
$(GFX_BUILD_DIR)/trainer_sprites/%.o: $(GFX_BUILD_DIR)/trainer_sprites/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/trainer_sprites/%.s
$(GFX_BUILD_DIR)/trainer_sprites/%.s: $(ASSET_ROOT)/trainer_sprites/%.png
	grit $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -o $@

# Normal Palette Targets
$(GFX_BUILD_DIR)/sprites/normal_pal/%.o: $(GFX_BUILD_DIR)/sprites/normal_pal/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/sprites/normal_pal/%.s
$(GFX_BUILD_DIR)/sprites/normal_pal/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
	grit $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 16 \
		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/n_p_/g") \
		-o $@


# Shiny Palette Targets
$(GFX_BUILD_DIR)/sprites/shiny_pal/%.o: $(GFX_BUILD_DIR)/sprites/shiny_pal/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/sprites/shiny_pal/%.s
$(GFX_BUILD_DIR)/sprites/shiny_pal/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
	grit $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 16 \
		-s $(shell echo $(notdir $(basename $<)) | sed "s/shiny_/s_p_/g") \
		-o $@


# Front Sprite Targets
$(GFX_BUILD_DIR)/sprites/front_sprites/%.o: $(GFX_BUILD_DIR)/sprites/front_sprites/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/sprites/front_sprites/%.s
$(GFX_BUILD_DIR)/sprites/front_sprites/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
	grit $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 64 -m! -p! \
		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/front_/g") \
		-o $@


# Back Sprite Targets
$(GFX_BUILD_DIR)/sprites/back_sprites/%.o: $(GFX_BUILD_DIR)/sprites/bacj_sprites/%.s
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/sprites/back_sprites/%.s
$(GFX_BUILD_DIR)/sprites/back_sprites/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
	grit $< -fts -fh! -g -gB 4 -gt -gzl -al 64 -aw 64 -m! -p! \
		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/back_/g") \
		-o $@


# Misc hardcoded targets
$(NORMAL_CASTFORM_PAL_OBJ): $(NORMAL_CASTFORM_PAL_OBJ:.o=.s)
	$(AS) -o $@ $<

$(NORMAL_CASTFORM_PAL_OBJ:.o=.s): $(CASTFORM_PNG)
	grit $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 64 \
		-s n_p_0385 -o $@


$(SHINY_CASTFORM_PAL_OBJ): $(SHINY_CASTFORM_PAL_OBJ:.o=.s)
	$(AS) -o $@ $<

$(SHINY_CASTFORM_PAL_OBJ:.o=.s): $(CASTFORM_PNG)
	grit $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 64 \
		-s s_p_0385 -o $@


$(CASTFORM_FRONT_OBJ): $(CASTFORM_FRONT_OBJ:.o=.s)
	$(AS) -o $@ $<

$(CASTFORM_FRONT_OBJ:.o=.s): $(CASTFORM_PNG)
	grit $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 256 -ah 64 -m! -p! \
		-s front_0385 -o $@


$(CASTFORM_BACK_OBJ): $(CASTFORM_BACK_OBJ:.o=.s)
	$(AS) -o $@ $<

$(CASTFORM_BACK_OBJ:.o=.s): $(CASTFORM_PNG)
	grit $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 256 -at 64 -ah 64 -m! -p! \
		-s back_0385 -o $@

