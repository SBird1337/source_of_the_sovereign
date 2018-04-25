arm-none-eabi-gcc -T sots.sym main.c graphics/cassette.c graphics/background.c -mthumb -mthumb-interwork -O3 -nostdlib -o main.o -Wl,--section-start=.text=09DF0000
arm-none-eabi-objcopy -O binary main.o main.bin
arm-none-eabi-objdump -x main.o > main.txt

pause

dd if="main.bin" of="test.gba" conv=notrunc seek=31391744 bs=1