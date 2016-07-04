@ created by ~ipatix~

	.global mixer_size
	.global	main_mixer
	.global	main_mixer_end
	
	.set mixer_size,(main_mixer_end - main_mixer) / 4

	.equ	GAME_BPED, 0
	.equ	GAME_BPEE, 1
	.equ	GAME_BPRE, 2
	.equ	GAME_KWJ6, 3

@ SELECT USED GAME HERE

	.equ	USED_GAME, GAME_BPRE				@ CHOOSE YOUR GAME

	.equ	FRAME_LENGTH_5734, 0x60
	.equ	FRAME_LENGTH_7884, 0x84	@ THIS MODE IS NOT SUPPORTED BY THIS ENGINE BECAUSE IT DOESN'T USE AN 8 ALIGNED BUFFER LENGTH
	.equ	FRAME_LENGTH_10512, 0xB0
	.equ	FRAME_LENGTH_13379, 0xE0			@ DEFAULT
	.equ	FRAME_LENGTH_15768, 0x108
	.equ	FRAME_LENGTH_18157, 0x130
	.equ	FRAME_LENGTH_21024, 0x160
	.equ	FRAME_LENGTH_26758, 0x1C0
	.equ	FRAME_LENGTH_31536, 0x210
	.equ	FRAME_LENGTH_36314, 0x260
	.equ	FRAME_LENGTH_40137, 0x2A0
	.equ	FRAME_LENGTH_42048, 0x2C0

	.equ	DECODER_BUFFER_BPE, 0x03001300
	.equ	DECODER_BUFFER_BPR, 0x03002088
	.equ	DECODER_BUFFER_KWJ, 0x03005800

	.equ	FREE_IRAM_BPE, 0x03001AA8
	.equ	FREE_IRAM_BPR, 0x030028E0
	.equ	FREE_IRAM_KWJ, 0x03005840


	.equ	ARG_FRAME_LENGTH, 0x0
	.equ	ARG_REMAIN_CHN, 0x4
	.equ	ARG_BUFFER_POS, 0x8
	.equ	ARG_LOOP_START_POS, 0xC
	.equ	ARG_LOOP_LENGTH, 0x10
	.equ	ARG_VAR_AREA, 0x18

	.equ	CHN_STATUS, 0x0
	.equ	CHN_MODE, 0x1
	.equ	CHN_VOL_1, 0x2
	.equ	CHN_VOL_2, 0x3
	.equ	CHN_ATTACK, 0x4
	.equ	CHN_DECAY, 0x5
	.equ	CHN_SUSTAIN, 0x6
	.equ	CHN_RELEASE, 0x7
	.equ	CHN_ADSR_LEVEL, 0x9
	.equ	CHN_FINAL_VOL_1, 0xA				@ not used anymore
	.equ	CHN_FINAL_VOL_2, 0xB				@ not used anymore
	.equ	CHN_ECHO_VOL, 0xC
	.equ	CHN_ECHO_REMAIN, 0xD
	.equ	CHN_POSITION_REL, 0x18				@ RELATIVE FOR COMPRESSED SAMPLES (decrementing)
	.equ	CHN_FINE_POSITION, 0x1C
	.equ	CHN_FREQUENCY, 0x20
	.equ	CHN_WAVE_OFFSET, 0x24
	.equ	CHN_POSITION_ABS, 0x28				@ RELATIVE FOR COMPRESSED SAMPLES (incrementing)
	.equ	CHN_BLOCK_COUNT, 0x3C

	.equ	WAVE_LOOP_FLAG, 0x3
	.equ	WAVE_FREQ, 0x4
	.equ	WAVE_LOOP_START, 0x8
	.equ	WAVE_LENGTH, 0xC

	.equ	SYNTH_BASE_WAVE_DUTY, 0x1
	.equ	SYNTH_WIDTH_CHANGE_1, 0x2
	.equ	SYNTH_MOD_AMOUNT, 0x3
	.equ	SYNTH_WIDTH_CHANGE_2, 0x4

	.equ	FLAG_CHN_INIT, 0x80
	.equ	FLAG_CHN_RELEASE, 0x40
	.equ	FLAG_CHN_COMP, 0x20
	.equ	FLAG_CHN_LOOP, 0x10
	.equ	FLAG_CHN_ECHO, 0x4
	.equ	FLAG_CHN_ATTACK, 0x3
	.equ	FLAG_CHN_DECAY, 0x2
	.equ	FLAG_CHN_SUSTAIN, 0x1

	.equ	MODE_FIXED_FREQ, 0x8
	.equ	MODE_REVERSE, 0x10
	.equ	MODE_COMP, 0x30
	.equ	MODE_SYNTH, 0x40

	.equ	VAR_REVERB, 0x5
	.equ	VAR_MAX_CHN, 0x6
	.equ	VAR_MASTER_VOL, 0x7
	.equ	VAR_DEF_PITCH_FAC, 0x18
	.equ	VAR_FIRST_CHN, 0x50

	.equ	REG_DMA3_SRC, 0x040000D4

@#######################################
@*********** GAME CONFIGS **************
@ add the game's name above to the ASM .equ-s before creating new configs
@#######################################


@*********** IF BPED
.if USED_GAME==GAME_BPED

	.equ	hq_buffer, FREE_IRAM_BPE
	.equ	decoder_buffer_target, DECODER_BUFFER_BPE
	.equ	ALLOW_PAUSE, 1
	.equ	DMA_FIX, 1
	.equ	ENABLE_DECOMPRESSION, 1
	.equ	ENABLE_FM, 0
	.equ	PREVENT_CLIP, 0

.endif
@*********** IF BPEE
.if USED_GAME==GAME_BPEE

	.equ	hq_buffer, FREE_IRAM_BPE
	.equ	decoder_buffer_target, DECODER_BUFFER_BPE
	.equ	ALLOW_PAUSE, 1
	.equ	DMA_FIX, 1
	.equ	ENABLE_DECOMPRESSION, 1
	.equ	ENABLE_FM, 0
	.equ	PREVENT_CLIP, 1

.endif
@*********** IF BPRE
.if USED_GAME==GAME_BPRE

	.equ	hq_buffer, FREE_IRAM_BPR
	.equ	decoder_buffer_target, DECODER_BUFFER_BPR
	.equ	ALLOW_PAUSE, 1
	.equ	DMA_FIX, 1
	.equ	ENABLE_DECOMPRESSION, 1
	.equ	ENABLE_FM, 0
	.equ	PREVENT_CLIP, 1

.endif
@*********** IF KWJ6
.if USED_GAME==GAME_KWJ6

	.equ	hq_buffer, FREE_IRAM_KWJ
	.equ	decoder_buffer_target, DECODER_BUFFER_KWJ
	.equ	ALLOW_PAUSE, 0
	.equ	DMA_FIX, 0
	.equ	ENABLE_DECOMPRESSION, 0
	.equ	ENABLE_FM, 0
	.equ	PREVENT_CLIP, 1

.endif
@***********

	.thumb

main_mixer:

