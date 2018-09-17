import struct

with open("pkmn_sots.dmp", "rb") as f:
    output = ""
    while True:
        s = f.read(2)
        if not s:
            break
        col = struct.unpack("<H", s)[0]
        r = col & 0x1F
        g = (col >> 5) & 0x1F
        b = (col >> 10) & 0x1F
        output = output + "rgb82rgb5(0x{:02x},0x{:02x},0x{:02x}), ".format(r*8,g*8,b*8)
    print(output)