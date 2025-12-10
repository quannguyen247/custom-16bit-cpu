// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Wed Dec 10 22:57:18 2025"

module PC(
	CLK,
	Branch,
	Imm,
	Q
);


input wire	CLK;
input wire	Branch;
input wire	[15:0] Imm;
output wire	[15:0] Q;

wire	[15:0] C;
wire	[15:0] D;
reg	[15:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_16 = 0;




always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[0] <= D[0];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[1] <= D[1];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[10] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[10] <= D[10];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[11] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[11] <= D[11];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[12] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[12] <= D[12];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[13] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[13] <= D[13];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[14] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[14] <= D[14];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[15] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[15] <= D[15];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[2] <= D[2];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[3] <= D[3];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[4] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[4] <= D[4];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[5] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[5] <= D[5];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[6] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[6] <= D[6];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[7] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[7] <= D[7];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[8] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[8] <= D[8];
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_20)
begin
if (!SYNTHESIZED_WIRE_20)
	begin
	Q_ALTERA_SYNTHESIZED[9] <= 0;
	end
else
	begin
	Q_ALTERA_SYNTHESIZED[9] <= D[9];
	end
end


Full_adder_16bit	b2v_inst(
	.Cin(SYNTHESIZED_WIRE_16),
	.X(Q_ALTERA_SYNTHESIZED),
	.Y(C),
	
	.S(SYNTHESIZED_WIRE_19));


assign	SYNTHESIZED_WIRE_20 = ~(SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18);



Mux2to1_16	b2v_inst4(
	.sel(Branch),
	.data0x(SYNTHESIZED_WIRE_19),
	.data1x(Imm),
	.result(D));



or5_0	b2v_INST_10_6(
	.IN1(Q_ALTERA_SYNTHESIZED[10]),
	.IN3(Q_ALTERA_SYNTHESIZED[8]),
	.IN2(Q_ALTERA_SYNTHESIZED[9]),
	.IN5(Q_ALTERA_SYNTHESIZED[6]),
	.IN4(Q_ALTERA_SYNTHESIZED[7]),
	.OUT(SYNTHESIZED_WIRE_17));


or5_1	b2v_INST_15_11(
	.IN1(Q_ALTERA_SYNTHESIZED[15]),
	.IN3(Q_ALTERA_SYNTHESIZED[13]),
	.IN2(Q_ALTERA_SYNTHESIZED[14]),
	.IN5(Q_ALTERA_SYNTHESIZED[11]),
	.IN4(Q_ALTERA_SYNTHESIZED[12]),
	.OUT(SYNTHESIZED_WIRE_18));

assign	Q = Q_ALTERA_SYNTHESIZED;
assign	C[0] = 1;
assign	C[15:1] = 15'b000000000000000;

endmodule

module or5_0(IN1,IN3,IN2,IN5,IN4,OUT);
/* synthesis black_box */

input IN1;
input IN3;
input IN2;
input IN5;
input IN4;
output OUT;

endmodule

module or5_1(IN1,IN3,IN2,IN5,IN4,OUT);
/* synthesis black_box */

input IN1;
input IN3;
input IN2;
input IN5;
input IN4;
output OUT;

endmodule
