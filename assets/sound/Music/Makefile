AS = arm-none-eabi-as
AR = arm-none-eabi-ar
M_FLAGS = -V100 -E -P000 -R000 -G000
SE_FLAGS = -V127 -E -P005 -R000 -G001
FIX_FLAGS = 

MID_FILES = $(sort $(wildcard MID/*.mid))
OBJ_FILES = $(addprefix OBJ/,$(notdir $(MID_FILES:.mid=.o)))

SE_MID_FILES = $(sort $(wildcard MID_SE/*.mid))
SE_OBJ_FILES = $(addprefix OBJ_SE/,$(notdir $(SE_MID_FILES:.mid=.o)))

DUMP_S_FILES = $(sort $(wildcard S_DUMP/*.s))
DUMP_OBJ_FILES = $(addprefix OBJ_DUMP/,$(notdir $(DUMP_S_FILES:.s=.o)))

all: music.a
	

.PHONY: clean
clean:
	rm -f OBJ/*.o OBJ_DUMP/*.o OBJ_SE/*.o music.a

#.PRECIOUS: MID_FINAL/%.mid
MID_FINAL/%.mid: MID/%.mid
	midfix4agb $< $@ $(FIX_FLAGS)

#.PRECIOUS: S_FINAL/%.s
S_FINAL/%.s: MID_FINAL/%.mid
	mid2agb $< $@ $(M_FLAGS)

#.PRECIOUS: S_SE/%.s
S_SE/%.s: MID_SE/%.mid
	mid2agb $< $@ $(SE_FLAGS)

OBJ_SE/%.o: S_SE/%.s
	$(AS) $< -o $@

OBJ/%.o: S_FINAL/%.s
	$(AS) $< -o $@

OBJ_DUMP/%.o: S_DUMP/%.s
	$(AS) $< -o $@

music.a: $(OBJ_FILES) $(DUMP_OBJ_FILES) $(SE_OBJ_FILES)
	rm -f $@
	$(AR) rcs $@ $^
