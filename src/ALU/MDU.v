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
// CREATED		"Sun Dec 14 23:23:40 2025"

module MDU(
	pin_name1,
	A,
	B,
	Opcode,
	Sel,
	HI,
	LO
);


input wire	pin_name1;
input wire	[15:0] A;
input wire	[15:0] B;
input wire	[2:0] Opcode;
input wire	[3:0] Sel;
output wire	[15:0] HI;
output wire	[15:0] LO;

wire	OP_EN;
wire	Sdiv;
wire	Smult;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;





Div16	b2v_inst(
	.CLK(pin_name1),
	.dividend(SYNTHESIZED_WIRE_0),
	.divisor(SYNTHESIZED_WIRE_1),
	.quotient(SYNTHESIZED_WIRE_9),
	.remainder(SYNTHESIZED_WIRE_7));


Mult16bit	b2v_inst1(
	.A(SYNTHESIZED_WIRE_2),
	.B(SYNTHESIZED_WIRE_3),
	.HI(SYNTHESIZED_WIRE_6),
	.LO(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_0 = A & {Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv};

assign	SYNTHESIZED_WIRE_1 = {Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv,Sdiv} & B;

assign	Smult = OP_EN & SYNTHESIZED_WIRE_4;

assign	Sdiv = OP_EN & SYNTHESIZED_WIRE_5;


Mux2to1_16	b2v_inst14(
	.sel(Sel[0]),
	.data0x(SYNTHESIZED_WIRE_6),
	.data1x(SYNTHESIZED_WIRE_7),
	.result(HI));


Mux2to1_16	b2v_inst15(
	.sel(Sel[0]),
	.data0x(SYNTHESIZED_WIRE_8),
	.data1x(SYNTHESIZED_WIRE_9),
	.result(LO));

assign	SYNTHESIZED_WIRE_4 = Sel[3] & Sel[2] & Sel[1] & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_10 =  ~Sel[0];

assign	OP_EN = ~(Opcode[2] | Opcode[1] | Opcode[0]);

assign	SYNTHESIZED_WIRE_5 = Sel[3] & Sel[2] & Sel[1] & Sel[0];

assign	SYNTHESIZED_WIRE_2 = A & {Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult};

assign	SYNTHESIZED_WIRE_3 = {Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult,Smult} & B;


endmodule
