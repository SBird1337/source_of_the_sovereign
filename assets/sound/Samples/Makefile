AS = arm-none-eabi-as
AR = arm-none-eabi-ar

S_FILES = $(sort $(wildcard S/*.s))
OBJ_S_FILES = $(S_FILES:.s=.o)

WAV_FILES = $(sort $(wildcard WAV/*.wav))
OBJ_WAV_FILES = $(WAV_FILES:.wav=.o)

S_DUMP_FILES = $(sort $(wildcard S_DUMP/*.s))
OBJ_S_DUMP_FILES = $(S_DUMP_FILES:.s=.o)

all: sample.a
	

.PHONY: clean
clean:
	rm -f OBJ/*.o OBJ_DUMP/*.o sample.a S/*.s

#----------------

S/%.o: S/%.s
	$(AS) $< -o $@

#----------------

WAV/%.s: WAV/%.wav
	wav2agb $< $@

WAV/%.o: WAV/%.s
	$(AS) $< -o $@

#----------------

S_DUMP/%.o: S_DUMP/%.s
	$(AS) $< -o $@

#----------------

sample.a: $(OBJ_S_FILES) $(OBJ_WAV_FILES) $(OBJ_S_DUMP_FILES)
	rm -f $@
	$(AR) rcs $@ $^
