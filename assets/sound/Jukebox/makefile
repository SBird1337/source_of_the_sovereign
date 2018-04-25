default_target: bped
.PHONY	:	default_target

ifdef offset
ORG := $(shell printf "%d" $(offset))
ROMORIGIN := $(shell printf "%d" 0x8000000)
INSERT := $(shell echo ${ORG}-${ROMORIGIN} | bc)
COMPILE := $(shell echo "obase=16;"${ORG} | bc)
else
COMPILE := 8000000
endif
OPTS := -O3

bped:
	arm-none-eabi-gcc ${OPTS} -mthumb -mthumb-interwork -T "bped.sym" -g -w -std=gnu99 -emain -nostdlib -Wl,--section-start=.text=${COMPILE} -o main.out main.c
	arm-none-eabi-objcopy -O binary main.out main.bin
	rm main.out
ifdef fname
ifdef INSERT
	dd if=main.bin of="$(fname)" conv=notrunc seek=$(INSERT) bs=1
else
	@echo "Insertion location not found!"
	@echo "Did you forget to define 'offset'?"
	@echo "Ex: make [version] fname=<romfile name> offset=0x08/0x09<offset in hex>"
endif
endif


.PHONY	:	bped
