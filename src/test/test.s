
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
.string LAN_DE "Hallo"
.string LAN_EN "Hello"
