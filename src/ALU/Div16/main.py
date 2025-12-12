import math

filename = "lut.mif"
depth = 4096 # So phan tu trong LUT

scale = 2**32
max_32bit = 0xFFFFFFFF
split_point = depth // 2

# Tinh so bit dia chi: log2(4096) = 12
addr_bits = int(math.log2(depth))

# Tinh do dich bit cho vung so lon
# Cong thuc: Shift = 16 - (So_bit_dia_chi - 1)
shift_amount = 17 - addr_bits
half_offset = 1 << (shift_amount - 1)

with open(filename, 'w') as f:
    f.write(f"DEPTH = {depth};\n")
    f.write("WIDTH = 32;\n")
    f.write("ADDRESS_RADIX = DEC;\n")
    f.write("DATA_RADIX = HEX;\n")
    f.write("CONTENT\n")
    f.write("BEGIN\n")

    for i in range(split_point):
        if i == 0:
            val = max_32bit
        else:
            val = int(scale / i)
            if val > max_32bit: val = max_32bit
        f.write(f"{i} : {val:08X};\n")

    for i in range(split_point, depth):
        high_part = i - split_point
        real_val = (high_part << shift_amount) + half_offset
        
        if real_val == 0:
            val = max_32bit
        else:
            val = int(scale / real_val)
            if val > max_32bit: val = max_32bit
        f.write(f"{i} : {val:08X};\n")

    f.write("END;\n")

print(f"Generated {filename} | Depth: {depth} | Split: {split_point} | Shift: {shift_amount}")