AS = arm-none-eabi-as
AR = arm-none-eabi-ar

S_FILES = $(sort $(wildcard S/*.s))
OBJ_FILES = $(addprefix OBJ/,$(notdir $(S_FILES:.s=.o)))

all: voice.a
	

.PHONY: clean
clean:
	rm -f OBJ/*.o sample.a

OBJ/%.o: S/%.s
	$(AS) $< -o $@

voice.a: $(OBJ_FILES)
	rm -f $@
	$(AR) rcs $@ $^
