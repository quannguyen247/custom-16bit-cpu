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
// CREATED		"Sun Dec 14 22:36:11 2025"

module Div16(
	CLK,
	dividend,
	divisor,
	quotient,
	remainder
);


input wire	CLK;
input wire	[15:0] dividend;
input wire	[15:0] divisor;
output wire	[15:0] quotient;
output wire	[15:0] remainder;

wire	BIT_0;
wire	BIT_1;
wire	cmp_sel;
reg	[15:0] dividend_reg1;
wire	[15:0] dividend_reg2;
wire	[15:0] divisor_reg0;
wire	[15:0] divisor_reg1;
wire	[15:0] divisor_reg2;
wire	[31:0] inv_val;
wire	is_large;
wire	[15:0] Q_EST;
wire	[15:0] RMD1;
wire	[15:0] RMD2;
wire	[11:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_9;
reg	[15:0] DFF_REG0;
wire	[15:0] SYNTHESIZED_WIRE_10;
reg	[15:0] DFF_inst21;
reg	[15:0] DFF_inst4;
wire	SYNTHESIZED_WIRE_11;
wire	[31:16] SYNTHESIZED_WIRE_12;
wire	[0:15] SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_13 = 0;
wire	[11:0] GDFX_TEMP_SIGNAL_0;
wire	[11:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {BIT_0,divisor[10:0]};
assign	GDFX_TEMP_SIGNAL_1 = {BIT_1,divisor[15:5]};


rom_lut	b2v_inst(
	.clock(CLK),
	.address(SYNTHESIZED_WIRE_0),
	.q(inv_val));


or5_0	b2v_inst1(
	.IN1(divisor[15]),
	.IN3(divisor[13]),
	.IN2(divisor[14]),
	.IN5(divisor[11]),
	.IN4(divisor[12]),
	.OUT(is_large));


Mult16bit	b2v_inst10(
	.A(Q_EST),
	.B(divisor_reg2),
	
	.LO(SYNTHESIZED_WIRE_3));


Full_adder_16bit	b2v_inst11(
	.Cin(BIT_1),
	.X(dividend_reg2),
	.Y(SYNTHESIZED_WIRE_1),
	
	.S(SYNTHESIZED_WIRE_14));



Full_adder_16bit	b2v_inst13(
	.Cin(BIT_0),
	.X(Q_EST),
	.Y(SYNTHESIZED_WIRE_2),
	
	.S(SYNTHESIZED_WIRE_7));

assign	SYNTHESIZED_WIRE_1 =  ~SYNTHESIZED_WIRE_3;


cmp16	b2v_inst15(
	.dataa(SYNTHESIZED_WIRE_14),
	.datab(divisor_reg2),
	.ageb(cmp_sel));


Full_adder_16bit	b2v_inst16(
	.Cin(BIT_1),
	.X(SYNTHESIZED_WIRE_14),
	.Y(SYNTHESIZED_WIRE_6),
	
	.S(SYNTHESIZED_WIRE_9));


Constant1_16	b2v_inst17(
	.O(SYNTHESIZED_WIRE_2));


Mux2to1_16	b2v_inst18(
	.sel(cmp_sel),
	.data0x(Q_EST),
	.data1x(SYNTHESIZED_WIRE_7),
	.result(quotient));


Mux2to1_16	b2v_inst19(
	.sel(cmp_sel),
	.data0x(SYNTHESIZED_WIRE_14),
	.data1x(SYNTHESIZED_WIRE_9),
	.result(remainder));


assign	SYNTHESIZED_WIRE_6 =  ~divisor_reg2;


always@(posedge CLK)
begin
	begin
	DFF_inst21[15:0] <= inv_val[31:16];
	end
end


always@(posedge CLK)
begin
	begin
	dividend_reg1[15:0] <= DFF_REG0[15:0];
	end
end


Reg1x16	b2v_inst24(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_10),
	.O(Q_EST));


Reg1x16	b2v_inst25(
	.CLK(CLK),
	.I(divisor_reg1),
	.O(divisor_reg2));


Reg1x16	b2v_inst29(
	.CLK(CLK),
	.I(divisor),
	.O(divisor_reg0));



Reg1x16	b2v_inst30(
	.CLK(CLK),
	.I(dividend_reg1),
	.O(dividend_reg2));


Reg1x16	b2v_inst31(
	.CLK(CLK),
	.I(divisor_reg0),
	.O(divisor_reg1));


always@(posedge CLK)
begin
	begin
	DFF_inst4[15:0] <= inv_val[15:0];
	end
end


Mux2to1_12	b2v_inst5(
	.sel(is_large),
	.data0x(GDFX_TEMP_SIGNAL_0),
	.data1x(GDFX_TEMP_SIGNAL_1),
	.result(SYNTHESIZED_WIRE_0));


Mult16bitU	b2v_inst6(
	.A(dividend_reg1),
	.B(DFF_inst21),
	.HI(SYNTHESIZED_WIRE_12),
	.LO(RMD1));


Mult16bitU	b2v_inst7(
	.A(dividend_reg1),
	.B(DFF_inst4),
	.HI(RMD2)
	);


Full_adder_16bit	b2v_inst8(
	.Cin(BIT_0),
	.X(RMD1),
	.Y(RMD2),
	.Cout(SYNTHESIZED_WIRE_11)
	);


Full_adder_16bit	b2v_inst9(
	.Cin(SYNTHESIZED_WIRE_11),
	.X(SYNTHESIZED_WIRE_12),
	.Y(SYNTHESIZED_WIRE_13),
	
	.S(SYNTHESIZED_WIRE_10));


always@(posedge CLK)
begin
	begin
	DFF_REG0[15:0] <= dividend[15:0];
	end
end

assign	BIT_0 = 0;
assign	BIT_1 = 1;

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
