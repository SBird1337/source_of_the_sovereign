GRIT := grit
CC   := arm-none-eabi-gcc
AR   := arm-none-eabi-ar

CFLAGS := -mthumb -mno-thumb-interwork -mcpu=arm7tdmi -mlong-calls -march=armv4t -O3 -std=c99

PNG_MET_BG     := assets/meteor/bg0.png
PNG_MET_SKY    := assets/meteor/bg1.png
PNG_MET_FG     := assets/meteor/bg2.png
PNG_MET_CLOUDS := assets/meteor/clouds.png
PNG_MET_METEOR := assets/meteor/oam.png
PNG_AS_T       := assets/render/ascii.png

C_MET_BG     := src/assets/meteor/met_background.c
C_MET_SKY    := src/assets/meteor/met_sky.c
C_MET_FG     := src/assets/meteor/met_foreground.c
C_MET_CLOUDS := src/assets/meteor/met_clouds.c
C_MET_METEOR := src/assets/meteor/met_meteor.c
C_AS_T       := src/include/assets/ascii.c

PNG_MUG_00    := assets/mug/mug_00.png
PNG_MUG_01    := assets/mug/mug_01.png
PNG_MUG_02    := assets/mug/mug_02.png
PNG_MUG_05    := assets/mug/mug_05.png
PNG_MUG_06    := assets/mug/mug_06.png
PNG_MUG_07    := assets/mug/mug_07.png
PNG_MUG_08    := assets/mug/mug_08.png
PNG_MUG_09    := assets/mug/mug_09.png
PNG_MUG_10   := assets/mug/mug_10.png
PNG_MUG_11   := assets/mug/mug_11.png

C_MUG_00      := src/include/assets/mug/mug_00.c
C_MUG_01      := src/include/assets/mug/mug_01.c
C_MUG_02      := src/include/assets/mug/mug_02.c
C_MUG_05      := src/include/assets/mug/mug_05.c
C_MUG_06      := src/include/assets/mug/mug_06.c
C_MUG_07      := src/include/assets/mug/mug_07.c
C_MUG_08      := src/include/assets/mug/mug_08.c
C_MUG_09      := src/include/assets/mug/mug_09.c
C_MUG_10      := src/include/assets/mug/mug_10.c
C_MUG_11      := src/include/assets/mug/mug_11.c

PNG_EMOT      := assets/interface/emoticons.png
PNG_TB        := assets/interface/text_box.png
PNG_MB        := assets/interface/menu_box.png
PNG_ARR       := assets/interface/arrows.png

B_EMOT        := src/include/assets/interface/emoticons.img.bin
B_TB          := src/include/assets/interface/text_box.img.bin
B_MB          := src/include/assets/interface/menu_box.img.bin
B_ARR         := src/include/assets/interface/arrows.img.bin

.PHONY: all
all: $(C_MET_BG) $(C_MET_SKY) $(C_MET_FG) $(C_MET_CLOUDS) $(C_MET_METEOR) $(C_AS_T) $(C_MUG_00) $(C_MUG_01) $(C_MUG_02) $(C_MUG_05) $(C_MUG_06) $(C_MUG_07) $(C_MUG_08) $(C_MUG_09) $(C_MUG_10) $(C_MUG_11) $(B_EMOT) $(B_TB) $(B_MB) $(B_ARR)



# generate object files
#$(O_MET_BG): $(C_MET_BG)
#	$(CC) $(CFLAGS) -c -o $@ $<
#
#$(O_MET_SKY): $(C_MET_SKY)
#	$(CC) $(CFLAGS) -c -o $@ $<
#
#$(O_MET_FG): $(C_MET_FG)
#	$(CC) $(CFLAGS) -c -o $@ $<
#
#$(O_MET_CLOUDS): $(C_MET_CLOUDS)
#	$(CC) $(CFLAGS) -c -o $@ $<
#
#$(O_MET_METEOR): $(C_MET_METEOR)
#	$(CC) $(CFLAGS) -c -o $@ $<

# generate C files
$(C_MET_BG): $(PNG_MET_BG)
	$(GRIT) $< -gu32 -gT00FF00 -gzl -gB 4 -gt -m -mu16 -mzl -mp0 -mRtpf -p -pu16 -pzl -ftc -o $@

$(C_MET_SKY): $(PNG_MET_SKY)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -m -mu16 -mzl -mp1 -mRtpf -p -pu16 -pzl -ftc -o $@

$(C_MET_RG): $(PNG_MET_RG)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -m -mu16 -mzl -mp3 -mRtpf -p -pu16 -pzl -ftc -o $@

$(C_MET_CLOUDS): $(PNG_MET_CLOUDS)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -m -mu16 -mzl -mp2 -mRtpf -p -pu16 -pzl -ftc -o $@

$(C_MET_METEOR): $(PNG_MET_METEOR)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -ftc -o $@

$(C_AS_T): $(PNG_AS_T)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_00): $(PNG_MUG_00)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_01): $(PNG_MUG_01)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_02): $(PNG_MUG_02)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_05): $(PNG_MUG_05)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_06): $(PNG_MUG_06)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_07): $(PNG_MUG_07)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_08): $(PNG_MUG_08)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_09): $(PNG_MUG_09)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_10): $(PNG_MUG_10)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(C_MUG_11): $(PNG_MUG_11)
	$(GRIT) $< -gu32 -gzl -gB 4 -gt -p -pu16 -pz! -m! -ftc -o $@

$(B_EMOT): $(PNG_EMOT)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_TB): $(PNG_TB)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_MB): $(PNG_MB)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@

$(B_ARR): $(PNG_ARR)
	$(GRIT) $< -gu32 -gz! -gB 4 -gt -p! -m! -ftb -o $@