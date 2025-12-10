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
// CREATED		"Thu Dec 11 00:01:10 2025"

module ControlUnit(
	Opcode,
	RegWrite,
	MemRead,
	MemWrite,
	Branch,
	Jump,
	ALUop,
	ALUsrc,
	MemtoReg,
	RegDst
);


input wire	[2:0] Opcode;
output wire	RegWrite;
output wire	MemRead;
output wire	MemWrite;
output wire	Branch;
output wire	Jump;
output wire	[1:0] ALUop;
output wire	[1:0] ALUsrc;
output wire	[1:0] MemtoReg;
output wire	[1:0] RegDst;

wire	[1:0] ALUop_ALTERA_SYNTHESIZED;
wire	[1:0] ALUsrc_ALTERA_SYNTHESIZED;
wire	[1:0] MemtoReg_ALTERA_SYNTHESIZED;
wire	[1:0] RegDst_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;

assign	Jump = SYNTHESIZED_WIRE_16;



assign	SYNTHESIZED_WIRE_36 =  ~Opcode[2];

assign	SYNTHESIZED_WIRE_38 =  ~Opcode[1];

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_36 & Opcode[1] & SYNTHESIZED_WIRE_37;

assign	ALUsrc_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	RegDst_ALTERA_SYNTHESIZED[1] = Opcode[2];


assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_38 & Opcode[0];

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_36 & Opcode[1] & SYNTHESIZED_WIRE_37;

assign	RegDst_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9;

assign	MemtoReg_ALTERA_SYNTHESIZED[1] = Opcode[2] & Opcode[0];

assign	MemtoReg_ALTERA_SYNTHESIZED[0] = Opcode[2] & SYNTHESIZED_WIRE_38 & SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_37 =  ~Opcode[0];

assign	MemWrite = Opcode[2] & SYNTHESIZED_WIRE_38 & Opcode[0];

assign	SYNTHESIZED_WIRE_16 = Opcode[2] & Opcode[1] & SYNTHESIZED_WIRE_37;

assign	Branch = SYNTHESIZED_WIRE_36 & Opcode[1] & Opcode[0];

assign	ALUop_ALTERA_SYNTHESIZED[1] = SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_36 & Opcode[1];

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_38 & SYNTHESIZED_WIRE_37;

assign	ALUop_ALTERA_SYNTHESIZED[0] = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_38;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_38 & SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_30 = Opcode[2] & Opcode[1] & Opcode[0];

assign	RegWrite = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;

assign	ALUsrc_ALTERA_SYNTHESIZED[1] = RegDst_ALTERA_SYNTHESIZED[1];


assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_38 & SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_38 & Opcode[0];

assign	MemRead = MemtoReg_ALTERA_SYNTHESIZED[0];
assign	ALUop = ALUop_ALTERA_SYNTHESIZED;
assign	ALUsrc = ALUsrc_ALTERA_SYNTHESIZED;
assign	MemtoReg = MemtoReg_ALTERA_SYNTHESIZED;
assign	RegDst = RegDst_ALTERA_SYNTHESIZED;

endmodule
