arm-none-eabi-as.exe main_2_advanced.s -o main.o
arm-none-eabi-objcopy.exe -O binary main.o main.bin

pause