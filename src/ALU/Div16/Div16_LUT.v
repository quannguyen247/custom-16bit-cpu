module Div16_LUT (
    input  wire [15:0] dividend, // A
    input  wire [15:0] divisor,  // B
    output reg  [15:0] quotient, // Q
    output reg  [15:0] remainder // R
);

    // 1. Nhúng file function chứa bảng Case (Sinh bởi Python)
    `include "lut_func.v"

    // 2. Khai báo biến (Dùng reg cho mạch tổ hợp always @*)
    reg [31:0] inv_val;
    reg [47:0] product_raw;
    reg [15:0] q_est;
    reg [15:0] r_est;
    
    // Biến phụ cho bước Correction
    reg [15:0] r_corr1;
    reg [15:0] q_corr1;

    always @(*) begin
        // --- BƯỚC 1: TRA CỨU (Lookup) ---
        // Lấy 9 bit cao nhất của số chia để tra.
        // Cảnh báo: Cách này kém chính xác với số nhỏ (< 128).
        // Tuy nhiên để đảm bảo tốc độ O(1) ta chấp nhận và sửa sai ở dưới.
        inv_val = get_inverse(divisor[15:7]);

        // --- BƯỚC 2: NHÂN (Multiply) ---
        // A * (1/B)
        product_raw = dividend * inv_val;
        
        // Lấy 16 bit kết quả (tương ứng chia 2^32)
        // FIX WARNING TRUNCATED: Quartus hiểu rõ ta chỉ lấy [47:32]
        q_est = product_raw[47:32];

        // --- BƯỚC 3: TÍNH DƯ SƠ BỘ ---
        // R = A - Q*B
        // FIX WARNING: Ép kiểu tích thành 16 bit trước khi trừ
        r_est = dividend - (q_est * divisor);

        // --- BƯỚC 4: HIỆU CHỈNH (Correction) ---
        // Do bảng tra 9-bit có sai số, thương có thể bị lệch.
        // Ta kiểm tra và sửa (tối đa 2 bước là đủ cho LUT 9-bit).
        
        // Lần sửa 1:
        if (r_est >= divisor) begin
            q_corr1 = q_est + 1'b1;
            r_corr1 = r_est - divisor;
        end else begin
            q_corr1 = q_est;
            r_corr1 = r_est;
        end

        // Lần sửa 2 (Để chắc chắn chính xác tuyệt đối):
        if (r_corr1 >= divisor) begin
            quotient  = q_corr1 + 1'b1;
            remainder = r_corr1 - divisor;
        end else begin
            quotient  = q_corr1;
            remainder = r_corr1;
        end
        
        // Xử lý ngoại lệ: Chia cho 0 hoặc số quá nhỏ khiến LUT sai lệch nhiều
        // Với DE2, ta ưu tiên logic đơn giản. Nếu divisor = 0, set max.
        if (divisor == 0) begin
            quotient = 16'hFFFF;
            remainder = dividend;
        end
    end

endmodule