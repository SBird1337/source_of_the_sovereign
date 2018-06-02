AS      := @arm-none-eabi-as
LD      := @arm-none-eabi-ld
OBJCOPY := @arm-none-eabi-objcopy
GRIT    := @grit
CC      := @arm-none-eabi-gcc
ARS     := @armips
MAKE    := make
NM      := @arm-none-eabi-nm
PREPROC := @preproc
VBA		:= vba
LAN	:= de
STRAGB	:= string2agb

PYTHON_BIN := $(shell ./python_version.sh)

PYPROJS := $(PYTHON_BIN) ../tools/v_tools/pyproj2s.py
PYMAPS	:= $(PYTHON_BIN) ../tools/v_tools/pymap2s.py
PYSETS	:= $(PYTHON_BIN) ../tools/v_tools/pyset2s.py

export PATH := $(realpath ../tools):$(PATH)
export GCC_COLORS := error=01;31:warning=01;35:note=01;36:range1=32:range2=34:locus=01:quote=01:fixit-insert=32:fixit-delete=31:diff-filename=01:diff-hunk=32:diff-delete=31:diff-insert=32

PAGB_MAIN := g3headers
PAGB_INCLUDE := $(PAGB_MAIN)/build/include
PAGB_LINK := $(PAGB_MAIN)/build/linker/BPRE.ld

AUTO_ASSET_ROOT := sots-private/assets/images

CHARMAP := charmap.txt

DEFINES   := -DBPRE -DSOFTWARE_VERSION=0 -DLAN_DE
ASFLAGS   := -mthumb
CFLAGS    := -mthumb -mthumb-interwork -g -mcpu=arm7tdmi -fdiagnostics-show-option -mlong-calls -march=armv4t -Og -std=c11 -Werror -Wall -Wextra -Wunreachable-code -I$(PAGB_INCLUDE) -Isrc/include -Igenerated_image -fdiagnostics-color=always $(DEFINES)
GRITFLAGS := -ftc -fa
LDFLAGS   := -z muldefs
BLDPATH   := object
OUTPATH	  := build
SOURCEDIR := src
STRINGDIR := string
MAPROOT	  := sots-private/map
MAPMAPS	  := $(MAPROOT)/maps
MAPTS	  := $(MAPROOT)/tileset
MAP_PROJ	:= $(MAPROOT)/sots.json
SCRIPTROOT := $(MAPROOT)/script

MAIN_OBJ  := $(BLDPATH)/linked.o
B_ENGINE  := battle_engine/build/linked.o
SPRITES   := $(BLDPATH)/pkmn_sprites.o
DYN_OVER  := built/dynamic_overworld.o

TMP_LD	  := tmp.ld

SND_ROOT := assets/sound
MUSIC_AR := $(SND_ROOT)/Music/music.a
SMPL_AR  := $(SND_ROOT)/Samples/sample.a
VOICE_AR := $(SND_ROOT)/Voicegroup/voice.a
LIST_AR  := $(SND_ROOT)/Songtable/songlist.a
CRY_AR   := $(SND_ROOT)/Crys/cry.a

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

IMAGES=$(call rwildcard,$(AUTO_ASSET_ROOT),*.png)

TSPNG=$(call rwildcard,$(MAPTS)/,*.png)
TS_GEN_SRC	:= $(TSPNG:%.png=%.s)
TS_GEN_O	:= $(TSPNG:%.png=$(BLDPATH)/%.o)

GEN_SRC		:= $(IMAGES:$(AUTO_ASSET_ROOT)/%.png=generated_image/%.c)
GEN_H		:= $(IMAGES:$(AUTO_ASSET_ROOT)/%.png=generated_image/%.h)
ASM_SRC     := $(call rwildcard,src/,*.s)
C_SRC       := $(call rwildcard,src/,*.c)
DATA_SRC    := $(call rwildcard,data/,*.s)
STRING		:= $(call rwildcard,string/$(LAN)/,*.txt)
STRING_SRC	:= $(STRING:%.txt=%.s)
SCRIPT_SRC	:= $(call rwildcard,$(SCRIPTROOT)/,*.s)

MAP_PROJ_S	:= $(MAP_PROJ:%.json=%.s)
MAP_PROJ_O	:= $(MAP_PROJ:%.json=$(BLDPATH)/%.o)

