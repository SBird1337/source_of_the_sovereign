CC = arm-none-eabi-gcc
NM = arm-none-eabi-nm
AR = arm-none-eabi-ar
LD = arm-none-eabi-ld
MAKE = make

MUS_OBJECT = "buildMusic.o"
CRY_OBJECT = "buildCry.o"

SND_DATA = "snd_data.o"

MUSIC_AR = ../Music/music.a
SMPL_AR = ../Samples/sample.a
VOICE_AR = ../Voicegroup/voice.a
LIST_AR = ../Songtable/songlist.a
CRY_AR = ../Crys/cry.a


all: $(SND_DATA)

$(SND_DATA): $(LIST_AR) $(MUSIC_AR) $(SMPL_AR) $(VOICE_AR) $(CRY_AR)
	$(LD) -r -o $@ --whole-archive --start-group $^ --end-group


.PHONY: clean
clean:
	$(MAKE) -C $(dir $(MUSIC_AR)) clean
	$(MAKE) -C $(dir $(SMPL_AR)) clean
	$(MAKE) -C $(dir $(VOICE_AR)) clean
	$(MAKE) -C $(dir $(LIST_AR)) clean
	$(MAKE) -C $(dir $(CRY_AR)) clean

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
