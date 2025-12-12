module Div_stage (
    input clk,
    // acc_in bao gồm: 16-bit Dư (cao) và 16-bit Thương đang tính (thấp)
    input [31:0] acc_in,    
    input [15:0] d_in,      // Số chia (16-bit) giữ nguyên qua các tầng
    output reg [31:0] acc_out,
    output reg [15:0] d_out
);

    wire [16:0] sub_res;    // Kết quả trừ (17 bit để chứa dấu)
    wire [31:0] shifted_acc;
    
    // 1. Dịch trái toàn bộ 1 bit (Shift Left)
    // Bit cao nhất của phần thấp sẽ tràn sang phần cao (phần Dư)
    assign shifted_acc = {acc_in[30:0], 1'b0};

    // 2. Thử lấy Phần Dư (16 bit cao) trừ đi Số Chia
    // {1'b0, ...} để mở rộng thành 17 bit (tránh lỗi tràn số âm)
    assign sub_res = {1'b0, shifted_acc[31:16]} - {1'b0, d_in};

    always @(posedge clk) begin
        // Chuyển tiếp số chia sang tầng sau
        d_out <= d_in;

        // 3. Kiểm tra kết quả trừ
        if (sub_res[16] == 1'b0) begin 
            // Nếu trừ được (kết quả dương):
            // - Cập nhật Phần Dư mới (sub_res)
            // - Phần Thương (bit thấp) dịch vào số 1
            acc_out <= {sub_res[15:0], shifted_acc[15:1], 1'b1};
        end else begin
            // Nếu không trừ được (kết quả âm):
            // - Giữ nguyên Phần Dư (chỉ dịch bit)
            // - Phần Thương dịch vào số 0
            acc_out <= shifted_acc;
        end
    end

endmodule