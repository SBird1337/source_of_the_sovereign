EMULATOR=E:/OneDrive/Hacking/Romhacking/Emulator/mGBA-0.5.2-2016-12-31-win32/mgba.exe

# Start mGBA in the background
pwd
cygstart $EMULATOR -g sots/source_of_the_sovereign/build/pkmn_sots.gba
sleep 4
exit
