module mux4to1_3bit (
    input [2:0] in0,    // Đầu vào 0 (3 bit)
    input [2:0] in1,    // Đầu vào 1 (3 bit)
    input [2:0] in2,    // Đầu vào 2 (3 bit)
    input [2:0] in3,    // Đầu vào 3 (3 bit)
    input [1:0] sel,    // Tín hiệu chọn (2 bit để chọn 4 trường hợp)
    output reg [2:0] out // Đầu ra (3 bit) - dùng 'reg' vì gán trong block always
);

    // Block always kích hoạt khi bất kỳ tín hiệu nào thay đổi
    always @(*) begin
        case (sel)
            2'b00: out = in0; // Nếu sel = 00, chọn in0
            2'b01: out = in1; // Nếu sel = 01, chọn in1
            2'b10: out = in2; // Nếu sel = 10, chọn in2
            2'b11: out = in3; // Nếu sel = 11, chọn in3
            default: out = 3'b000; // Trường hợp mặc định (an toàn)
        endcase
    end

endmodule