MAP_FILES	:= $(call rwildcard,$(MAPMAPS)/,*.pmh)
MAP_FILES_S	:= $(MAP_FILES:%.pmh=%.s)
MAP_FILES_O	:= $(MAP_FILES:%.pmh=$(BLDPATH)/%.o)

TS_FILES	:= $(call rwildcard,$(MAPTS)/,*.pts)
TS_FILES_S	:= $(TS_FILES:%.pts=%.s)
TS_FILES_O	:= $(TS_FILES:%.pts=$(BLDPATH)/%.o)

GEN_OBJ		:= $(GEN_SRC:%.c=$(BLDPATH)/%.o)
STRING_OBJ	:= $(STRING_SRC:%.s=$(BLDPATH)/%.o)
ASM_OBJ     := $(ASM_SRC:%.s=$(BLDPATH)/%.o)
C_OBJ       := $(C_SRC:%.c=$(BLDPATH)/%.o)
DATA_OBJ    := $(DATA_SRC:%.s=$(BLDPATH)/%.o)
SCRIPT_OBJ	:= $(SCRIPT_SRC:%.s=$(BLDPATH)/%.o)
ALL_OBJ     := $(GEN_OBJ) $(C_OBJ) $(ASM_OBJ) $(DATA_OBJ) $(STRING_OBJ) $(SCRIPT_OBJ) $(MAP_PROJ_O) $(MAP_FILES_O) $(TS_FILES_O) $(TS_GEN_O)

$(MAPMAPS)/%.s: $(MAPMAPS)/%.pmh
	@printf "\e[1;33mGenerating map\e[0m $<\n"
	$(PYMAPS) -o $@ $<

$(MAPTS)/%.s: $(MAPTS)/%.pts
	@printf "\e[1;33mGenerating tileset\e[0m $<\n"
	$(PYSETS) -o $@ $<

$(STRINGDIR)/%.s: $(STRINGDIR)/%.txt
	@printf "\e[1;36mGenerating strings\e[0m $<\n"
	$(STRAGB) -o $@ -i $< -t string/table.tbl -e 0xFF

$(BLDPATH)/%.o: %.c $(ASSETS) $(PAGB_INCLUDE)/pokeagb/pokeagb.h
	@printf "\e[1;31mCompiling\e[0m $<\n"
	$(shell mkdir -p $(dir $@))		
	$(CC) $(CFLAGS) -c $< -o $@		
		
$(BLDPATH)/%.o: %.s $(PAGB_INCLUDE)/pokeagb/pokeagb.h
	@printf "\e[1;31mAssembling\e[0m $<\n"
	$(shell mkdir -p $(dir $@))
	$(PREPROC) $< $(CHARMAP) > $*.i
	$(CC) $(CFLAGS) -c -x assembler-with-cpp $*.i -o $@		
	@rm -f $*.i

$(MAPTS)/%.s: $(MAPTS)/%.png
	@printf "\e[1;33mProcessing image (tileset)\e[0m $<\n"
	$(GRIT) $< -o $@ -fts -gzl -pz! -pu16 -gB4 -m! -mR!

generated_image/%.c generated_image/%.h: $(AUTO_ASSET_ROOT)/%.png $(AUTO_ASSET_ROOT)/%.grit
	@printf "\e[1;33mProcessing image\e[0m $<\n"
	$(shell mkdir -p $(dir $@))
	$(GRIT) $< -o $@ -ftc -ff $(<:%.png=%.grit)

generated_image/%.c generated_image/%.h: $(AUTO_ASSET_ROOT)/%.png
	@printf "\e[1;33mProcessing image (using directory grit file)\e[0m $<\n"
	$(shell mkdir -p $(dir $@))
	$(GRIT) $< -o $@ -ftc -ff $(<D)/$(notdir $(<D)).grit

all: $(GEN_H) rom 

.PHONY: rom
rom: main.asm $(MAIN_OBJ)
	@printf "\e[1;30;41mCreating ROM\e[0m\n"
	$(ARS) $<
	$(NM) $(BLDPATH)/linked.o -n -g --defined-only | \
		sed -e '{s/^/0x/g};{/.*\sA\s.*/d};{s/\sT\s/ /g}' > $(OUTPATH)/__symbols.sym
	@echo "*** SUCCESSFULLY BUILT PROJECT ***"
	@echo "*** REMOVING INTERMEDIATE FILES ***"
	
