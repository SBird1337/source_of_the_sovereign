AS = arm-none-eabi-as
AR = arm-none-eabi-ar

WAV_FILES = $(sort $(wildcard WAV/*.wav))
OBJ_FILES = $(addprefix OBJ/,$(notdir $(WAV_FILES:.wav=.o)))

TABLE_S = TABLE/_forward_crytable.s TABLE/_reverse_crytable.s
TABLE_OBJ = $(TABLE_S:.s=.o)

all: cry.a
	

.PHONY: clean
clean:
	rm -f OBJ/*.o cry.a

OBJ/%.o: S/%.s
	$(AS) $< -o $@

S/cry_492.s: WAV/cry_492.wav
	wav2agb $< $@

S/%.s: WAV/%.wav
	wav2agb $< $@ -c

TABLE/%.o: TABLE/%.s
	$(AS) $< -o $@

cry.a: $(OBJ_FILES) $(TABLE_OBJ) OBJ/cry_NULL.o
	$(AR) rcs $@ $^
