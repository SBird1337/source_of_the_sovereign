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

.PHONY: all
all: $(C_MET_BG) $(C_MET_SKY) $(C_MET_FG) $(C_MET_CLOUDS) $(C_MET_METEOR) $(C_AS_T)



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

	