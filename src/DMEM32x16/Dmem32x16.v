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
// CREATED		"Wed Dec 10 22:50:49 2025"

module Dmem32x16(
	RE,
	WE,
	ADDR,
	D,
	O
);


input wire	RE;
input wire	WE;
input wire	[4:0] ADDR;
input wire	[15:0] D;
output wire	[15:0] O;

wire	[31:0] CS;
wire	SYNTHESIZED_WIRE_0;





WORD16BIT	b2v_inst(
	.CS(CS[0]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst1(
	.CS(CS[1]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst10(
	.CS(CS[10]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst11(
	.CS(CS[11]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst12(
	.CS(CS[12]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst13(
	.CS(CS[13]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst14(
	.CS(CS[14]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst15(
	.CS(CS[15]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst16(
	.CS(CS[16]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst17(
	.CS(CS[17]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst18(
	.CS(CS[18]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst19(
	.CS(CS[19]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst2(
	.CS(CS[2]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst20(
	.CS(CS[20]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst21(
	.CS(CS[21]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst22(
	.CS(CS[22]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst23(
	.CS(CS[23]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst24(
	.CS(CS[24]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst25(
	.CS(CS[25]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst26(
	.CS(CS[26]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst27(
	.CS(CS[27]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst28(
	.CS(CS[28]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst29(
	.CS(CS[29]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst3(
	.CS(CS[3]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst30(
	.CS(CS[30]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst31(
	.CS(CS[31]),
	.WE(WE),
	.D(D),
	.O(O));


Decoder5to32_EN	b2v_inst32(
	.EN(SYNTHESIZED_WIRE_0),
	.ADDR(ADDR),
	.I(CS));

assign	SYNTHESIZED_WIRE_0 = WE | RE;


WORD16BIT	b2v_inst4(
	.CS(CS[4]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst5(
	.CS(CS[5]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst6(
	.CS(CS[6]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst7(
	.CS(CS[7]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst8(
	.CS(CS[8]),
	.WE(WE),
	.D(D),
	.O(O));


WORD16BIT	b2v_inst9(
	.CS(CS[9]),
	.WE(WE),
	.D(D),
	.O(O));


endmodule
