
.text
.thumb

#define LAN_DE

.align 2
.global test_some_test
test_some_test:
ldr r0, =test_string
bx lr

.align 2
test_string:
#ifdef LAN_DE
		.byte 0xC2, 0xD5, 0xE0, 0xE0, 0xE3, 0xFF
#endif

#ifdef LAN_EN
		.byte 0xC2, 0xD9, 0xE0, 0xE0, 0xE3, 0xFF
#endif