LDRB	R3, [R0, #VAR_REVERB]
LSR	R3, R3, #2
@CMP	R3, #0
BEQ	clear_buffer

ADR	R1, do_reverb
BX	R1

	.align	2
	.arm

do_reverb:

CMP	R4, #2
ADDEQ	R7, R0, #0x350
ADDNE	R7, R5, R8
MOV	R4, R8

ORR	R3, R3, R3, LSL#16			@ turn on reverb for both s

STMFD	SP!, {R8, LR}

LDR	LR, hq_buffer_label

@ R00:	VAR AREA (not used) ... OK
@ R01:	Function Pointer (not used) ... OK
@ R02:	not consistent (not used) ... OK
@ R03:	Reverb ;NEEDED!!!
@ R04:	Countdown Sample ;NEEDED!!!
@ R05:	Sample Pointer, low Res Buffer ;NEEDED!!!
@ R06:	Buffer Spacing; not needed ; NEEDED!!!
@ R07:	previous buffer pointer, low Res Buffer ;NEEDED!!!
@ R08:	Frame Length (not used) (PUSH) ... OK
@ R09:	not used ... OK
@ R10:	not used ... OK
@ R11:	not used ... OK
@ R12:	not used ... OK
@ LR:	not needed ... OK


reverb_loop:

LDRSB	R0, [R5, R6]
LDRSB	R1, [R5], #1
LDRSB	R2, [R7, R6]
LDRSB	R8, [R7], #1
LDRSB	R9, [R5, R6]
LDRSB	R10, [R5], #1
LDRSB	R11, [R7, R6]
LDRSB	R12, [R7], #1
ADD	R0, R0, R1
ADD	R0, R0, R2
ADDS	R0, R0, R8
ADDMI	R0, R0, #0x4
ADD	R1, R9, R10
ADD	R1, R1, R11
ADDS	R1, R1, R12
ADDMI	R1, R1, #0x4
MUL	R0, R3, R0
MUL	R1, R3, R1
STMIA	LR!, {R0, R1}
SUBS	R4, R4, #2

BGT	reverb_loop

LDMFD	SP!, {R8, LR}

ADR	R0, (adsr_setup+1)
BX	R0

	.thumb

clear_buffer:

LDR	R3, hq_buffer_label
MOV	R1, R8
MOV	R4, #0
MOV	R5, #0
MOV	R6, #0
MOV	R7, #0

LSR	R1, #3
BCC	clear_buffer_align_8

STMIA	R3!, {R4, R5, R6, R7}

clear_buffer_align_8:

LSR	R1, #1
BCC	clear_buffer_align_16

STMIA	R3!, {R4, R5, R6, R7}
STMIA	R3!, {R4, R5, R6, R7}

clear_buffer_align_16:

STMIA	R3!, {R4, R5, R6, R7}
STMIA	R3!, {R4, R5, R6, R7}
STMIA	R3!, {R4, R5, R6, R7}
STMIA	R3!, {R4, R5, R6, R7}

SUB	R1, #1
BGT	clear_buffer_align_16

adsr_setup:

MOV	R4, R8
ADR	R0, hq_buffer_length_label
STR	R4, [R0]

@adsr_setup:

LDR	R4, [SP, #ARG_VAR_AREA]			@ load ARG_0x18 (main var area) to R4
LDR	R0, [R4, #VAR_DEF_PITCH_FAC]		@ load samplingrate pitch factor value to R0
MOV	R12, R0					@ copy factor to R12
LDRB	R0, [R4, #VAR_MAX_CHN]			@ load MAX channels to R0
ADD	R4, #VAR_FIRST_CHN			@ R4 == Base channel Offset (Channel 0)

mixer_entry:
STR	R0, [SP, #ARG_REMAIN_CHN]			@ store the channels to work with on stack (probably given by calling function)
LDR	R3, [R4, #CHN_WAVE_OFFSET]			@ load the Wave Data Offset to R3
LDRB	R6, [R4]					@ get the channel status indicator to R6
MOVS	R0, #0xC7					@ check if any of the channel status flags is set
TST	R0, R6						@ check if none of the flags is set
BEQ	return_channel_null				@ end the channel loop and disable the channel

LSL	R0, R6, #0x19					@ shift over the channel status by 0x19/25 Bits
BCC	adsr_echo_check					@ continue with normal channel procedure

BMI	stop_channel_handler				@ if the channel is initiated but on release it gets turned off immediatley

MOVS	R6, #FLAG_CHN_ATTACK				@ set the channel status to ATTACK
MOVS	R0, R3						@ copy the wave offset to R0
ADD	R0, #0x10					@ Add 0x10 to result the actual beginning of the wave data

@**************** Other Games ******************@
.if ALLOW_PAUSE==0
STR	R0, [R4, #CHN_POSITION_ABS]			@ store the absolute channel position to the CHN Vars
LDR	R0, [R3, #WAVE_LENGTH]				@ load the wave length to R0
STR	R0, [R4, #CHN_POSITION_REL]			@ store it as the remaining samples in the CHN Vars
.endif
@************** End Other Games ****************@

@*************** Pokemon Games *****************@
.if ALLOW_PAUSE==1
LDR	R1, [R4, #CHN_POSITION_REL]		@ load sample position into R1
ADD	R0, R0, R1				@ add it to the base offset
STR	R0, [R4, #CHN_POSITION_ABS]		@ write the current sample position to 0x28 of channel in array
LDR	R0, [R3, #WAVE_LENGTH]			@ load sample length into R0
SUB	R0, R0, R1				@ R0 = Samples left (if it's 0 the end of sample is reached)
STR	R0, [R4, #CHN_POSITION_REL]		@ Write samples left into Relative Channel Position Variable in Channel
.endif
@************* End Pokemon Games ***************@

MOVS	R5, #0						@ set the initial envelope to #0
STRB	R5, [R4, #CHN_ADSR_LEVEL]			@ write it to the adsr level slot
STR	R5, [R4, #CHN_FINE_POSITION]			@ set the fine position to #0 aswell
LDRB	R2, [R3, #WAVE_LOOP_FLAG]			@ load the loop indicator to R2
LSR	R0, R2, #6					@ if loop is disabled result is EQ
BEQ	adsr_attack_handler

MOVS	R0, #FLAG_CHN_LOOP				@ load the channel loop flag to R0
ORR	R6, R0						@ set the Loop Flag in the channel status
B	adsr_attack_handler

adsr_echo_check:

LDRB	R5, [R4, #CHN_ADSR_LEVEL]			@ load the current ADSR Level
LSL	R0, R6, #0x1D					@ shift the echo flag to the leftmost bit
BPL	adsr_release_check					@ if the echo bit is NOT set go to label

LDRB	R0, [R4, #CHN_ECHO_REMAIN]			@ load the remaining echo to R0
SUB	R0, #1							@ reduce the remaining echo by #1
STRB	R0, [R4, #CHN_ECHO_REMAIN]			@ store it again
BHI	channel_vol_calc				@ if the echo has not gone to #0 go over to vol calc

stop_channel_handler:

MOVS	R0, #0						@ load NULL channel status to R0
STRB	R0, [R4]					@ store it to the channel status

return_channel_null:

B	check_remain_channels

adsr_release_check:
LSL	R0, R6, #0x19					@ move the release flag bit over to the leftmost bit
BPL	adsr_decay_check				@ if the bit is NOT set go over to regular envelope handler

LDRB	R0, [R4, #CHN_RELEASE]				@ load the release value
@SUB	R0, #0xFF
@SUB	R0, #1						@ reduce the release value by 256
@ADD	R5, R5, R0					@ add the result to the adsr level (linear decay)
MUL	R5, R5, R0		@ default release algorithm
LSR	R5, R5, #8
@BMI	adsr_released_handler
BEQ	adsr_released_handler	@ neccessary for the other release algorithm

LDRB	R0, [R4, #CHN_ECHO_VOL]				@ load echo vol to R0
CMP	R5, R0						@ check if the adsr level has fallen below the echo vol
BHI	channel_vol_calc

adsr_released_handler:

LDRB	R5, [R4, #CHN_ECHO_VOL]				@ load the echo vol again
CMP	R5, #0						@ check if it's zero
BEQ	stop_channel_handler				@ stop the channel if it isn't used

MOVS	R0, #FLAG_CHN_ECHO				@ load the echo flag to R0
ORR	R6, R0						@ set the echo flag
B	adsr_update_status

adsr_decay_check:

MOVS	R2, #3						@ seperate phase bits
AND	R2, R6						@ 
CMP	R2, #FLAG_CHN_DECAY				@ check if channel NOT in decay state
BNE	adsr_attack_check				@ goto if decay NOT active

LDRB	R0, [R4, #CHN_DECAY]				@ load the decay value to R0
MUL	R5, R0						@ apply the decay
LSR	R5, R5, #8
LDRB	R0, [R4, #CHN_SUSTAIN]				@ load the sutain level
CMP	R5, R0						@ has the sample not fully decayed yet?
BHI	channel_vol_calc				@ if it didn't decay yet goto

MOVS	R5, R0						@ move the sustin level on underflow to adsr level and check if the result is #0 (i.e. channel = off)
BEQ	adsr_released_handler

B	adsr_switchto_next

adsr_attack_check:

CMP	R2, #FLAG_CHN_ATTACK				@ check if attack is enabled
BNE	channel_vol_calc				@ if it isn't in attack attack phase, it has to be in sustain (no adsr change needed) -> go over to vol calc

adsr_attack_handler:

LDRB	R0, [R4, #CHN_ATTACK]				@ load the attack value to R0
ADD	R5, R5, R0					@ add the attack value to the adsr value
CMP	R5, #0xFF					@ check if the adsr level is below 0xFF
BCC	adsr_update_status				@ store the value if it hasn't overflowed

MOVS	R5, #0xFF					@ write MAX level to adsr level if it did overflow
 
adsr_switchto_next:

SUB	R6, #1						@ switch to the next adsr state

adsr_update_status:

STRB	R6, [R4]					@ store the channel state

channel_vol_calc:

STRB	R5, [R4, #CHN_ADSR_LEVEL]			@ store the adsr level

LDR	R0, [SP, #ARG_VAR_AREA]				@ apply master volume
LDRB	R0, [R0, #VAR_MASTER_VOL]
ADD	R0, #1
MUL	R5, R0, R5

LDRB	R0, [R4, #CHN_VOL_2]				@ load volume #1 to R0
MUL	R0, R5						@ mutiply it with the adsr level
LSR	R0, R0, #13					@ convert it to an 8 bit volume level
MOV	R10, R0						@ store vol #1 to R10

LDRB	R0, [R4, #CHN_VOL_1]				@ load volume #2 to R0
MUL	R0, R5						@ apply adsr to vol #2
LSR	R0, R0, #13					@ scale it down to an 8bit value
MOV	R11, R0						@ store it into R11 (vol#2)

MOVS	R0, #FLAG_CHN_LOOP				@ ist loop enabled?
AND	R0, R6						@
BEQ	mixing_loop_setup				@ skip the loop setup procedure if it's disabled

ADD	R3, #8						@ add 8 to the sample pointer (loop start)
LDMIA	R3!, {R0, R1}					@ load loop start position to R0 and sample end to R1
ADD	R3, R0, R3					@ R3 = loop start position (absolute)
STR	R3, [SP, #ARG_LOOP_START_POS]			@ store loop start position
SUB	R0, R1, R0

mixing_loop_setup:

STR	R0, [SP, #ARG_LOOP_LENGTH]			@ store the loop length (if loop is off ==> = 0x0)
LDR	R5, hq_buffer_label					@ load the hq_buffer offset
LDR	R2, [R4, #CHN_POSITION_REL]			@ load the remaining samples for channel
LDR	R3, [R4, #CHN_POSITION_ABS]			@ load current stream position (abs)
LDRB	R0, [R4, #CHN_MODE]				@ load channel mode to R0
ADR	R1, mixing_arm_setup
BX	R1						@ jump to the arm procedure

	.align	2
hq_buffer_label:
	.word	hq_buffer
hq_buffer_length_label:
	.word	0xFFFFFFFF

	.arm

mixing_arm_setup:

LDR	R8, hq_buffer_length_label				@ write MAX samples per frame to R8
ORRS	R11, R10, R11, LSL#16				@ write Vol #2 to the high 16 bits and combine them in one word
BEQ	switchto_thumb					@ if volume is #0 for both channels we don't need to do any mixing and skip the mixing loop

TST	R0, #MODE_FIXED_FREQ				@ check if fixed freq mode is enabled
BNE	fixed_mixing_setup				@ if the flag is set enter the fixed freq mixing mode
TST	R0, #MODE_COMP					@ ### added compression check
BNE	special_mixing					@ goto the special mixing handler if reverse playback ir compression is enabled

STMFD	SP!, {R4, R9, R12}				@ free up some registers
MOVS	R2, R2						@ if remaining samples == 2
ORREQ	R0, R0, #MODE_SYNTH				@ set the SYNTH flag if sample header is both 0
STREQB	R0, [R4, #CHN_MODE]				@ store the channel mode again
ADD	R4, R4, #0x1C					@ add 0x1C to channel pointer
LDMIA	R4, {R7, LR}					@ R7 = Fine Position, LR = Frequency
MUL	R4, R12, LR					@ calc final frequency steps by multiplying the Default Frequency Facotr from R12 with the actual frequency
LDRSB	R6, [R3], #1					@ load the first sample and increment the sample pointer
LDRSB	R12, [R3]					@ load the next sample for interpolation
TST	R0, #MODE_SYNTH					@ is the Synth Mode enabled?
BNE	init_synth

SUB	R12, R12, R6					@ R12 = DELTA
MOVS	R11, R11, LSR#1					@ move the volume level over one bit to the right
ADC	R11, R11, #0x8000				@ halve both volume levels
BIC	R11, R11, #0xFF00				@ remove bit 15 if it is set
MOV	R1, R7						@ save the fine position in R1
UMLAL	R1, R0, R4, R8					@ multiply the sample amount per frame with the step frequency
MOV	R1, R1, LSR#23					@ divide the result by 0x800000 LONG DIVISION
ORR	R0, R1, R0, LSL#9				@ Are less samples needed than there is actually needed to fill the buffer
CMP	R2, R0						@ can we load a chunk of data without interruption to fill the buffer?
BLE	split_sample_loading				@ always jump

SUB	R2, R2, R0					@ calculate remaining samples after this channel processing (to write it back to memory)
LDR	R10, stack_capacity				@ load some work area address to R10
ADD	R10, R10, R0					@ place the work area pointer at the actual staart position
CMP	R10, SP						@ check if R10 is within the stack
ADD	R10, R3, R0					@ place the sample pointer end in R10
ADR	R9, custom_stack_3				@ load the custom stack to R9
STMIA	R9, {R2, R10, SP}				@ backup the sample block length, the end of sample and SP
CMPCC	R0, #0x400					@ check if the block length is above #0x400 (too long)
BCS	select_mixing_mode

BIC	R1, R3, #3					@ write a word aligned address to R1
MOV	R9, #0x04000000					@ write the DMA3 Sourceaddress
ADD	R9, R9, #0xD4					@

ADD	R0, R0, #7					@ add #7 to block length
MOV	R0, R0, LSR#2					@ do a word alignment ont R0
SUB 	SP, SP, R0, LSL#2				@ calculate the final destination location for the DMA
AND	R3, R3, #3					@ restore the alignment error to R3
ADD	R3, R3, SP					@ store the sample start position from the dma buffer in R3
ORR	LR, R0, #0x84000000				@ add the block length + #0x84000000 (DMA INIT Value) to LR
STMIA	R9, {R1, SP, LR}				@ write the DMA values to the IO registers and copy data


.if DMA_FIX==1							@ ### DMA Fix
MOV	R0, #0
MOV	R1, R0
MOV	R2, R1
STMIA	R9, {R0, R1, R2}
.endif

select_mixing_mode:

SUBS	R4, R4, #0x800000				@ check if sampling factor is lower than default rate
MOVPL	R11, R11, LSL#1					@ multiply volume levels by #2 if condition is ture
ADR	R0, math_resources				@ load a functiom pointer
ADDPL	R0, R0, #0x18					@ add 0x18 if we need to load more than 1 sample per step
SUBPLS	R4, R4, #0x800000				@ do we need to always load 2 samples?
ADDPL	R0, R0, #0x18					@ extend the pointer even further
ADDPL	R4, R4, #0x800000				@ restore the original value
LDR	R2, function_pointer				@ load the function pointer variable
CMP	R0, R2						@ check if the pointer is the same as in the variable
BEQ	mixing_init					@ if the user created routine already contains the right function we can skip the setup process

STR	R0, function_pointer				@ store the pointer to VAR
LDMIA	R0, {R0-R2, R8-R10}				@ load 6 opcodes from R0 to Registers
ADR	LR, runtime_created_routine			@ load the routine offset that is gonna be custom made in real time

create_routine_loop:
STMIA	LR, {R0, R1}					@ write the first 2 instructions
ADD	LR, LR, #0x98					@ extend the function pointer to Instr #38
STMIA	LR, {R0, R1}					@ write the same instruction here
SUB	LR, LR, #0x8C					@ go to Instr #3
STMIA	LR, {R2, R8-R10}				@ write #4 more instructions
ADD	LR, LR, #0x98					@ jump to Instr #41
STMIA	LR, {R2, R8-R10}				@ write those instructions aswell
SUB	LR, LR, #0x80					@ jump to next instruction block
ADDS	R5, R5, #0x40000000				@ do a loop until all 4 blocks are written to instruction block
BCC	create_routine_loop

LDR	R8, hq_buffer_length_label			@ load buffer length ins samples to R8

mixing_init:

MOV	R2, #0xFF000000					@ load the fine position overflow bitmask

mixing_loop:

LDMIA	R5, {R0, R1, R10, LR}				@ load 4 stereo samples to Registers
MUL	R9, R7, R12					@ multiply DELTA with fine position

runtime_created_routine:

NOP							@ Block #1
NOP
MLANE	R0, R11, R9, R0
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #2
NOP
MLANE	R1, R11, R9, R1
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #3
NOP
MLANE	R10, R11, R9, R10
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #4
NOP
MLANE	LR, R11, R9, LR
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
STMIA	R5!, {R0, R1, R10, LR}				@ write 4 stereo samples

LDMIA	R5, {R0, R1, R10, LR}				@ load the next 4 stereo samples
MULNE	R9, R7, R12					@ calc next DELTA
NOP							@ Block #1
NOP
MLANE	R0, R11, R9, R0
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #2
NOP
MLANE	R1, R11, R9, R1
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #3
NOP
MLANE	R10, R11, R9, R10
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
MULNE	R9, R7, R12
NOP							@ Block #4
NOP
MLANE	LR, R11, R9, LR
NOP
NOP
NOP
NOP
BIC	R7, R7, R2, ASR#1
STMIA	R5!, {R0, R1, R10, LR}				@ write 4 stereo samples
SUBS	R8, R8, #8					@ subtract 8 from the sample count
BGT	mixing_loop

ADR	R12, custom_stack_3				@ reload saved values
LDMIA	R12, {R2, R3, SP}
B	mixing_end_func


@ work variables

	.align	2
custom_stack_3:
	.word	0x0, 0x0, 0x0
stack_capacity:
	.word	0x03007910
function_pointer:
	.word	0x0

@ math resources, not directly used

math_resources:

MOV	R9, R9, ASR#22					@ Frequency Lower than default Frequency
ADDS	R9, R9, R6, LSL#1
ADDS	R7, R7, R4
ADDPL	R6, R12, R6
LDRPLSB	R12, [R3, #1]!
SUBPLS	R12, R12, R6

ADDS	R9, R6, R9, ASR#23				@ Frequency < 2x && Frequency > default frequency
ADD	R6, R12, R6
ADDS	R7, R7, R4
LDRPLSB	R6, [R3, #1]!
LDRSB	R12, [R3, #1]!
SUBS	R12, R12, R6

ADDS	R9, R6, R9, ASR#23				@ Frequency >= 2x higher than default Frequency
ADD	R7, R7, R4
ADD	R3, R3, R7, LSR#23
LDRSB	R6, [R3]
LDRSB	R12, [R3, #1]!
SUBS	R12, R12, R6

split_sample_loading:

ADD	R5, R5, R8, LSL#2				@ R5 = End of HQ buffer

uncached_mixing_loop:

MUL	R9, R7, R12					@ calc interpolated DELTA
MOV	R9, R9, ASR#22					@ scale down the DELTA
ADDS	R9, R9, R6, LSL#1				@ Add to Base Sample (upscaled to 8 bits again)
LDRNE	R0, [R5, -R8, LSL#2]				@ load sample from buffer
MLANE	R0, R11, R9, R0					@ add it to the buffer sample
STRNE	R0, [R5, -R8, LSL#2]				@ write the sample
ADD	R7, R7, R4					@ add the step size to the fine position
MOVS	R9, R7, LSR#23					@ write the overflow amount to R9
BEQ	uncached_mixing_load_skip			@ skip the mixing load if it isn't required

SUBS	R2, R2, R7, LSR#23				@ remove the overflow count from the remaning samples
BLLE	loop_end_sub					@ if the loop end is reached call the loop handler
SUBS	R9, R9, #1					@ remove #1 from the overflow count
ADDEQ	R6, R12, R6					@ new base sample is previous sample + DELTA
@RETURN LOCATION FROM LOOP HANDLER
LDRNESB	R6, [R3, R9]!					@ load new sample
LDRSB	R12, [R3, #1]!					@ load the delta sample (always required)
SUB	R12, R12, R6					@ calc new DELTA
BIC	R7, R7, #0x3F800000				@ clear the overflow from the fine position by using the bitmask

uncached_mixing_load_skip:

SUBS	R8, R8, #1					@ reduce the sample count for the buffer by #1
BGT	uncached_mixing_loop

mixing_end_func:

SUB	R3, R3, #1					@ reduce sample pointer by #1
LDMFD	SP!, {R4, R9, R12}				@ pop values from stack
STR	R7, [R4, #CHN_FINE_POSITION]			@ store the fine position
B	store_coarse_sample_pos				@ jump over to code to store coarse channel position

loop_end_sub:

ADD	R3, SP, #ARG_LOOP_START_POS+0xC			@ prepare sample loop start loading and lopo length loading (0xC due to the pushed stack pointer)
LDMIA	R3, {R3, R6}					@ R3 = Loop Start; R6 = Loop Length
CMP	R6, #0						@ check if loop is enabled; if Loop is enabled R6 is != 0
RSBNE	R9, R2, #0					@ the sample overflow from the resampling needs to get subtracted so the remaining samples is slightly less
ADDNE	R2, R6, R2					@ R2 = add the loop length
ADDNE	PC, LR, #8					@ return from the subroutine to 2 instructions after the actual return location
LDMFD	SP!, {R4, R9, R12}				@ restore registers from stack
B	update_channel_status

fixed_freq_loop_end_handler:

LDR	R2, [SP, #ARG_LOOP_LENGTH+0x8]			@ load the loop length value
MOVS	R6, R2						@ copy it to R6 and check if loop is disabled
LDRNE	R3, [SP, #ARG_LOOP_START_POS+0x8]		@ reset the sample pointer to the loop start position
BXNE	LR						@ if it loops return to mixing function, if it doesn't go on and end mixing

LDMFD	SP!, {R4, R9}

update_channel_status:

STRB	R6, [R4]					@ if loop ist disabled R6 = 0 and we can disable the channel by writing R6 to R4 (channel area)
B	switchto_thumb					@ switch to thumb

fixed_math_resource:	@ not exectued, used to create mixing function

MOVS	R6, R10, LSL#24
MOVS	R6, R6, ASR#24
MOVS	R6, R10, LSL#16
MOVS	R6, R6, ASR#24
MOVS	R6, R10, LSL#8
MOVS	R6, R6, ASR#24
MOVS	R6, R10, ASR#24
LDMIA	R3!, {R10}					@ load chunk of samples
MOVS	R6, R10, LSL#24
MOVS	R6, R6, ASR#24
MOVS	R6, R10, LSL#16
MOVS	R6, R6, ASR#24
MOVS	R6, R10, LSL#8
MOVS	R6, R6, ASR#24
LDMFD	SP!, {R4, R9, R12}

fixed_mixing_setup:

STMFD	SP!, {R4, R9}					@ backup the channel pointer and 

fixed_mixing_check_length:

MOV	LR, R2						@ move absolute sample position to LR
CMP	R2, R8						@ 
MOVGT	LR, R8						@ if there is less samples than the buffer to process write the smaller sample amount to LR
SUB	LR, LR, #1					@ shorten samples to process by #1
MOVS	LR, LR, LSR#2					@ calculate the amount of words to process (-1/4)
BEQ	fixed_mixing_process_unaligned			@ process the unaligned samples if there is <= 3 samples to process

SUB	R8, R8, LR, LSL#2				@ subtract the amount of samples we need to process from the buffer length
SUB	R2, R2, LR, LSL#2				@ subtract the amount of samples we need to process from the remaining samples
ADR	R1, fixed_mixing_custom_routine
ADR	R0, fixed_math_resource				@ load the 2 pointers to create function (@R0) by instructions from R1
MOV	R9, R3, LSL#30					@ move sample alignment bits to the leftmost position
ADD	R0, R0, R9, LSR#27				@ alignment * 8 + resource offset = new resource offset
LDMIA	R0!, {R6, R7, R9, R10}				@ load 4 instructions
STMIA	R1, {R6, R7}					@ write the 1st 2 instructions
ADD	R1, R1, #0xC					@ move label pointer over to the next slot
STMIA	R1, {R9, R10}					@ write 2nd block
ADD	R1, R1, #0xC					@ move label pointer to next block
LDMIA	R0, {R6, R7, R9, R10}				@ load instructions for block #3 and #4
STMIA	R1, {R6, R7}					@ write block #3
ADD	R1, R1, #0xC					@ ...
STMIA	R1, {R9, R10}					@ write block #4
LDMIA	R3!, {R10}					@ write read 4 samples from ROM

fixed_mixing_loop:

LDMIA	R5, {R0, R1, R7, R9}				@ load 4 samples from hq buffer

fixed_mixing_custom_routine:

NOP
NOP
MLANE	R0, R11, R6, R0					@ add new sample if neccessary
NOP
NOP
MLANE	R1, R11, R6, R1
NOP
NOP
MLANE	R7, R11, R6, R7
NOP
NOP
MLANE	R9, R11, R6, R9
STMIA	R5!, {R0, R1, R7, R9}				@ write the samples to the work area buffer
SUBS	LR, LR, #1					@ countdown the sample blocks to process
BNE	fixed_mixing_loop				@ if the end wasn't reached yet, repeat the loop

SUB	R3, R3, #4					@ reduce sample position by #4, we'll need to load the samples again

fixed_mixing_process_unaligned:

MOV	R1, #4						@ we need to repeat the loop #4 times to completley get rid of alignment errors

fixed_mixing_unaligned_loop:

LDR	R0, [R5]					@ load sample from buffer
LDRSB	R6, [R3], #1					@ load sample from ROM ro R6
MLA	R0, R11, R6, R0					@ write the sample to the buffer
STR	R0, [R5], #4
SUBS	R2, R2, #1					@ reduce alignment error by #1
BLEQ	fixed_freq_loop_end_handler
SUBS	R1, R1, #1
BGT	fixed_mixing_unaligned_loop			@ repeat the loop #4 times

SUBS	R8, R8, #4					@ reduce the sample amount we wrote to the buffer by #1
BGT	fixed_mixing_check_length			@ go up to repeat the mixing procedure until the buffer is filled

LDMFD	SP!, {R4, R9}					@ pop registers from stack

store_coarse_sample_pos:

STR	R2, [R4, #CHN_POSITION_REL]			@ store relative and absolute sample position
STR	R3, [R4, #CHN_POSITION_ABS]			

switchto_thumb:

ADR	R0, (check_remain_channels+1)			@ load the label offset and switch to thumb
BX	R0

	.thumb

check_remain_channels:

LDR	R0, [SP, #ARG_REMAIN_CHN]			@ load the remaining channels
SUB	R0, #1						@ reduce the amount by #1
BLE	mixer_return					@ end the mixing when finished processing all channels

ADD	R4, #0x40
B	mixer_entry

mixer_return:

ADR	R0, downsampler
BX	R0

downsampler_return:

LDR	R0, [SP, #ARG_VAR_AREA]			@ load the main var area to R0
LDR	R3, mixer_finished_status		@ load some status indication value to R3
STR	R3, [R0]				@ store this value to the main var area
ADD	SP, SP, #0x1C
POP	{R0-R7}
MOV	R8, R0
MOV	R9, R1
MOV	R10, R2
MOV	R11, R3
POP	{R3}
BX	R3

	.align	2

mixer_finished_status:
	.word	0x68736D53

	.arm

downsampler:

LDR	R10, hq_buffer_label
LDR	R9, [SP, #ARG_BUFFER_POS]
LDR	R8, hq_buffer_length_label
MOV	R11, #0xFF
.if PREVENT_CLIP==1

MOV	R12, #0xFFFFFFFF
MOV	R12, R12, LSL#14
MOV	R7, #0x630

downsampler_loop:

LDRSH	R2, [R10], #2
LDRSH	R0, [R10], #2
LDRSH	R3, [R10], #2
LDRSH	R1, [R10], #2

CMP	R0, #0x4000
MOVGE	R0, #0x3F80
CMP	R0, #-0x4000
MOVLT	R0, R12

CMP	R1, #0x4000
MOVGE	R1, #0x3F80
CMP	R1, #-0x4000
MOVLT	R1, R12

CMP	R2, #0x4000
MOVGE	R2, #0x3F80
CMP	R2, #-0x4000
MOVLT	R2, R12

CMP	R3, #0x4000
MOVGE	R3, #0x3F80
CMP	R3, #-0x4000
MOVLT	R3, R12

AND	R0, R11, R0, ASR#7
AND	R1, R11, R1, ASR#7
AND	R2, R11, R2, ASR#7
AND	R3, R11, R3, ASR#7

ORR	R2, R2, R3, LSL#8
ORR	R0, R0, R1, LSL#8

STRH	R2, [R9, R7]
STRH	R0, [R9], #2

SUBS	R8, #2
BGT	downsampler_loop

.else
downsampler_loop:

LDRH	R4, [R10], #2
LDRH	R0, [R10], #2
LDRH	R5, [R10], #2
LDRH	R1, [R10], #2
LDRH	R6, [R10], #2
LDRH	R2, [R10], #2
LDRH	R7, [R10], #2
LDRH	R3, [R10], #2

AND	R0, R11, R0, LSR#7
AND	R1, R11, R1, LSR#7
AND	R2, R11, R2, LSR#7
AND	R3, R11, R3, LSR#7
AND	R4, R11, R4, LSR#7
AND	R5, R11, R5, LSR#7
AND	R6, R11, R6, LSR#7
AND	R7, R11, R7, LSR#7

ORR	R4, R4, R5, LSL#8
ORR	R4, R4, R6, LSL#16
ORR	R4, R4, R7, LSL#24

ORR	R0, R0, R1, LSL#8
ORR	R0, R0, R2, LSL#16
ORR	R0, R0, R3, LSL#24

STR	R4, [R9, #0x630]
STR	R0, [R9], #4

SUBS	R8, #4
BGT	downsampler_loop

.endif

ADR	R0, (downsampler_return+1)
BX	R0

	.align	2

init_synth:

CMP	R12, #0		@ $030057C4
BNE	check_synth_type

LDRB	R6, [R3, #SYNTH_WIDTH_CHANGE_1]			@ for saw wave -> 0xF0 (base duty cycle change)
ADD	R2, R2, R6, LSL#24				@ add it to the current synt
LDRB	R6, [R3, #SYNTH_WIDTH_CHANGE_2]			@ for saw wave -> 0x80 (base duty cycle change #2)
ADDS	R6, R2, R6, LSL#24				@ add this to the synth state aswell but keep the old value in R2 and put the new one in R6
MVNMI	R6, R6	 					@ negate if duty cycle is > 50%
MOV	R10, R6, LSR#8					@ dividide the final duty cycle by 8 to R10
LDRB	R1, [R3, #SYNTH_MOD_AMOUNT]			@ for saw wave -> 0xE0
LDRB	R0, [R3, #SYNTH_BASE_WAVE_DUTY]			@ for saw wave -> 0x10 (base duty cycle offset)
MOV	R0, R0, LSL#24					@ convert it to a usable duty cycle
MLA	R6, R10, R1, R0					@ calculate the final duty cycle with the offset, and intensity * rotating duty cycle amount
STMFD	SP!, {R2, R3, R9, R12}

synth_type_0_loop:

LDMIA	R5, {R0-R3, R9, R10, R12, LR}			@ load 8 samples
CMP	R7, R6						@ Block #1
ADDCC	R0, R0, R11, LSL#6
SUBCS	R0, R0, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #2
ADDCC	R1, R1, R11, LSL#6
SUBCS	R1, R1, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #3
ADDCC	R2, R2, R11, LSL#6
SUBCS	R2, R2, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #4
ADDCC	R3, R3, R11, LSL#6
SUBCS	R3, R3, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #5
ADDCC	R9, R9, R11, LSL#6
SUBCS	R9, R9, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #6
ADDCC	R10, R10, R11, LSL#6
SUBCS	R10, R10, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #7
ADDCC	R12, R12, R11, LSL#6
SUBCS	R12, R12, R11, LSL#6
ADDS	R7, R7, R4, LSL#3
CMP	R7, R6						@ Block #8
ADDCC	LR, LR, R11, LSL#6
SUBCS	LR, LR, R11, LSL#6
ADDS	R7, R7, R4, LSL#3

STMIA	R5!, {R0-R3, R9, R10, R12, LR}			@ write 8 samples
SUBS	R8, R8, #8					@ remove #8 from sample count
BGT	synth_type_0_loop

LDMFD	SP!, {R2, R3, R9, R12}
B	mixing_end_func

check_synth_type:

SUBS	R12, R12, #1					@ remove #1 from the synth type byte and check if it's #0
BNE	synth_type_2					@ if it still isn't it's synth type 2 (smooth pan flute)

.if ENABLE_FM==1

B	setup_fm

.else
MOV	R6, #0x300					@ R6 = 0x300
MOV	R11, R11, LSR#1					@ halve the volume
BIC	R11, R11, #0xFF00				@ clear bad bits from division
MOV	R12, #0x70					@ R12 = 0x70

synth_type_1_loop:

LDMIA	R5, {R0, R1, R10, LR}				@ load 4 samples from memory
ADDS	R7, R7, R4, LSL#3				@ Block #1 (some oscillator type code)
RSB	R9, R12, R7, LSR#24
MOV	R6, R7, LSL#1
SUB	R9, R9, R6, LSR#27
ADDS	R2, R9, R2, ASR#1
MLANE	R0, R11, R2, R0

ADDS	R7, R7, R4, LSL#3				@ Block #2
RSB	R9, R12, R7, LSR#24
MOV	R6, R7, LSL#1
SUB	R9, R9, R6, LSR#27
ADDS	R2, R9, R2, ASR#1
MLANE	R1, R11, R2, R1

ADDS	R7, R7, R4, LSL#3				@ Block #3
RSB	R9, R12, R7, LSR#24
MOV	R6, R7, LSL#1
SUB	R9, R9, R6, LSR#27
ADDS	R2, R9, R2, ASR#1
MLANE	R10, R11, R2, R10

ADDS	R7, R7, R4, LSL#3				@ Block #4
RSB	R9, R12, R7, LSR#24
MOV	R6, R7, LSL#1
SUB	R9, R9, R6, LSR#27
ADDS	R2, R9, R2, ASR#1
MLANE	LR, R11, R2, LR

STMIA	R5!, {R0, R1, R10, LR}
SUBS	R8, R8, #4
BGT	synth_type_1_loop

B	mixing_end_func					@ goto end

.endif

synth_type_2:

MOV	R6, #0x80					@ write base values to the registers
MOV	R12, #0x180

synth_type_2_loop:

LDMIA	R5, {R0, R1, R10, LR}				@ load samples from work buffer
ADDS	R7, R7, R4, LSL#3				@ Block #1
RSBPL	R9, R6, R7, ASR#23
SUBMI	R9, R12, R7, LSR#23
MLA	R0, R11, R9, R0

ADDS	R7, R7, R4, LSL#3				@ Block #2
RSBPL	R9, R6, R7, ASR#23
SUBMI	R9, R12, R7, LSR#23
MLA	R1, R11, R9, R1

ADDS	R7, R7, R4, LSL#3				@ Block #3
RSBPL	R9, R6, R7, ASR#23
SUBMI	R9, R12, R7, LSR#23
MLA	R10, R11, R9, R10

ADDS	R7, R7, R4, LSL#3				@ Block #4
RSBPL	R9, R6, R7, ASR#23
SUBMI	R9, R12, R7, LSR#23
MLA	LR, R11, R9, LR

STMIA	R5!, {R0, R1, R10, LR}				@ store the samples back to the buffer
SUBS	R8, R8, #4					@ subtract #4 from the remainging samples
BGT	synth_type_2_loop

B	mixing_end_func

@****************** SPECIAL MIXING ******************@
.if ENABLE_DECOMPRESSION==1
special_mixing:		@ $03006BF8

LDR	R6, [R4, #CHN_WAVE_OFFSET]		@ load the wave header offset to R6
LDRB	R0, [R4]
TST	R0, #FLAG_CHN_COMP			@ check if the channel is initialized
BNE	setup_compressed_mixing_frequency	@ skip the setup procedure if it's running in compressed mode already

ORR	R0, R0, #FLAG_CHN_COMP			@ enable the flag in the channel status
STRB	R0, [R4]				@ store the channel status
LDRB	R0, [R4, #CHN_MODE]			@ load the channel mode byte
TST	R0, #MODE_REVERSE			@ check if reverse mode is not enabled

BEQ	determine_compression			@ if Reverse Mode isn't enabled we can directly check if the sample has to get decoded

LDR	R1, [R6, #WAVE_LENGTH]			@ load the amount of samples
ADD	R1, R1, R6, LSL#1			@ do some start position calculation
ADD	R1, R1, #0x20
SUB	R3, R1, R3
STR	R3, [R4, #CHN_POSITION_ABS]		@ store the final seek position

determine_compression:

LDRH	R0, [R6]				@ load the compression flag from the sample header
CMP	R0, #0					@ check if the compression is not enabled
BEQ	setup_compressed_mixing_frequency	@ skip the compression handler

SUB	R3, R3, R6				@ calc initial position
SUB	R3, R3, #0x10
STR	R3, [R4, #CHN_POSITION_ABS]		@ store the inital position (relative, not absolute)

setup_compressed_mixing_frequency:

STMFD	SP!, {R4, R9, R12}

MOVS	R11, R11, LSR#1				@ divide master volume by 2
ADC	R11, R11, #0x8000
BIC	R11, R11, #0xFF00

LDR	R7, [R4, #CHN_FINE_POSITION]		@ load the fine position
LDR	R1, [R4, #CHN_FREQUENCY]		@ load the channel frequency
LDRB	R0, [R4, #CHN_MODE]			@ load the channel mode again
TST	R0, #MODE_FIXED_FREQ			@ check if fixed frequency mode is enabled
MOVNE	R1, #0x800000				@ ### SAMPLE STEP FREQUENCY CHANGED TO R7
MULEQ	R1, R12, R1				@ default rate factor * frequency = sample steps

ADD	R5, R5, R8, LSL#2			@ set the buffer pointer to the end of the channel

LDRH	R0, [R6]				@ load the codec type
CMP	R0, #0					@ check if compression is disabled
BEQ	uncompressed_mixing_reverse_check

MOV	R0, #0xFF000000				@ set the current decoding block to "something very high" so that the first block always gets decoded
STR	R0, [R4, #CHN_BLOCK_COUNT]		@ write the last decoded block into the channel vars
LDRB	R0, [R4, #CHN_MODE]			@ check again if reverse mode is enabled
TST	R0, #MODE_REVERSE			@ test if reverse mode is enabled
BNE	compressed_mixing_reverse_init		@ check again of reverse mixing is enabled

BL	bdpcm_decoder				@ load a sample from the stream to R12
MOV	R6, R12					@ move the base sample to R6
ADD	R3, R3, #1				@ increase stream position by #1
BL	bdpcm_decoder				@ load the delta sample and calculate delta value
SUB	R12, R12, R6

@***** MIXING LOOP REGISTER USAGE ***********@
@ R0:	Sample to modify from buffer
@ R1:	sample steps		(MOVED FROM R4)
@ R2:	remaining samples before loop/end
@ R3:	sample position
@ R4:	channel pointer
@ R5:	pointer to the end of buffer
@ R6:	Base sample
@ R7:	fine position
@ R8:	remaining samples for current buffer
@ R9:	interpolated sample
@ R10:	not used
@ R11:	volume
@ R12:	Delta Sample
@ LR:	not used
@********************************************@

compressed_mixing_loop:

MUL	R9, R7, R12				@ delta sample * fine position = interpolated DELTA
MOV	R9, R9, ASR#22				@ scale down the sample
ADDS	R9, R9, R6, LSL#1			@ double the base sample and add it to the interpolated downscaled DELTA
LDRNE	R0, [R5, -R8, LSL#2]			@ if the sample is NOT 0 load the sample from buffer and store the calulated value
MLANE	R0, R11, R9, R0				@ add the sample to the buffer sample and apply volume
STRNE	R0, [R5, -R8, LSL#2]			@ store the sample if it's not Zero
ADD	R7, R7, R1				@ ### changed from R4 to R1
MOVS	R9, R7, LSR#23				@ check if there is new samples to load

BEQ	compressed_mixing_load_skip		@ no new samples need to be loaded

SUBS	R2, R2, R7, LSR#23			@ remove the sample overflow from the remaining samples
BLLE	loop_end_sub				@ call the loop/ending handler if the countdown reached zero or something negative
SUBS	R9, R9, #1				@ check if only one sample has to get loaded
ADDEQ	R6, R12, R6				@ if this is the case we can calculate the new base sample
BEQ	compressed_mixing_base_load_skip

ADD	R3, R3, R9				@ these opcodes are equivalent to LDRNESB R6, [R3, R9]!
BL	bdpcm_decoder
MOV	R6, R12

compressed_mixing_base_load_skip:

ADD	R3, R3, #1					@ equivalent to LDRSB	R12, [R3, #1]!
BL	bdpcm_decoder
SUB	R12, R12, R6
BIC	R7, R7, #0x3F800000			@ clear the overflow bits by using the according bitmask

compressed_mixing_load_skip:

SUBS	R8, R8, #1				@ remove #1 from the remaining samples
BGT	compressed_mixing_loop

@SUB	R3, R3, #1				@ sample pointer -1 ; ALREADY DONE BY mixing_end_func
B	mixing_end_func




compressed_mixing_reverse_init:

SUB	R3, R3, #1				@ subtract one from the reverse playback location initially
BL	bdpcm_decoder				@ fetch a sample from stream
MOV	R6, R12					@ bdpcm_decoder returns base sample in R12 --> R6
SUB	R3, R3, #1				@ seek one sample further backwards
BL	bdpcm_decoder				@ detch the DELTA sample
SUB	R12, R12, R6				@ calc the Delta value

compressed_mixing_reverse_loop:

MUL	R9, R7, R12				@ delta sample * fine position = interpolated DELTA
MOV	R9, R9, ASR#22				@ scale down the sample
ADDS	R9, R9, R6, LSL#1			@ double the base sample and add it to the interpolated downscaled DELTA
LDRNE	R0, [R5, -R8, LSL#2]			@ if the sample is NOT 0 load the sample from buffer and store the calulated value
MLANE	R0, R11, R9, R0				@ add the sample to the buffer sample and apply volume
STRNE	R0, [R5, -R8, LSL#2]			@ store the sample if it's not Zero
ADD	R7, R7, R1				@ ### changed from R4 to R1
MOVS	R9, R7, LSR#23				@ check if there is new samples to load

BEQ	compressed_mixing_reverse_load_skip	@ skip sample loading if we don't need to load new samples from ROM

SUBS	R2, R2, R7, LSR#23			@ remove the overflowed samples from the remaining samples
BLLE	loop_end_sub				@ if the sample playback finished go to end handler

SUBS	R9, R9, #1				@ remove sample overflow count by #1
ADDEQ	R6, R12, R6				@ make the previous delta sample the new base sample if only #1 sample needs to get loaded
BEQ	compressed_mixing_reverse_base_load_skip @skip base sample loading

SUB	R3, R3, R9				@
BL	bdpcm_decoder				@
MOV	R6, R12					@

compressed_mixing_reverse_base_load_skip:

SUB	R3, R3, #1
BL	bdpcm_decoder
SUB	R12, R12, R6				@ load next samples
BIC	R7, R7, #0x3F800000			@ clear overflow bits

compressed_mixing_reverse_load_skip:

SUBS	R8, R8, #1
BGT	compressed_mixing_reverse_loop

@ADD	R3, R3, #2				@ copied from original code
ADD	R3, R3, #3

B	mixing_end_func


uncompressed_mixing_reverse_check:

LDRB	R0, [R4, #1]				@ load the channel mode		=$03006D84
TST	R0, #MODE_REVERSE			@ check if reverse mode is even enabled
BEQ	mixing_end_func				@ skip the channel if the mode is "akward"

LDRSB	R6, [R3, #-1]!				@ load first negative sample
LDRSB	R12, [R3, #-1]				@ load the DELTA sample
SUB	R12, R12, R6				@ calculate DELTA

reverse_mixing_loop:

MUL	R9, R7, R12				@ delta sample * fine position = interpolated DELTA
MOV	R9, R9, ASR#22				@ scale down the sample
ADDS	R9, R9, R6, LSL#1			@ double the base sample and add it to the interpolated downscaled DELTA
LDRNE	R0, [R5, -R8, LSL#2]			@ if the sample is NOT 0 load the sample from buffer and store the calulated value
MLANE	R0, R11, R9, R0				@ add the sample to the buffer sample and apply volume
STRNE	R0, [R5, -R8, LSL#2]			@ store the sample if it's not Zero
ADD	R7, R7, R1				@ ### changed from R4 to R1
MOVS	R9, R7, LSR#23				@ check if there is new samples to load

BEQ	reverse_mixing_load_skip

SUBS	R2, R2, R7, LSR#23			@ blablabla, all same as above
BLLE	loop_end_sub

MOVS	R9, R9					@ check if sample 
ADDEQ	R6, R12, R6
LDRNESB	R6, [R3, -R9]!
LDRSB	R12, [R3, #-1]				@ load samples dependent on conditions
SUB	R12, R12, R6
BIC	R7, R7, #0x3F800000			@ cut off overflow count to get new fine position

reverse_mixing_load_skip:

SUBS	R8, R8, #1				@ remaining samples -1
BGT	reverse_mixing_loop			@ continue lopo if there is still samples to process

@ADD	R3, R3, #1				@ copied from original code
ADD	R3, R3, #2				@ =$03006DE8

B	mixing_end_func

@**************** SPECIAL MIXING END ****************@

@************** SPECIAL MIXING LOOPING **************@

compressed_loop_end_sub:




@************ SPECIAL MIXING LOOPING END ************@

@****************** BDPCM DEOCODER ******************@

bdpcm_decoder:				@ RETURNS SAMPLE FROM POSITION XXX in R12

STMFD	SP!, {R0, R2, R5-R7, LR}		@ push registers to make them free to use: R0, R2, R5, R6, R7, LR
MOV	R0, R3, LSR#6				@ shift the relative position over to clip of every but the block offset
LDR	R12, [R4, #CHN_BLOCK_COUNT]		@ check if the current sample position is at the beginning of the current block
CMP	R0, R12
BEQ	bdpcm_decoder_return

STR	R0, [R4, #CHN_BLOCK_COUNT]		@ store the block position to Channel Vars
MOV	R12, #0x21				@ load decoding byte count to R1 (1 Block = 0x21 Bytes)
MUL	R2, R12, R0				@ multiply the block count with the block length to calc actual byte position of current block
LDR	R12, [R4, #CHN_WAVE_OFFSET]		@ load the wave data offset to R1
ADD	R2, R2, R12				@ add the wave data offset and 0x10 to get the actual position in ROM
ADD	R2, R2, #0x10				@ 
LDR	R5, decoder_buffer			@ load the decoder buffer pointer to R5
ADR	R6, delta_lookup_table			@ load the lookup table pointer to R6
MOV	R7, #0x40				@ load the block sample count (0x40) to R7
LDRB	LR, [R2], #1				@ load the first byte & sample from the wave data to LR (each block starts with a signed 8 bit pcm sample) LDRSB not necessary due to the 24 high bits being cut off anyway
STRB	LR, [R5], #1				@ write the sample to the decoder buffer
LDRB	R12, [R2], #1				@ load the next 2 samples to R1 (to get decoded) --- LSBits is decoded first and MSBits last
B	bdpcm_decoder_lsb

bdpcm_decoder_msb:

LDRB	R12, [R2], #1				@ load the next 2 samples to get decoded
MOV	R0, R12, LSR#4				@ seperate the current samples' bits
LDRSB	R0, [R6, R0]				@ load the differential value from the lookup table
ADD	LR, LR, R0				@ add the decoded value to the previous sample value to calc the current samples' level
STRB	LR, [R5], #1				@ write the output sample to the decoder buffer and increment buffer pointer

bdpcm_decoder_lsb:

AND	R0, R12, #0xF				@ seperate the 4 LSBits
LDRSB	R0, [R6, R0]				@ but the 4 bit value into the lookup table and save the result to R0
ADD	LR, LR, R0				@ add the value from the lookup table to the previous value to calc the new one
STRB	LR, [R5], #1				@ store the decoded sample to the decoding buffer
SUBS	R7, R7, #2				@ decrease the block sample counter by 2 (2 samples each byte) and check if it is still above 0
BGT	bdpcm_decoder_msb			@ if there is still samples to decode jump to the MSBits

bdpcm_decoder_return:

LDR	R5, decoder_buffer			@ reload the decompressor buffer offset to R5
AND	R0, R3, #0x3F				@ cut off the main position bits to read data from short buffer
LDRSB	R12, [R5, R0]				@ read the decoded sample from buffer
LDMFD	SP!, {R0, R2, R5-R7, PC}		@ pop registers and return to the compressed sample mixer

@**************** END BDPCM DECODER *****************@

decoder_buffer:
	.word	decoder_buffer_target
delta_lookup_table:
	.byte	0x0, 0x1, 0x4, 0x9, 0x10, 0x19, 0x24, 0x31, 0xC0, 0xCF, 0xDC, 0xE7, 0xF0, 0xF7, 0xFC, 0xFF
.endif

.if ENABLE_FM==1
sin_lookup:
        .byte   0x00, 0x02, 0x03, 0x05, 0x06, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x10, 0x11, 0x13, 0x14, 0x16, 0x17
        .byte   0x19, 0x1A, 0x1C, 0x1D, 0x1F, 0x20, 0x22, 0x23, 0x25, 0x26, 0x28, 0x29, 0x2B, 0x2C, 0x2E, 0x2F
        .byte   0x31, 0x32, 0x33, 0x35, 0x36, 0x38, 0x39, 0x3A, 0x3C, 0x3D, 0x3F, 0x40, 0x41, 0x43, 0x44, 0x45
        .byte   0x47, 0x48, 0x49, 0x4A, 0x4C, 0x4D, 0x4E, 0x4F, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x58, 0x59
        .byte   0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69
        .byte   0x6A, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x6F, 0x70, 0x71, 0x71, 0x72, 0x73, 0x73, 0x74, 0x75
        .byte   0x75, 0x76, 0x76, 0x77, 0x78, 0x78, 0x79, 0x79, 0x7A, 0x7A, 0x7A, 0x7B, 0x7B, 0x7C, 0x7C, 0x7C
        .byte   0x7D, 0x7D, 0x7D, 0x7D, 0x7E, 0x7E, 0x7E, 0x7E, 0x7E, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F
        .byte   0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7F, 0x7E, 0x7E, 0x7E, 0x7E, 0x7E, 0x7D, 0x7D, 0x7D
        .byte   0x7D, 0x7C, 0x7C, 0x7C, 0x7B, 0x7B, 0x7A, 0x7A, 0x7A, 0x79, 0x79, 0x78, 0x78, 0x77, 0x76, 0x76
        .byte   0x75, 0x75, 0x74, 0x73, 0x73, 0x72, 0x71, 0x71, 0x70, 0x6F, 0x6F, 0x6E, 0x6D, 0x6C, 0x6B, 0x6A
        .byte   0x6A, 0x69, 0x68, 0x67, 0x66, 0x65, 0x64, 0x63, 0x62, 0x61, 0x60, 0x5F, 0x5E, 0x5D, 0x5C, 0x5B
        .byte   0x5A, 0x59, 0x58, 0x56, 0x55, 0x54, 0x53, 0x52, 0x51, 0x4F, 0x4E, 0x4D, 0x4C, 0x4A, 0x49, 0x48
        .byte   0x47, 0x45, 0x44, 0x43, 0x41, 0x40, 0x3F, 0x3D, 0x3C, 0x3A, 0x39, 0x38, 0x36, 0x35, 0x33, 0x32
        .byte   0x31, 0x2F, 0x2E, 0x2C, 0x2B, 0x29, 0x28, 0x26, 0x25, 0x23, 0x22, 0x20, 0x1F, 0x1D, 0x1C, 0x1A
        .byte   0x19, 0x17, 0x16, 0x14, 0x13, 0x11, 0x10, 0x0E, 0x0C, 0x0B, 0x09, 0x08, 0x06, 0x05, 0x03, 0x02
        .byte   0x00, 0xFE, 0xFD, 0xFB, 0xFA, 0xF8, 0xF7, 0xF5, 0xF4, 0xF2, 0xF0, 0xEF, 0xED, 0xEC, 0xEA, 0xE9
        .byte   0xE7, 0xE6, 0xE4, 0xE3, 0xE1, 0xE0, 0xDE, 0xDD, 0xDB, 0xDA, 0xD8, 0xD7, 0xD5, 0xD4, 0xD2, 0xD1
        .byte   0xCF, 0xCE, 0xCD, 0xCB, 0xCA, 0xC8, 0xC7, 0xC6, 0xC4, 0xC3, 0xC1, 0xC0, 0xBF, 0xBD, 0xBC, 0xBB
        .byte   0xB9, 0xB8, 0xB7, 0xB6, 0xB4, 0xB3, 0xB2, 0xB1, 0xAF, 0xAE, 0xAD, 0xAC, 0xAB, 0xAA, 0xA8, 0xA7
        .byte   0xA6, 0xA5, 0xA4, 0xA3, 0xA2, 0xA1, 0xA0, 0x9F, 0x9E, 0x9D, 0x9C, 0x9B, 0x9A, 0x99, 0x98, 0x97
        .byte   0x96, 0x96, 0x95, 0x94, 0x93, 0x92, 0x91, 0x91, 0x90, 0x8F, 0x8F, 0x8E, 0x8D, 0x8D, 0x8C, 0x8B
        .byte   0x8B, 0x8A, 0x8A, 0x89, 0x88, 0x88, 0x87, 0x87, 0x86, 0x86, 0x86, 0x85, 0x85, 0x84, 0x84, 0x84
        .byte   0x83, 0x83, 0x83, 0x83, 0x82, 0x82, 0x82, 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81
        .byte   0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x82, 0x82, 0x82, 0x82, 0x82, 0x83, 0x83, 0x83
        .byte   0x83, 0x84, 0x84, 0x84, 0x85, 0x85, 0x86, 0x86, 0x86, 0x87, 0x87, 0x88, 0x88, 0x89, 0x8A, 0x8A
        .byte   0x8B, 0x8B, 0x8C, 0x8D, 0x8D, 0x8E, 0x8F, 0x8F, 0x90, 0x91, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96
        .byte   0x96, 0x97, 0x98, 0x99, 0x9A, 0x9B, 0x9C, 0x9D, 0x9E, 0x9F, 0xA0, 0xA1, 0xA2, 0xA3, 0xA4, 0xA5
        .byte   0xA6, 0xA7, 0xA8, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF, 0xB1, 0xB2, 0xB3, 0xB4, 0xB6, 0xB7, 0xB8
        .byte   0xB9, 0xBB, 0xBC, 0xBD, 0xBF, 0xC0, 0xC1, 0xC3, 0xC4, 0xC6, 0xC7, 0xC8, 0xCA, 0xCB, 0xCD, 0xCE
        .byte   0xCF, 0xD1, 0xD2, 0xD4, 0xD5, 0xD7, 0xD8, 0xDA, 0xDB, 0xDD, 0xDE, 0xE0, 0xE1, 0xE3, 0xE4, 0xE6
        .byte   0xE7, 0xE9, 0xEA, 0xEC, 0xED, 0xEF, 0xF0, 0xF2, 0xF4, 0xF5, 0xF7, 0xF8, 0xFA, 0xFB, 0xFD, 0xFE

setup_fm:

LDRB	R0, [R3, #1]					@ load frequency scaling factor
LDR	R1, fm_freq_scaling_resource			@ load base opcode
ORR	R1, R1, R0, LSL#7				@ modify the left shift to match the setting
LDRB	R0, [R3, #2]
LDR	R10, fm_intensity_resource			@ same for the intensity
ORR	R10, R10, R0, LSL#7
ADR	LR, fm_loop_parse

fm_setup_loop:

STR	R1, [LR, #4]
STR	R10, [LR, #16]
ADD	LR, LR, #32
ADDS	R8, R8, #0x40000000
BCC	fm_setup_loop

ADR	R12, sin_lookup

fm_loop:

LDMIA	R5, {R0, R1, R10, LR}				@ load 4 samples from memory

fm_loop_parse:

ADDS	R7, R7, R4, LSL#3
ADDS	R2, R2, R4, LSL#6				@ Modulation Frequency Scaling Factor (LSL#3 = Bias Level)
MOV	R9, R2, LSR#23
LDRSB	R6, [R12, R9]
ADDS	R7, R7, R6, LSL#20				@ Modulation Intensity
MOV	R9, R7, LSR#23
LDRSB	R6, [R12, R9]
MLA	R0, R11, R6, R0

ADDS	R7, R7, R4, LSL#3
ADDS	R2, R2, R4, LSL#6
MOV	R9, R2, LSR#23
LDRSB	R6, [R12, R9]
ADDS	R7, R7, R6, LSL#20
MOV	R9, R7, LSR#23
LDRSB	R6, [R12, R9]
MLA	R1, R11, R6, R1

ADDS	R7, R7, R4, LSL#3
ADDS	R2, R2, R4, LSL#6
MOV	R9, R2, LSR#23
LDRSB	R6, [R12, R9]
ADDS	R7, R7, R6, LSL#20
MOV	R9, R7, LSR#23
LDRSB	R6, [R12, R9]
MLA	R10, R11, R6, R10

ADDS	R7, R7, R4, LSL#3
ADDS	R2, R2, R4, LSL#6
MOV	R9, R2, LSR#23
LDRSB	R6, [R12, R9]
ADDS	R7, R7, R6, LSL#20
MOV	R9, R7, LSR#23
LDRSB	R6, [R12, R9]
MLA	LR, R11, R6, LR

STMIA	R5!, {R0, R1, R10, LR}
SUBS	R8, R8, #4
BGT	fm_loop

B	mixing_end_func

fm_freq_scaling_resource:

ADDS	R2, R2, R4

fm_intensity_resource:

ADDS	R7, R7, R6

.endif

main_mixer_end:

	.end
