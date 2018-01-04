AS = @arm-none-eabi-as
AR = @arm-none-eabi-ar
LD = @arm-none-eabi-ld
GRIT = @grit

GFX_BUILD_DIR = gfx_build
TMP_LD = $(GFX_BUILD_DIR)/tmp.ld

LDFLAGS   := -z muldefs

ASSET_ROOT = sots-private/assets

SPRITES_BINARY = object/pkmn_sprites.o

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
	rm -f $(GFX_BUILD_DIR)/item/*
	rm -f $(GFX_BUILD_DIR)/trainer_sprites/*


$(SPRITES_BINARY): $(OW_OBJ) $(TS_OBJ) $(ITEM_OBJ)
	@echo -e "\e[1;32mLinking $@\e[0m"
	@echo "INPUT($^)" > $(TMP_LD)
	$(LD) -r -o $@ -T $(TMP_LD)

# Item Targets
$(GFX_BUILD_DIR)/item/%.o: $(GFX_BUILD_DIR)/item/%.s
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/item/%.s
$(GFX_BUILD_DIR)/item/%.s: $(ASSET_ROOT)/item_icons/%.png
	@echo -e "\e[34mProcessing image $<\e[0m"
	$(GRIT) $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -pu16 -o $@

# OW Targets
$(GFX_BUILD_DIR)/overworlds/%.o: $(GFX_BUILD_DIR)/overworlds/%.s
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

.PRECIOUS: $(GFX_BUILD_DIR)/overworlds/%.s
$(GFX_BUILD_DIR)/overworlds/%.s: $(ASSET_ROOT)/overworld/%.png
	@echo -e "\e[34mProcessing image $<\e[0m"
	$(GRIT) $< -fts -fh! -gt -gB4 -gz! -p -pz! -m! -pu16 -o $@

# Trainer Sprite Targets
$(GFX_BUILD_DIR)/trainer_sprites/%.o: $(GFX_BUILD_DIR)/trainer_sprites/%.s
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(GFX_BUILD_DIR)/trainer_sprites/%.s: $(ASSET_ROOT)/trainer_sprites/%.png
	@echo -e "\e[34mProcessing image $<\e[0m"
	$(GRIT) $< -fts -fh! -gt -gB4 -gzl -p -pzl -m! -o $@

# Normal Palette Targets
$(GFX_BUILD_DIR)/sprites/normal_pal/%.o: $(GFX_BUILD_DIR)/sprites/normal_pal/%.s
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(GFX_BUILD_DIR)/sprites/normal_pal/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
	@echo -e "\e[34mProcessing palette $< (normal)\e[0m"
	$(GRIT) $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 16 \
		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/n_p_/g") \
		-o $@


# Shiny Palette Targets
#$(GFX_BUILD_DIR)/sprites/shiny_pal/%.o: $(GFX_BUILD_DIR)/sprites/shiny_pal/%.s
#	@echo -e "\e[32mAssembling $<\e[0m"
#	$(AS) -o $@ $<

#$(GFX_BUILD_DIR)/sprites/shiny_pal/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
#	@echo -e "\e[34mProcessing palette $< (shiny)\e[0m"
#	$(GRIT) $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 16 \
#		-s $(shell echo $(notdir $(basename $<)) | sed "s/shiny_/s_p_/g") \
#		-o $@


# Front Sprite Targets
#$(GFX_BUILD_DIR)/sprites/front_sprites/%.o: $(GFX_BUILD_DIR)/sprites/front_sprites/%.s
#	@echo -e "\e[32mAssembling $<\e[0m"
#	$(AS) -o $@ $<

#$(GFX_BUILD_DIR)/sprites/front_sprites/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
#	@echo -e "\e[34mProcessing sprite $< (front)\e[0m"
#	$(GRIT) $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 64 -m! -p! \
#		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/front_/g") \
#		-o $@


# Back Sprite Targets
#$(GFX_BUILD_DIR)/sprites/back_sprites/%.o: $(GFX_BUILD_DIR)/sprites/bacj_sprites/%.s
#	@echo -e "\e[32mAssembling $<\e[0m"
#	$(AS) -o $@ $<

#$(GFX_BUILD_DIR)/sprites/back_sprites/%.s: $(ASSET_ROOT)/pkmn_sprites/%.png
#	@echo -e "\e[34mProcessing sprite $< (back)\e[0m"
#	$(GRIT) $< -fts -fh! -g -gB 4 -gt -gzl -al 64 -aw 64 -m! -p! \
#		-s $(shell echo $(notdir $(basename $<)) | sed "s/normal_/back_/g") \
#		-o $@


# Misc hardcoded targets
$(NORMAL_CASTFORM_PAL_OBJ): $(NORMAL_CASTFORM_PAL_OBJ:.o=.s)
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(NORMAL_CASTFORM_PAL_OBJ:.o=.s): $(CASTFORM_PNG)
	@echo -e "\e[34mProcessing palette $< (normal)\e[0m"
	$(GRIT) $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 64 \
		-s n_p_0385 -o $@


$(SHINY_CASTFORM_PAL_OBJ): $(SHINY_CASTFORM_PAL_OBJ:.o=.s)
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(SHINY_CASTFORM_PAL_OBJ:.o=.s): $(CASTFORM_PNG)
	@echo -e "\e[34mProcessing palette $< (shiny)\e[0m"
	$(GRIT) $< -fts -fh! -g! -gB 4 -gt -m! -p -pzl -pu16 -pn 64 \
		-s s_p_0385 -o $@


$(CASTFORM_FRONT_OBJ): $(CASTFORM_FRONT_OBJ:.o=.s)
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(CASTFORM_FRONT_OBJ:.o=.s): $(CASTFORM_PNG)
	@echo -e "\e[34mProcessing sprite $< (front)\e[0m"
	$(GRIT) $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 256 -ah 64 -m! -p! \
		-s front_0385 -o $@


$(CASTFORM_BACK_OBJ): $(CASTFORM_BACK_OBJ:.o=.s)
	@echo -e "\e[32mAssembling $<\e[0m"
	$(AS) -o $@ $<

$(CASTFORM_BACK_OBJ:.o=.s): $(CASTFORM_PNG)
	@echo -e "\e[34mProcessing sprite $< (back)\e[0m"
	$(GRIT) $< -fts -fh! -g -gB 4 -gt -gzl -al 0 -aw 256 -at 64 -ah 64 -m! -p! \
		-s back_0385 -o $@

