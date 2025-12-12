module Div16_pipelined (
    input clk,
    
    input [15:0] dividend,  // Số bị chia (Ví dụ: R1)
    input [15:0] divisor,   // Số chia    (Ví dụ: R2)
    
    output [15:0] quotient, // Thương     (Kết quả phép chia)
    output [15:0] remainder // Số dư      (Kết quả phép mod)
);

    // Dây nối nội bộ giữa 16 tầng
    wire [31:0] stage_acc [0:16];
    wire [15:0] stage_div [0:16];

    // --- TẦNG KHỞI TẠO (INPUT MAPPING) ---
    // Nạp số bị chia 16-bit vào phần thấp của thanh ghi 32-bit.
    // Phần cao (16-bit đầu) set bằng 0 (vì chưa có số dư).
    assign stage_acc[0] = {16'b0, dividend}; 
    
    // Nạp số chia vào đường dây
    assign stage_div[0] = divisor;

    // TẠO 16 TẦNG PIPELINE, mỗi tầng thực hiện 1 bước chia (tương ứng 1 bit kết quả)
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : Pipe_stages
            Div_stage Stage_inst (
                .clk(clk),
                .acc_in(stage_acc[i]),
                .d_in(stage_div[i]),
                .acc_out(stage_acc[i+1]),
                .d_out(stage_div[i+1])
            );
        end
    endgenerate

    // --- TẦNG ĐẦU RA (OUTPUT MAPPING) ---
    // Sau 16 tầng, thanh ghi chứa: [16-bit Dư] : [16-bit Thương]
    assign remainder = stage_acc[16][31:16];
    assign quotient  = stage_acc[16][15:0];

endmodule