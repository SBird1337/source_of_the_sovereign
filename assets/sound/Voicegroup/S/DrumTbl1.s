	.include "VoiceDef.s"

	.section .rodata
	.global DrumTbl1
	.align	2

DrumTbl1:

@**************** Voice 000 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 001 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 002 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 003 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 004 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 005 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 006 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 007 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 008 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 009 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 010 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 011 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 012 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 013 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 014 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 015 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 016 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 017 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 018 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 019 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 020 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 021 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 022 ****************@

	.byte	DirectSound
	.byte	As2
	.byte	0x0
	.byte	c_v-48
	.word	snd_127_smash
	.byte	255, 0, 255, 200

@**************** Voice 023 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	c_v+48
	.word	snd_127_smash
	.byte	255, 0, 255, 200

@**************** Voice 024 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 025 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 026 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_low_cymbal
	.byte	8, 0x0, 255, 216

@**************** Voice 027 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 028 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 029 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_ekick
	.byte	255, 0, 255, 127

@**************** Voice 030 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 031 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_esnare
	.byte	255, 0, 255, 127

@**************** Voice 032 ****************@

	.byte	DirectSound
	.byte	An1
	.byte	0x0
	.byte	c_v-20
	.word	snd_47_timpani
	.byte	255, 0, 255, 165

@**************** Voice 033 ****************@

	.byte	DirectSound
	.byte	Bn1
	.byte	0x0
	.byte	c_v+20
	.word	snd_47_timpani
	.byte	255, 0, 255, 165

@**************** Voice 034 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 035 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 036 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_bassdrum
	.byte	255, 0x0, 255, 242

@**************** Voice 037 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_sticks
	.byte	255, 0x0, 255, 200

@**************** Voice 038 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_soft_snare
	.byte	255, 0x0, 255, 224

@**************** Voice 039 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_clap
	.byte	255, 0x0, 255, 165

@**************** Voice 040 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_hard_snare
	.byte	255, 0x0, 255, 224

@**************** Voice 041 ****************@

	.byte	DirectSound
	.byte	En2
	.byte	0x0
	.byte	c_v-32
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 042 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_high_hat
	.byte	255, 0x0, 255, 242

@**************** Voice 043 ****************@

	.byte	DirectSound
	.byte	Gs2
	.byte	0x0
	.byte	c_v-16
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 044 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_closed_hat
	.byte	255, 0x0, 255, 242

@**************** Voice 045 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	c_v+0
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 046 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_open_hat
	.byte	255, 240, 0, 200

@**************** Voice 047 ****************@

	.byte	DirectSound
	.byte	En3
	.byte	0x0
	.byte	c_v+16
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 048 ****************@

	.byte	DirectSound
	.byte	Gn3
	.byte	0x0
	.byte	c_v+32
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 049 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	c_v-10
	.word	snd_127_hard_cymbal
	.byte	255, 248, 0, 224

@**************** Voice 050 ****************@

	.byte	DirectSound
	.byte   Bn3
	.byte	0x0
	.byte	c_v+40
	.word	snd_127_tom_45
	.byte	255, 240, 0, 165

@**************** Voice 051 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_ride_cymbal
	.byte	255, 248, 0, 210

@**************** Voice 052 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_soft_cymbal
	.byte	255, 246, 0, 222

@**************** Voice 053 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_ride_bell
	.byte	255, 0, 255, 165

@**************** Voice 054 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_tambourine
	.byte	255, 0x0, 255, 165

@**************** Voice 055 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_open_cymbal
	.byte	255, 0, 255, 180

@**************** Voice 056 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 057 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	c_v+10
	.word	snd_127_low_cymbal
	.byte	255, 248, 0, 220

@**************** Voice 058 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 059 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_ride_cymbal
	.byte	255, 248, 0, 210

@**************** Voice 060 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_bongo_hi
	.byte	255, 0, 255, 165

@**************** Voice 061 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_bongo_lo
	.byte	255, 0, 255, 165

@**************** Voice 062 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_conga_hi_sl
	.byte	255, 0, 255, 165

@**************** Voice 063 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_conga_hi
	.byte	255, 0, 255, 165

@**************** Voice 064 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	0x86DDCE8
	.byte	255, 0x0, 255, 0x0

@**************** Voice 065 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 066 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 067 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 068 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 069 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 070 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 071 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 072 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 073 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 074 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 075 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_claves
	.byte	255, 0x0, 255, 0x0

@**************** Voice 076 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 077 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 078 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 079 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 080 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_triangle
	.byte	255, 165, 0, 127

@**************** Voice 081 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_127_triangle
	.byte	255, 235, 0, 224

@**************** Voice 082 ****************@

	.byte	DirectSoundFix
	.byte	Cn3
	.byte	0x0
	.byte	c_v+30
	.word	snd_127_shake
	.byte	255, 0x0, 255, 127

@**************** Voice 083 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 084 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 085 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 086 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 087 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 088 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 089 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 090 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 091 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 092 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 093 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 094 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 095 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 096 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 097 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 098 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 099 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 100 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 101 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 102 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 103 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 104 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 105 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 106 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 107 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 108 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 109 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 110 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 111 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 112 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 113 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 114 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 115 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 116 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 117 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 118 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 119 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 120 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 121 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 122 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 123 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 124 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 125 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 126 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0

@**************** Voice 127 ****************@

	.byte	SquareWave1
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	WaveDuty50
	.byte	0x0, 0x0, 0xF, 0x0



	.end
