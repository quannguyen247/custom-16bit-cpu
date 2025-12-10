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
// CREATED		"Thu Dec 11 00:01:50 2025"

module ALUControl(
	ALUop,
	Funct,
	WE_HILO,
	ALUControl
);


input wire	[1:0] ALUop;
input wire	[3:0] Funct;
output wire	WE_HILO;
output wire	[3:0] ALUControl;

wire	[3:0] Data0;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_3 = 0;




Mux2to1_4	b2v_inst(
	.sel(SYNTHESIZED_WIRE_6),
	.data0x(Data0),
	.data1x(Funct),
	.result(ALUControl));

assign	Data0[2] = SYNTHESIZED_WIRE_1 & ALUop[1];

assign	SYNTHESIZED_WIRE_2 =  ~ALUop[1];

assign	SYNTHESIZED_WIRE_1 =  ~ALUop[0];

assign	SYNTHESIZED_WIRE_4 = Funct[1] & Funct[2] & Funct[3];

assign	Data0[0] = ALUop[0] & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_6 = ALUop[0] & ALUop[1];



Mux2to1_1	b2v_inst8(
	.data0(SYNTHESIZED_WIRE_3),
	.data1(SYNTHESIZED_WIRE_4),
	.sel(SYNTHESIZED_WIRE_6),
	.result(WE_HILO));


assign	Data0[1] = 0;
assign	Data0[3] = 0;

endmodule
