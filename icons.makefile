AS = arm-none-eabi-as
LD = arm-none-eabi-ld

GFX_BUILD_DIR = gfx_build

ICON_AR = object/pkmn_icons.a
I_ASSET_ROOT = sots-private/assets
ICON_FILES = $(wildcard $(I_ASSET_ROOT)/pkmn_icons/*.png)
OBJ_FILES = $(addprefix $(GFX_BUILD_DIR)/icons/,$(notdir $(ICON_FILES:.png=.o)))

all: $(ICON_AR)

.PHONY: clean
clean:
	rm -f $(ICON_AR) $(GFX_BUILD_DIR)/icons/*

$(ICON_AR): $(OBJ_FILES)
	$(AR) rcs $@ $^

$(GFX_BUILD_DIR)/icons/%.o: $(GFX_BUILD_DIR)/icons/%.s
	$(AS) -o $@ $<

$(GFX_BUILD_DIR)/icons/%.s: $(I_ASSET_ROOT)/pkmn_icons/%.png
	grit $< -fts -fh! -g -gB 4 -gt -gz! -m! -p! -s icon_$(notdir $(basename $<)) -o $@
