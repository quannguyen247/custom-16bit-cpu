module IMEM64x16 #(
    ADDRESS_WIDTH = 6,
    DATA_WIDTH = 16,
    INIT_FILE = "test.hex")
(
    input wire [ADDRESS_WIDTH-1:0] ADDRESS,
    output wire [DATA_WIDTH-1:0] DATA_OUT
);

reg [DATA_WIDTH-1:0] my_mem [(2**ADDRESS_WIDTH)-1:0];

initial begin
  $readmemh (INIT_FILE, my_mem);
end

assign DATA_OUT = my_mem[ADDRESS];     //read

endmodule