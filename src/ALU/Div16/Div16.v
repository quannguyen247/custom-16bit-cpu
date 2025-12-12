    module Div16 (
        input  wire        clk,        // Cần clock để đọc Block RAM (M4K)
        input  wire [15:0] dividend,   // Số bị chia (A)
        input  wire [15:0] divisor,    // Số chia (B)
        output reg  [15:0] quotient,   // Thương (Q)
        output reg  [15:0] remainder   // Dư (R)
    );

        // ============================================================
        // PHẦN 1: LOGIC TẠO ĐỊA CHỈ (SMART MAPPING CHO EP2C35 - 4096)
        // ============================================================
        // Chiến thuật:
        // - Vùng nhỏ (0 - 2047): Map trực tiếp (Exact).
        // - Vùng lớn (>= 2048):  Map theo 11 bit cao nhất (divisor[15:5]).
        // Điều này đảm bảo sai số luôn < 1 đơn vị trên toàn dải.
        
        wire [11:0] rom_addr;
        wire       is_large; // Large bây giờ là >= 2048
        
        // Kiểm tra ngưỡng 2048 (Bit [15:11] có dữ liệu)
        assign is_large = |divisor[15:11];

        // Mux chọn địa chỉ:
        // - Nếu >= 2048: Bit 11=1. Lấy divisor[15:5] (Giá trị từ 64 đến 2047).
        // - Nếu < 2048:  Bit 11=0. Lấy divisor[10:0] (Giá trị từ 0 đến 2047).
        // Lưu ý: Với số lớn, divisor[15:5] luôn >= 64, nên không bị trùng vùng thấp của bank 1.
        assign rom_addr = is_large ? {1'b1, divisor[15:5]} : {1'b0, divisor[10:0]};


        // ============================================================
        // PHẦN 2: KHỐI RAM (ALTSYNCRAM) - SINGLE CYCLE MODE
        // ============================================================
        wire [31:0] inv_val; 
        
        // KHÔNG dùng thanh ghi đệm để đảm bảo kết quả ra ngay trong chu kỳ
        // Fmax sẽ bị giới hạn bởi thời gian truy cập RAM + Nhân + Sửa lỗi

        altsyncram #(
            .clock_enable_input_a("BYPASS"),
            .clock_enable_output_a("BYPASS"),
            .init_file("lut.mif"),
            .intended_device_family("Cyclone II"),
            .lpm_hint("ENABLE_RUNTIME_MOD=NO"),
            .lpm_type("altsyncram"),
            .numwords_a(4096),
            .operation_mode("ROM"),
            .outdata_aclr_a("NONE"),
            
            // --- SINGLE CYCLE CONFIG ---
            // Bắt buộc phải là UNREGISTERED để có dữ liệu ngay lập tức
            // Nếu bật CLOCK0, dữ liệu sẽ bị trễ sang chu kỳ sau (Multi-cycle)
            .outdata_reg_a("UNREGISTERED"), 
            
            .widthad_a(12),
            .width_a(32),
            .width_byteena_a(1)
        ) rom_inst (
            .address_a(rom_addr),
            .clock0(clk),
            .q_a(inv_val),
            .aclr0(1'b0), .aclr1(1'b0), .address_b(1'b1), .addressstall_a(1'b0),
            .addressstall_b(1'b0), .byteena_a(1'b1), .byteena_b(1'b1),
            .clock1(1'b1), .clocken0(1'b1), .clocken1(1'b1), .clocken2(1'b1),
            .clocken3(1'b1), .data_a({32{1'b1}}), .data_b(1'b1), .eccstatus(),
            .q_b(), .rden_a(1'b1), .rden_b(1'b1), .wren_a(1'b0), .wren_b(1'b0)
        );

        // ============================================================
        // PHẦN 3: TÍNH TOÁN VÀ SỬA LỖI (CORRECTION)
        // ============================================================
        
        wire [47:0] product_raw;
        wire [15:0] q_est;
        wire [31:0] check_mul;
        wire [15:0] r_est;
        
        reg [15:0] q_corr1;
        reg [15:0] r_corr1;

        // Sử dụng trực tiếp input (Combinational path)
        // A * (1/B)
        assign product_raw = dividend * inv_val;
        
        assign q_est = product_raw[47:32];

        // R = A - (Q * B)
        assign check_mul = q_est * divisor;
        assign r_est = dividend - check_mul[15:0];

        // --- C. HIỆU CHỈNH (Comb Logic) ---
        always @(*) begin
            // Mặc định gán giá trị ước lượng
            q_corr1 = q_est;
            r_corr1 = r_est;

            // Xử lý chia cho 0
            if (divisor == 0) begin
                quotient  = {16{1'b1}}; 
                remainder = dividend;
            end else begin
                // Kiểm tra sai số lần 1
                if (r_est >= divisor) begin
                    q_corr1 = q_est + 16'd1;
                    r_corr1 = r_est - divisor;
                end

                // Kiểm tra sai số lần 2
                if (r_corr1 >= divisor) begin
                    quotient  = q_corr1 + 16'd1;
                    remainder = r_corr1 - divisor;
                end else begin
                    quotient  = q_corr1;
                    remainder = r_corr1;
                end
            end
        end

    endmodule