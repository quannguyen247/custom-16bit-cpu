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
// CREATED		"Fri Dec 12 12:57:00 2025"

module Mult16bit(
	A,
	B,
	HI,
	LO
);


input wire	[15:0] A;
input wire	[15:0] B;
output wire	[15:0] HI;
output wire	[15:0] LO;

wire	[15:0] AA;
wire	[15:0] BB;
wire	[31:0] INVERT;
wire	[15:0] MHH;
wire	[15:0] MHL;
wire	[23:0] MID;
wire	[15:0] MLH;
wire	[15:0] MLL;
wire	[31:0] NEGA;
wire	[31:0] O;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_15;
wire	[0:15] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[0:15] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[0:15] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[0:15] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_0 = 0;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_4 = 0;
assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_7 = 0;
assign	SYNTHESIZED_WIRE_8 = 1;
assign	SYNTHESIZED_WIRE_10 = 0;
assign	SYNTHESIZED_WIRE_11 = 0;
wire	[23:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {MHH[15:0],MLL[15:8]};


FA_16	b2v_FA16(
	.Cin(SYNTHESIZED_WIRE_0),
	.A(MHL),
	.B(MLH),
	.Cout(MID[16]),
	.SUM(MID[15:0]));


FA_16	b2v_FA321(
	.Cin(SYNTHESIZED_WIRE_15),
	.A(INVERT[31:16]),
	.B(SYNTHESIZED_WIRE_2),
	.Cout(SYNTHESIZED_WIRE_3),
	.SUM(LO));


FA_16	b2v_FA322(
	.Cin(SYNTHESIZED_WIRE_3),
	.A(INVERT[15:0]),
	.B(SYNTHESIZED_WIRE_4),
	
	.SUM(HI));


FA_16	b2v_FAA(
	.Cin(SYNTHESIZED_WIRE_5),
	.A(SYNTHESIZED_WIRE_6),
	.B(SYNTHESIZED_WIRE_7),
	
	.SUM(SYNTHESIZED_WIRE_12));


FA_16	b2v_FAB(
	.Cin(SYNTHESIZED_WIRE_8),
	.A(SYNTHESIZED_WIRE_9),
	.B(SYNTHESIZED_WIRE_10),
	
	.SUM(SYNTHESIZED_WIRE_13));


Mult8	b2v_HH(
	.A(AA[15:8]),
	.B(BB[15:8]),
	.O(MHH));


Mult8	b2v_HL(
	.A(AA[15:8]),
	.B(BB[7:0]),
	.O(MHL));


FA_24	b2v_inst(
	.Cin(SYNTHESIZED_WIRE_11),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(MID),
	
	.O(O[31:8]));











Mult8	b2v_LH(
	.A(AA[7:0]),
	.B(BB[15:8]),
	.O(MLH));


Mult8	b2v_LL(
	.A(AA[7:0]),
	.B(BB[7:0]),
	.O(MLL));


Mux16_2to1	b2v_MuxA(
	.S(A[15]),
	.I0(A),
	.I1(SYNTHESIZED_WIRE_12),
	.O(AA));


Mux16_2to1	b2v_MuxB(
	.S(B[15]),
	.I0(B),
	.I1(SYNTHESIZED_WIRE_13),
	.O(BB));

assign	SYNTHESIZED_WIRE_6 =  ~A;

assign	SYNTHESIZED_WIRE_9 =  ~B;

assign	NEGA = {SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_15};


assign	O[7:0] = MLL[7:0];


assign	SYNTHESIZED_WIRE_15 = A[15] ^ B[15];

assign	INVERT = NEGA ^ O;

assign	MID[23:17] = 7'b0000000;

endmodule
