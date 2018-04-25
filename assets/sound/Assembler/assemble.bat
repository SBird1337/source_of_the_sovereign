arm-none-eabi-as.exe IdleLoopElimination.s -o IdleLoopElimination.o
arm-none-eabi-objcopy.exe -O binary IdleLoopElimination.o IdleLoopElimination.bin

arm-none-eabi-as.exe overRideMusicInjector.s -o overRideMusicInjector.o
arm-none-eabi-objcopy.exe -O binary overRideMusicInjector.o overRideMusicInjector.bin

pause