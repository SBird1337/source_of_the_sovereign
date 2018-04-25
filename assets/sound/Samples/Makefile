AS = arm-none-eabi-as
AR = arm-none-eabi-ar

BIN_FILES = $(sort $(wildcard BIN/*.bin))
OBJ_FILES = $(addprefix OBJ/,$(notdir $(BIN_FILES:.bin=.o)))

S_DUMP_FILES = $(sort $(wildcard S_DUMP/*.s))
OBJ_DUMP_FILES = $(addprefix OBJ_DUMP/,$(notdir $(S_DUMP_FILES:.s=.o)))

all: sample.a
	

.PHONY: clean
clean:
	rm -f OBJ/*.o OBJ_DUMP/*.o sample.a S/*.s

#.PRECIOUS: S/%.s
S/%.s: BIN/%.bin
	bin2asm $< > $@

OBJ/%.o: S/%.s
	$(AS) $< -o $@

OBJ_DUMP/%.o: S_DUMP/%.s
	$(AS) $< -o $@

sample.a: $(OBJ_FILES) $(OBJ_DUMP_FILES)
	rm -f $@
	$(AR) rcs $@ $^
