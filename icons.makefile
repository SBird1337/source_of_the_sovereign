AS = @arm-none-eabi-as
LD = @arm-none-eabi-ld
AR = @arm-none-eabi-ar
GRIT = @grit

GFX_BUILD_DIR = gfx_build

ICON_AR = object/pkmn_icons.a
I_ASSET_ROOT = sots-private/assets
ICON_FILES = $(wildcard $(I_ASSET_ROOT)/pkmn_icons/*.png)
OBJ_FILES = $(addprefix $(GFX_BUILD_DIR)/icons/,$(notdir $(ICON_FILES:.png=.o)))

all: $(ICON_AR)

.PHONY: clean
clean:
	@echo -e "TRYING TO CLEAN ICONS FROM WRONG MAKEFILE"

#$(ICON_AR): $(OBJ_FILES)
#	@echo -e "\e[1;32mCreating archive $@\e[0m"
#	$(AR) rcs $@ $^

#$(GFX_BUILD_DIR)/icons/%.o: $(GFX_BUILD_DIR)/icons/%.s
#	@echo -e "\e[32mAssembling $<\e[0m"
#	$(AS) -o $@ $<

#$(GFX_BUILD_DIR)/icons/%.s: $(I_ASSET_ROOT)/pkmn_icons/%.png
#	@echo -e "\e[34mProcessing image $<\e[0m"
#	$(GRIT) $< -fts -fh! -g -gB 4 -gt -gz! -m! -p! -s icon_$(notdir $(basename $<)) -o $@
