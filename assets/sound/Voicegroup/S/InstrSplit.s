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
	.word	snd_0_piano_fs0
	.byte	255, 255, 0, 226

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_ds1
	.byte	255, 254, 0, 226

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_a1
	.byte	255, 253, 0, 226

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_fs2
	.byte	255, 252, 0, 226

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_ds3
	.byte	255, 251, 0, 226

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_c4
	.byte	255, 249, 0, 226


@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_a4
	.byte	255, 248, 0, 226

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_0_piano_a5
	.byte	255, 247, 0, 226

snd_24_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_e1
	.byte	255, 255, 64, 189

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_a1
	.byte	255, 253, 56, 189

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_d2
	.byte	255, 250, 48, 189

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_g2
	.byte	255, 248, 40, 189

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_24_guitar_e3
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
	.word	snd_29_guitar_e2
	.byte	255, 0, 255, 186

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_29_guitar_d3
	.byte	255, 0, 255, 186

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_29_guitar_b3
	.byte	255, 0, 255, 186

snd_33_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_a1
	.byte	255, 254, 0, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_d2
	.byte	255, 252, 0, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_g2
	.byte	255, 250, 0, 165

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_33_bass_d3
	.byte	255, 247, 0, 165

snd_35_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_a1
	.byte	255, 254, 0, 180

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_d2
	.byte	255, 252, 0, 180

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_g2
	.byte	255, 250, 0, 180

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_35_fles_bass_c3
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
	.word	snd_46_harp_cs3
	.byte	255, 249, 0, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_46_harp_ds4
	.byte	255, 245, 0, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_46_harp_c5
	.byte	255, 242, 0, 165

snd_48_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b0
	.byte	255, 0, 255, 200

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e1
	.byte	255, 0, 255, 200

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b1
	.byte	255, 0, 255, 200

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e2
	.byte	255, 0, 255, 200

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b2
	.byte	255, 0, 255, 200

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e3
	.byte	255, 0, 255, 200

@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b3
	.byte	255, 0, 255, 200

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e4
	.byte	255, 0, 255, 200

@**************** Voice 008 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b4
	.byte	255, 0, 255, 200

@**************** Voice 009 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e5
	.byte	255, 0, 255, 200

snd_49_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b0
	.byte	255, 0, 255, 200

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e1
	.byte	255, 0, 255, 200

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b1
	.byte	255, 0, 255, 200

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e2
	.byte	255, 0, 255, 200

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b2
	.byte	255, 0, 255, 200

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e3
	.byte	255, 0, 255, 200

@**************** Voice 006 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b3
	.byte	255, 0, 255, 200

@**************** Voice 007 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e4
	.byte	255, 0, 255, 200

@**************** Voice 008 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_b4
	.byte	255, 0, 255, 200

@**************** Voice 009 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_48_strings_e5
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
	.word	snd_61_horns_c3
	.byte	255, 0, 255, 190

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_61_horns_as3
	.byte	255, 0, 255, 190

snd_66_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_e3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_a3
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_66_tsax_d4
	.byte	255, 0, 255, 165

snd_68_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_g3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_d4
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_68_oboe_a4
	.byte	255, 0, 255, 165

snd_73_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_fs3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_a3
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_d4
	.byte	255, 0, 255, 165

@**************** Voice 003 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_a4
	.byte	255, 0, 255, 165

@**************** Voice 004 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_e5
	.byte	255, 0, 255, 165

@**************** Voice 005 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_73_flute_g5
	.byte	255, 0, 255, 165

snd_77_table:

@**************** Voice 000 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_a3
	.byte	255, 0, 255, 165

@**************** Voice 001 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_e4
	.byte	255, 0, 255, 165

@**************** Voice 002 ****************@

	.byte	DirectSound
	.byte	Cn3
	.byte	0x0
	.byte	0x0
	.word	snd_77_shakuhachi_c5
	.byte	255, 0, 255, 165

	.end
