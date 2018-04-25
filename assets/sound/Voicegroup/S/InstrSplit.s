	.include "VoiceDef.s"

	.section .rodata

	.global	snd_0_table
	.global	snd_24_table
	.global	snd_25_table
	.global snd_29_table
	.global	snd_33_table
	.global snd_35_table
	.global snd_40_table
	.global	snd_46_table
	.global	snd_48_table
	.global	snd_49_table
	.global	snd_56_table
	.global	snd_61_table
    .global snd_66_table
	.global	snd_68_table
	.global	snd_73_table
	.global	snd_77_table

	.align 2

snd_0_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_Fs0
	.byte	255, 255, 0, 226

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_Ds1
	.byte	255, 254, 0, 226

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_A1
	.byte	255, 253, 0, 226

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_Fs2
	.byte	255, 252, 0, 226

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_Ds3
	.byte	255, 251, 0, 226

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_C4
	.byte	255, 249, 0, 226


@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_A4
	.byte	255, 248, 0, 226

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_A5
	.byte	255, 247, 0, 226

snd_24_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_verylow
	.byte	255, 255, 64, 189

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_low
	.byte	255, 253, 56, 189

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_mid
	.byte	255, 250, 48, 189

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_high
	.byte	255, 248, 40, 189

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_veryhigh
	.byte	255, 245, 32, 189

snd_25_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_e1
	.byte	255, 255, 64, 189

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_a1
	.byte	255, 253, 56, 189

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_d2
	.byte	255, 252, 48, 189

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_g2
	.byte	255, 251, 40, 189

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_b2
	.byte	255, 250, 32, 189

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_25_guitar_e3
	.byte	255, 249, 32, 189

snd_29_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_29_guitar_low
	.byte	255, 0, 255, 186

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_29_guitar_mid
	.byte	255, 0, 255, 186

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_29_guitar_high
	.byte	255, 0, 255, 186

snd_33_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_verylow
	.byte	255, 254, 0, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_low
	.byte	255, 252, 0, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_mid
	.byte	255, 250, 0, 165

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_high
	.byte	255, 247, 0, 165

snd_35_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_A1
	.byte	255, 254, 0, 180

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_D2
	.byte	255, 252, 0, 180

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_G2
	.byte	255, 250, 0, 180

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_C3
	.byte	255, 247, 0, 180

snd_40_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_40_violin_d3
	.byte	255, 0, 255, 190

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_40_violin_d4
	.byte	255, 0, 255, 190

snd_46_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_46_harp_low
	.byte	255, 249, 0, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_46_harp_mid
	.byte	255, 245, 0, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_46_harp_high
	.byte	255, 242, 0, 165

snd_48_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B0
	.byte	255, 0, 255, 200

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E1
	.byte	255, 0, 255, 200

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B1
	.byte	255, 0, 255, 200

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E2
	.byte	255, 0, 255, 200

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B2
	.byte	255, 0, 255, 200

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E3
	.byte	255, 0, 255, 200

@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B3
	.byte	255, 0, 255, 200

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E4
	.byte	255, 0, 255, 200

@**************** Voice 008 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B4
	.byte	255, 0, 255, 200

@**************** Voice 009 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E5
	.byte	255, 0, 255, 200

snd_49_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B0
	.byte	255, 0, 255, 200

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E1
	.byte	255, 0, 255, 200

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B1
	.byte	255, 0, 255, 200

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E2
	.byte	255, 0, 255, 200

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B2
	.byte	255, 0, 255, 200

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E3
	.byte	255, 0, 255, 200

@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B3
	.byte	255, 0, 255, 200

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E4
	.byte	255, 0, 255, 200

@**************** Voice 008 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_B4
	.byte	255, 0, 255, 200

@**************** Voice 009 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_E5
	.byte	255, 0, 255, 200

snd_56_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_56_trumpet_mid
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_56_trumpet_high
	.byte	255, 0, 255, 165

snd_61_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_61_horns_mid
	.byte	255, 0, 255, 190

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_61_horns_high
	.byte	255, 0, 255, 190

snd_66_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_E3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_A3
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_D4
	.byte	255, 0, 255, 165

snd_68_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_low
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_mid
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_high
	.byte	255, 0, 255, 165

snd_73_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_Fs3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_A3
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_D4
	.byte	255, 0, 255, 165

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_A4
	.byte	255, 0, 255, 165

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_E5
	.byte	255, 0, 255, 165

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_G5
	.byte	255, 0, 255, 165

snd_77_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_low
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_mid
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_high
	.byte	255, 0, 255, 165

	.end