$(MAIN_OBJ): $(ALL_OBJ) $(SPRITES) $(MUSIC_AR) $(SMPL_AR) $(VOICE_AR) $(LIST_AR) $(CRY_AR) #$(B_ENGINE)
	$(MAKE) -f assets.makefile
	@printf "\e[1;30;41mLinking ELF binary\e[0m $@\n"
	@echo "INPUT($^)" > $(TMP_LD)
	$(LD) $(LDFLAGS) -T $(PAGB_LINK) -T linker.ld -T bpre.sym --whole-archive -r -o $@ --start-group -T $(TMP_LD) --end-group
	$(LD) $(LDFLAGS) -T $(PAGB_LINK) -T linker.ld -T bpre.sym --whole-archive -o $@.dbg --start-group -T $(TMP_LD) --end-group
	@rm -f $@.dbg
	@rm -f $(TMP_LD)

$(MAP_PROJ_S): $(MAP_PROJ)
	@printf "\e[1;33mGenerating map project\e[0m $<\n"
	$(PYPROJS) -b sovereign_banks -f sovereign_footer -o $@ $<

.PHONY: $(B_ENGINE)
$(B_ENGINE):
	$(MAKE) -C battle_engine build/linked.o PAGB_INCLUDE=../$(PAGB_MAIN)/build

.PHONY: cleansrcdatascript
cleansrcdatascript:
	rm -rf object/src/*
	rm -rf object/data/*
	rm -rf object/sots-private/map/script/*

.PHONY: clean
clean:
	rm -f  $(OUTPATH)/__symbols.sym $(OUTPATH)/pkmn_sots.gba
	rm -rf generated_image/*
	rm -R -f object/*
	$(MAKE) -C $(dir $(MUSIC_AR)) clean
	$(MAKE) -C $(dir $(SMPL_AR)) clean
	$(MAKE) -C $(dir $(VOICE_AR)) clean
	$(MAKE) -C $(dir $(LIST_AR)) clean
	$(MAKE) -C $(dir $(CRY_AR)) clean
	$(MAKE) -f sprites.makefile clean

.PHONY: cleannogfx
	rm -f  $(OUTPATH)/__symbols.sym $(OUTPATH)/pkmn_sots.gba
	rm -rf generated_image/*
	rm -R -f object/*
	$(MAKE) -C $(dir $(MUSIC_AR)) clean
	$(MAKE) -C $(dir $(SMPL_AR)) clean
	$(MAKE) -C $(dir $(VOICE_AR)) clean
	$(MAKE) -C $(dir $(LIST_AR)) clean
	$(MAKE) -C $(dir $(CRY_AR)) clean

.PHONY: $(ASSETS)
$(ASSETS):
	@printf "\e[1;33mMaking Assets\e[0m\n"
	$(MAKE) -f assets.makefile

.PHONY: $(SPRITES)
$(SPRITES):
	@printf "\e[1,33mMaking Sprites\e[0m\n"
	$(MAKE) -f sprites.makefile

.PHONY: $(MUSIC_AR)
$(MUSIC_AR):
	@printf "\e[1,32mMaking Music\e[0m\n"
	$(MAKE) -C $(dir $@) all

.PHONY: $(SMPL_AR)
$(SMPL_AR):
	@printf "\e[1,32mMaking Sampler\e[0m\n"
	$(MAKE) -C $(dir $@) all

.PHONY: $(VOICE_AR)
$(VOICE_AR):
	@printf "\e[1,32mMaking Voice\e[0m\n"
	$(MAKE) -C $(dir $@) all

.PHONY: $(LIST_AR)
$(LIST_AR):
	@printf "\e[1,32mMaking Songlist\e[0m\n"
	$(MAKE) -C $(dir $@) all

.PHONY: $(CRY_AR)
$(CRY_AR):
	@printf "\e[1,32mMaking Cries\e[0m\n"
	$(MAKE) -C $(dir $@) all

.PHONY: constants
constants:
	$(PYTHON_BIN) ../tools/v_tools/constants.py src/include/

run: rom
	$(VBA) "build/pkmn_sots.gba"
