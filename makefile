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

export PATH := $(realpath ../tools):$(PATH)

PAGB_MAIN := g3headers
PAGB_INCLUDE := $(PAGB_MAIN)/build/include/
PAGB_LINK := $(PAGB_MAIN)/build/linker/BPRE.ld

CHARMAP := charmap.txt

DEFINES   := -DBPRE -DSOFTWARE_VERSION=0
ASFLAGS   := -mthumb
CFLAGS    := -mthumb -mthumb-interwork -g -mcpu=arm7tdmi -fno-inline -mlong-calls -march=armv4t -Og -std=c11 -Wall -Wextra -Wunreachable-code -I$(PAGB_INCLUDE) -Isrc/include -fdiagnostics-color $(DEFINES)
GRITFLAGS := -ftc -fa
LDFLAGS   := -z muldefs
BLDPATH   := object
OUTPATH	  := build
SOURCEDIR := src
STRINGDIR := string

MAIN_OBJ  := $(BLDPATH)/linked.o
B_ENGINE  := battle_engine/build/linked.o
SPRITES   := $(BLDPATH)/pkmn_sprites.o
ICONS_AR  := $(BLDPATH)/pkmn_icons.a
DYN_OVER  := built/dynamic_overworld.o

SND_ROOT := sots-private/sound
MUSIC_AR := $(SND_ROOT)/Music/music.a
SMPL_AR  := $(SND_ROOT)/Samples/sample.a
VOICE_AR := $(SND_ROOT)/Voicegroup/voice.a
LIST_AR  := $(SND_ROOT)/Songtable/songlist.a
CRY_AR   := $(SND_ROOT)/Crys/cry.a

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

ASM_SRC_PP  := $(call rwildcard,src/,*.S)
ASM_SRC     := $(call rwildcard,src/,*.s)
C_SRC       := $(call rwildcard,src/,*.c)
DATA_SRC_PP := $(call rwildcard,data/,*.S)
DATA_SRC    := $(call rwildcard,data/,*.s)
STRING		:= $(call rwildcard,string/$(LAN)/,*.txt)
C_STRING	:= $(call rwildcard,string/$(LAN)/,*.c)
STRING_SRC	:= $(STRING:%.txt=%.S)

I_STRING	:= $(C_STRING:$.c=%.i)


C_STR_OBJ	:= $(I_STRING:%.i=$(BLDPATH)/%.o)
STRING_OBJ	:= $(STRING_SRC:%.S=$(BLDPATH)/%.o)
ASM_OBJ_PP  := $(ASM_SRC_PP:%.S=$(BLDPATH)/%.o)
ASM_OBJ     := $(ASM_SRC:%.s=$(BLDPATH)/%.o)
C_OBJ       := $(C_SRC:%.c=$(BLDPATH)/%.o)
DATA_OBJ_PP := $(DATA_SRC_PP:%.S=$(BLDPATH)/%.o)
DATA_OBJ    := $(DATA_SRC:%.s=$(BLDPATH)/%.o)
ALL_OBJ     := $(C_OBJ) $(ASM_OBJ_PP) $(ASM_OBJ) $(DATA_OBJ_PP) $(DATA_OBJ)


.PRECIOUS: $(STRING_SRC)
$(STRINGDIR)/%.S: $(STRINGDIR)/%.txt
	$(STRAGB) -o $@ -i $< -t string/table.tbl -e 0xFF

$(BLDPATH)/%.o: %.c $(ASSETS)
	$(shell mkdir -p $(dir $@))
	$(CC) $(CFLAGS) -c $< -o $@

$(BLDPATH)/%.o: %.S
	$(shell mkdir -p $(dir $@))
	$(CC) $(CFLAGS) -c $< -o $@

$(BLDPATH)/%.o: %.s

	$(shell mkdir -p $(dir $@))
	$(PREPROC) $< $(CHARMAP) > $*.i
	$(CC) $(CFLAGS) -c -x assembler-with-cpp $*.i -o $@
	$(OBJCOPY) -O binary $@ $@.bin

all: rom

.PHONY: rom
rom: main.asm $(MAIN_OBJ)
	$(ARS) $<
	$(NM) $(BLDPATH)/linked.o -n -g --defined-only | \
		sed -e '{s/^/0x/g};{/.*\sA\s.*/d};{s/\sT\s/ /g}' > $(OUTPATH)/__symbols.sym
	@echo "*** SUCCESSFULLY BUILT PROJECT ***"
	
$(MAIN_OBJ): $(ALL_OBJ) $(ICONS_AR) $(SPRITES) $(MUSIC_AR) $(SMPL_AR) $(VOICE_AR) $(LIST_AR) $(CRY_AR) $(STRING_OBJ)#$(B_ENGINE)
	$(MAKE) -f assets.makefile
	$(LD) $(LDFLAGS) -T $(PAGB_LINK) -T linker.ld -T bpre.sym --whole-archive -r -o $@ --start-group $^ --end-group

.PHONY: $(B_ENGINE)
$(B_ENGINE):
	$(MAKE) -C battle_engine build/linked.o

.PHONY: clean
clean:
	rm -f  $(OUTPATH)/__symbols.sym $(OUTPATH)/pkmn_sots.gba
	rm -R -f object/*
	$(MAKE) -C $(dir $(MUSIC_AR)) clean
	$(MAKE) -C $(dir $(SMPL_AR)) clean
	$(MAKE) -C $(dir $(VOICE_AR)) clean
	$(MAKE) -C $(dir $(LIST_AR)) clean
	$(MAKE) -C $(dir $(CRY_AR)) clean
	$(MAKE) -f sprites.makefile clean
	$(MAKE) -f icons.makefile clean

.PHONY: $(ASSETS)
$(ASSETS):
	$(MAKE) -f assets.makefile

.PHONY: $(SPRITES)
$(SPRITES):
	$(MAKE) -f sprites.makefile

.PHONY: $(ICONS_AR)
$(ICONS_AR):
	$(MAKE) -f icons.makefile

.PHONY: $(MUSIC_AR)
$(MUSIC_AR):
	$(MAKE) -C $(dir $@) all

.PHONY: $(SMPL_AR)
$(SMPL_AR):
	$(MAKE) -C $(dir $@) all

.PHONY: $(VOICE_AR)
$(VOICE_AR):
	$(MAKE) -C $(dir $@) all

.PHONY: $(LIST_AR)
$(LIST_AR):
	$(MAKE) -C $(dir $@) all

.PHONY: $(CRY_AR)
$(CRY_AR):
	$(MAKE) -C $(dir $@) all

run: rom
	$(VBA) "build/pkmn_sots.gba"