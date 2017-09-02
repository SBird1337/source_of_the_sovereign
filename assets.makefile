GRIT := grit
CC   := arm-none-eabi-gcc
AR   := arm-none-eabi-ar

CFLAGS := -mthumb -mno-thumb-interwork -mcpu=arm7tdmi -mlong-calls -march=armv4t -O3 -std=c99

ASSET_ROOT := sots-private/assets
GFX_BUILD := gfx_build

PNG_EMOT      := assets/interface/emoticons.png
PNG_TB        := assets/interface/text_box.png
PNG_MB        := assets/interface/menu_box.png
PNG_ARR       := assets/interface/arrows.png

B_EMOT        := src/include/assets/interface/emoticons.img.bin
B_TB          := src/include/assets/interface/text_box.img.bin
B_MB          := src/include/assets/interface/menu_box.img.bin
B_ARR         := src/include/assets/interface/arrows.img.bin

.PHONY: all
all: $(C_AS_T) $(B_EMOT) $(B_TB) $(B_MB) $(B_ARR)


$(C_AS_T): $(PNG_AS_T)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@


$(B_EMOT): $(PNG_EMOT)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_TB): $(PNG_TB)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_MB): $(PNG_MB)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_ARR): $(PNG_ARR)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@