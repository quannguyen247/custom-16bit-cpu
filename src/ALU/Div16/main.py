import math

# ==============================================================================
# GEMINI PRO 4.0 ULTRA - OPTIMIZED LUT GENERATOR
# ==============================================================================
# Muc tieu: Tao bang tra nghich dao (1/D) cho bo chia 16-bit.
# Kien truc:
#   - Dia chi 0-2047: Direct Mapping (Moi dia chi la 1 so chia).
#   - Dia chi 2048-4095: Step Mapping (Moi dia chi dai dien cho 32 so chia).
#
# NGUYEN TAC AN TOAN (CRITICAL):
#   Phan cung chi co co che sua loi cong 1 (if Remainder >= Divisor).
#   Do do, thuong uoc luong (Q_est) KHONG DUOC PHEP lon hon thuong thuc (Q_true).
#   => Gia tri LUT phai luon <= 1/Divisor voi moi Divisor trong khoang mapping.
#   => Voi Step Mapping, phai dung gia tri MAX cua khoang Divisor de tinh nghich dao.
# ==============================================================================

filename = "lut.mif"
depth = 4096
width = 32
scale = 2**32
max_32bit = 0xFFFFFFFF
split_point = 2048  # Diem chuyen tu Direct sang Step mapping

# Hardware logic:
# If D < 2048: Address = D
# If D >= 2048: Address = 2048 + (D >> 5)
# => Voi Step Mapping, moi dia chi 'i' dai dien cho khoang D:
#    D_base = (i - 2048) * 32
#    Range = [D_base, D_base + 31]

with open(filename, 'w') as f:
    # Header MIF chuan Quartus
    f.write(f"DEPTH = {depth};\n")
    f.write(f"WIDTH = {width};\n")
    f.write("ADDRESS_RADIX = DEC;\n")
    f.write("DATA_RADIX = HEX;\n")
    f.write("CONTENT\n")
    f.write("BEGIN\n")

    # ---------------------------------------------------------
    # PHAN 1: DIRECT MAPPING (0 -> 2047)
    # Do chinh xac tuyet doi vi moi D co 1 entry rieng.
    # ---------------------------------------------------------
    print("Generating Direct Mapping Region (0-2047)...")
    for i in range(split_point):
        if i == 0:
            val = max_32bit # Tranh chia cho 0
        else:
            # Tinh 2^32 / i
            # Su dung phep chia nguyen (floor) la an toan vi luon <= gia tri thuc
            val = scale // i
            if val > max_32bit: val = max_32bit
        
        f.write(f"{i} : {val:08X};\n")

    # ---------------------------------------------------------
    # PHAN 2: STEP MAPPING (2048 -> 4095)
    # Vung nay map cac so chia lon (>= 2048).
    # ---------------------------------------------------------
    print("Generating Step Mapping Region (2048-4095)...")
    
    # Shift amount cua phan cung la 5 (chia cho 32)
    step_size = 32 
    
    for i in range(split_point, depth):
        # Tinh offset tu diem split
        k = i - split_point
        
        # Khoang gia tri D ma dia chi 'i' nay dai dien:
        # D_start = k * 32
        # D_end   = k * 32 + 31
        
        # De dam bao an toan (Q_est <= Q_true), ta phai dung D_end de tinh nghich dao.
        # Vi 1/D_end <= 1/D_any_in_range.
        d_safe = (k * step_size) + (step_size - 1) # Lay gia tri lon nhat trong khoang
        
        if d_safe == 0: # Ly thuyet khong xay ra vi k=0 -> d_safe=31, nhung cu check
            val = max_32bit
        else:
            val = scale // d_safe
            if val > max_32bit: val = max_32bit

        # Ghi chu:
        # Vung dia chi tu 2048 den 2111 thuc te la "Dead Zone" (Vung chet).
        # Vi D >= 2048 thi (D >> 5) >= 64.
        # => Address = 2048 + (D >> 5) >= 2112.
        # => Cac dia chi 2048 -> 2111 tuong ung voi D < 2048, nhung D < 2048 lai dung Direct Mapping.
        # Tuy nhien, ta cu tinh toan day du de file MIF sach se.
        
        f.write(f"{i} : {val:08X};\n")

    f.write("END;\n")

print(f"SUCCESS: {filename} generated with SAFE APPROXIMATION algorithm.")