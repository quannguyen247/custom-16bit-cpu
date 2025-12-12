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
// CREATED		"Fri Dec 12 21:26:56 2025"

module CPUTopDesign(
	CLK,
	HI_OUT,
	LO_OUT
);


input wire	CLK;
output wire	[15:0] HI_OUT;
output wire	[15:0] LO_OUT;

wire	[15:0] Imm;
wire	[15:0] Instruction;
wire	[15:0] Q;
wire	WE_HILO_n;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_39;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[2:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_41;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_42;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[1:0] SYNTHESIZED_WIRE_13;
wire	[1:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_43;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[1:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_44;
wire	[1:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;

assign	SYNTHESIZED_WIRE_39 = 1;
assign	SYNTHESIZED_WIRE_24 = 0;
assign	SYNTHESIZED_WIRE_25 = 1;




RF_8X16	b2v_inst(
	.WE(SYNTHESIZED_WIRE_0),
	.REA(SYNTHESIZED_WIRE_39),
	.REB(SYNTHESIZED_WIRE_39),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_3),
	.RAA(Instruction[12:10]),
	.RAB(Instruction[9:7]),
	.WA(SYNTHESIZED_WIRE_4),
	.OA(SYNTHESIZED_WIRE_42),
	.OB(SYNTHESIZED_WIRE_18));

assign	SYNTHESIZED_WIRE_38 = SYNTHESIZED_WIRE_40 & SYNTHESIZED_WIRE_6;

assign	WE_HILO_n =  ~SYNTHESIZED_WIRE_41;


Reg16	b2v_inst11(
	.WE(SYNTHESIZED_WIRE_41),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_9),
	.O(HI_OUT));



ALU	b2v_inst14(
	.CLK(CLK),
	.A(SYNTHESIZED_WIRE_42),
	.B(SYNTHESIZED_WIRE_11),
	.Sel(SYNTHESIZED_WIRE_12),
	.isZero(SYNTHESIZED_WIRE_40),
	.O(SYNTHESIZED_WIRE_43),
	.Os(SYNTHESIZED_WIRE_9));


SignExt7	b2v_inst15(
	.I(Instruction[6:0]),
	.O(SYNTHESIZED_WIRE_44));


SignExt10	b2v_inst16(
	.I(Instruction[9:0]),
	.O(Imm));


Mux3to1_3	b2v_inst17(
	.data0x(Instruction[6:4]),
	.data1x(Instruction[9:7]),
	.data2x(Instruction[12:10]),
	.sel(SYNTHESIZED_WIRE_13),
	.result(SYNTHESIZED_WIRE_4));


ALUControl	b2v_inst2(
	.ALUop(SYNTHESIZED_WIRE_14),
	.Funct(Instruction[3:0]),
	.WE_HILO(SYNTHESIZED_WIRE_41),
	.ALUControl(SYNTHESIZED_WIRE_12));


Mux3to1_16	b2v_inst20(
	.data0x(SYNTHESIZED_WIRE_43),
	.data1x(SYNTHESIZED_WIRE_16),
	.data2x(Imm),
	.sel(SYNTHESIZED_WIRE_17),
	.result(SYNTHESIZED_WIRE_3));


Mux3to1_16	b2v_inst21(
	.data0x(SYNTHESIZED_WIRE_18),
	.data1x(SYNTHESIZED_WIRE_44),
	.data2x(SYNTHESIZED_WIRE_42),
	.sel(SYNTHESIZED_WIRE_21),
	.result(SYNTHESIZED_WIRE_11));


Mux2to1_16	b2v_inst22(
	.sel(SYNTHESIZED_WIRE_45),
	.data0x(SYNTHESIZED_WIRE_44),
	.data1x(Imm),
	.result(SYNTHESIZED_WIRE_27));


PC	b2v_inst24(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_24),
	.EN(SYNTHESIZED_WIRE_25),
	.Branch(SYNTHESIZED_WIRE_26),
	.Imm(SYNTHESIZED_WIRE_27),
	.Q(Q));


ControlUnit	b2v_inst25(
	.Opcode(Instruction[15:13]),
	.RegWrite(SYNTHESIZED_WIRE_31),
	.MemRead(SYNTHESIZED_WIRE_29),
	.MemWrite(SYNTHESIZED_WIRE_28),
	.Branch(SYNTHESIZED_WIRE_6),
	.Jump(SYNTHESIZED_WIRE_45),
	.ALUop(SYNTHESIZED_WIRE_14),
	.ALUsrc(SYNTHESIZED_WIRE_21),
	.MemtoReg(SYNTHESIZED_WIRE_17),
	.RegDst(SYNTHESIZED_WIRE_13));




IMEM64x16	b2v_inst32(
	.ADDRESS(Q[5:0]),
	.DATA_OUT(Instruction));
	defparam	b2v_inst32.ADDRESS_WIDTH = 6;
	defparam	b2v_inst32.DATA_WIDTH = 16;
	defparam	b2v_inst32.INIT_FILE = "test.hex";


DMEM32x16	b2v_inst4(
	.WE(SYNTHESIZED_WIRE_28),
	.RE(SYNTHESIZED_WIRE_29),
	.CLK(CLK),
	.ADD(Imm[4:0]),
	.I(SYNTHESIZED_WIRE_42),
	.O(SYNTHESIZED_WIRE_16));

assign	SYNTHESIZED_WIRE_0 = WE_HILO_n & SYNTHESIZED_WIRE_31;


Reg16	b2v_inst6(
	.WE(SYNTHESIZED_WIRE_41),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_43),
	.O(LO_OUT));

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_45 & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_35 =  ~SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_37 | SYNTHESIZED_WIRE_38;


endmodule
