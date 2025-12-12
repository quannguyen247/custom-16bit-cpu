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
// CREATED		"Fri Dec 12 20:50:32 2025"

module Pipeline(
	CLK,
	HI_OUT,
	LO_OUT
);


input wire	CLK;
output wire	[15:0] HI_OUT;
output wire	[15:0] LO_OUT;

wire	[1:0] DM;
wire	[1:0] DMEM;
wire	[15:0] Imm;
wire	[15:0] Instruction;
wire	[15:0] Q;
wire	[1:0] WB;
wire	SYNTHESIZED_WIRE_69;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_70;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[2:0] SYNTHESIZED_WIRE_6;
wire	[1:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[1:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_71;
wire	[15:0] SYNTHESIZED_WIRE_72;
wire	[15:0] SYNTHESIZED_WIRE_73;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_74;
wire	[1:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_75;
wire	[15:0] SYNTHESIZED_WIRE_76;
wire	[1:0] SYNTHESIZED_WIRE_24;
wire	[1:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	[15:0] SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_39;
wire	[15:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	[2:0] SYNTHESIZED_WIRE_44;
wire	[1:0] SYNTHESIZED_WIRE_49;
wire	[15:0] SYNTHESIZED_WIRE_50;
wire	[1:0] SYNTHESIZED_WIRE_54;
wire	[2:0] SYNTHESIZED_WIRE_55;
wire	[2:0] SYNTHESIZED_WIRE_56;
wire	[2:0] SYNTHESIZED_WIRE_57;
wire	[15:0] SYNTHESIZED_WIRE_58;
wire	[15:0] SYNTHESIZED_WIRE_60;
wire	[15:0] SYNTHESIZED_WIRE_61;
wire	[3:0] SYNTHESIZED_WIRE_62;
wire	[1:0] SYNTHESIZED_WIRE_63;
wire	[1:0] SYNTHESIZED_WIRE_64;
wire	[15:0] SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_70 = 1;
assign	SYNTHESIZED_WIRE_26 = 0;
assign	SYNTHESIZED_WIRE_27 = 1;




Reg16	b2v_HI_REG(
	.WE(SYNTHESIZED_WIRE_69),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_1),
	.O(HI_OUT));


RF_8X16	b2v_inst(
	.WE(SYNTHESIZED_WIRE_2),
	.REA(SYNTHESIZED_WIRE_70),
	.REB(SYNTHESIZED_WIRE_70),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_5),
	.RAA(Instruction[12:10]),
	.RAB(Instruction[9:7]),
	.WA(SYNTHESIZED_WIRE_6),
	.OA(SYNTHESIZED_WIRE_58),
	.OB(SYNTHESIZED_WIRE_40));


Reg1x16	b2v_inst1(
	.CLK(CLK),
	.I(Imm),
	.O(SYNTHESIZED_WIRE_73));


ALUControl	b2v_inst12(
	.ALUop(SYNTHESIZED_WIRE_7),
	.Funct(SYNTHESIZED_WIRE_8),
	.WE_HILO(SYNTHESIZED_WIRE_30),
	.ALUControl(SYNTHESIZED_WIRE_62));


SignExt7	b2v_inst15(
	.I(Instruction[6:0]),
	.O(SYNTHESIZED_WIRE_65));


SignExt10	b2v_inst16(
	.I(Instruction[9:0]),
	.O(SYNTHESIZED_WIRE_76));


Mux3to1_3	b2v_inst17(
	.data0x(Instruction[6:4]),
	.data1x(Instruction[9:7]),
	.data2x(Instruction[12:10]),
	.sel(SYNTHESIZED_WIRE_9),
	.result(SYNTHESIZED_WIRE_6));


Reg1x16	b2v_inst18(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_10),
	.O(SYNTHESIZED_WIRE_71));


Reg1x16	b2v_inst19(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_11),
	.O(SYNTHESIZED_WIRE_1));


Reg1x16	b2v_inst2(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_12),
	.O(Instruction));


Mux3to1_16	b2v_inst20(
	.data0x(SYNTHESIZED_WIRE_71),
	.data1x(SYNTHESIZED_WIRE_72),
	.data2x(SYNTHESIZED_WIRE_73),
	.sel(WB),
	.result(SYNTHESIZED_WIRE_5));


Reg1x16	b2v_inst21(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_16),
	.O(SYNTHESIZED_WIRE_72));


Mux3to1_16	b2v_inst22(
	.data0x(SYNTHESIZED_WIRE_17),
	.data1x(SYNTHESIZED_WIRE_18),
	.data2x(SYNTHESIZED_WIRE_74),
	.sel(SYNTHESIZED_WIRE_20),
	.result(SYNTHESIZED_WIRE_50));


Mux2to1_16	b2v_inst23(
	.sel(SYNTHESIZED_WIRE_75),
	.data0x(SYNTHESIZED_WIRE_76),
	.data1x(SYNTHESIZED_WIRE_76),
	.result(SYNTHESIZED_WIRE_29));


Reg1x2	b2v_inst24(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_24),
	.O(SYNTHESIZED_WIRE_25));


ControlUnit	b2v_inst25(
	.Opcode(Instruction[15:13]),
	.RegWrite(SYNTHESIZED_WIRE_39),
	.MemRead(DM[0]),
	.MemWrite(DM[1]),
	.Branch(SYNTHESIZED_WIRE_33),
	.Jump(SYNTHESIZED_WIRE_75),
	.ALUop(SYNTHESIZED_WIRE_63),
	.ALUsrc(SYNTHESIZED_WIRE_64),
	.MemtoReg(SYNTHESIZED_WIRE_24),
	.RegDst(SYNTHESIZED_WIRE_9));


Reg1x2	b2v_inst26(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_25),
	.O(WB));


PC	b2v_inst27(
	.CLK(CLK),
	.RST(SYNTHESIZED_WIRE_26),
	.EN(SYNTHESIZED_WIRE_27),
	.Branch(SYNTHESIZED_WIRE_28),
	.Imm(SYNTHESIZED_WIRE_29),
	.Q(Q));



Reg1x4	b2v_inst29(
	.CLK(CLK),
	.I(Instruction[3:0]),
	.O(SYNTHESIZED_WIRE_8));



Reg1x1	b2v_inst31(
	.I(SYNTHESIZED_WIRE_30),
	.CLK(CLK),
	.O(SYNTHESIZED_WIRE_69));


IMEM64x16	b2v_inst32(
	.ADDRESS(Q[5:0]),
	.DATA_OUT(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst32.ADDRESS_WIDTH = 6;
	defparam	b2v_inst32.DATA_WIDTH = 16;
	defparam	b2v_inst32.INIT_FILE = "test.hex";


assign	SYNTHESIZED_WIRE_34 =  ~SYNTHESIZED_WIRE_77;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_77 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_75;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_42 =  ~SYNTHESIZED_WIRE_69;


Reg1x1	b2v_inst39(
	.I(SYNTHESIZED_WIRE_39),
	.CLK(CLK),
	.O(SYNTHESIZED_WIRE_41));


Reg1x16	b2v_inst4(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_40),
	.O(SYNTHESIZED_WIRE_17));


Reg1x1	b2v_inst40(
	.I(SYNTHESIZED_WIRE_41),
	.CLK(CLK),
	.O(SYNTHESIZED_WIRE_43));

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_42 & SYNTHESIZED_WIRE_43;


Reg1x3	b2v_inst42(
	.CLK(CLK),
	.I(Instruction[9:7]),
	.O(SYNTHESIZED_WIRE_56));


Reg1x3	b2v_inst43(
	.CLK(CLK),
	.I(Instruction[12:10]),
	.O(SYNTHESIZED_WIRE_57));


Reg1x3	b2v_inst44(
	.CLK(CLK),
	.I(Instruction[6:4]),
	.O(SYNTHESIZED_WIRE_44));


Reg1x3	b2v_inst45(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_44),
	.O(SYNTHESIZED_WIRE_55));


Mux4to1_16	b2v_inst46(
	.data0x(SYNTHESIZED_WIRE_74),
	.data1x(SYNTHESIZED_WIRE_71),
	.data2x(SYNTHESIZED_WIRE_72),
	.data3x(SYNTHESIZED_WIRE_73),
	.sel(SYNTHESIZED_WIRE_49),
	.result(SYNTHESIZED_WIRE_60));


Mux4to1_16	b2v_inst47(
	.data0x(SYNTHESIZED_WIRE_50),
	.data1x(SYNTHESIZED_WIRE_71),
	.data2x(SYNTHESIZED_WIRE_72),
	.data3x(SYNTHESIZED_WIRE_73),
	.sel(SYNTHESIZED_WIRE_54),
	.result(SYNTHESIZED_WIRE_61));


ForwardingUnit	b2v_inst48(
	.WB0(WB[0]),
	.WB1(WB[1]),
	.RD(SYNTHESIZED_WIRE_55),
	.RS(SYNTHESIZED_WIRE_56),
	.Rt(SYNTHESIZED_WIRE_57),
	.MUX1(SYNTHESIZED_WIRE_49),
	.MUX2(SYNTHESIZED_WIRE_54));


Reg1x16	b2v_inst5(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_58),
	.O(SYNTHESIZED_WIRE_74));


DMEM32x16	b2v_inst50(
	.WE(DMEM[1]),
	.RE(DMEM[0]),
	.CLK(CLK),
	.ADD(Imm[4:0]),
	.I(SYNTHESIZED_WIRE_74),
	.O(SYNTHESIZED_WIRE_16));


ALU	b2v_inst54(
	.A(SYNTHESIZED_WIRE_60),
	.B(SYNTHESIZED_WIRE_61),
	.Sel(SYNTHESIZED_WIRE_62),
	.isZero(SYNTHESIZED_WIRE_77),
	.O(SYNTHESIZED_WIRE_10),
	.Os(SYNTHESIZED_WIRE_11));


Reg1x2	b2v_inst55(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_63),
	.O(SYNTHESIZED_WIRE_7));


Reg1x2	b2v_inst56(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_64),
	.O(SYNTHESIZED_WIRE_20));


Reg1x16	b2v_inst7(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_65),
	.O(SYNTHESIZED_WIRE_18));


Reg1x16	b2v_inst8(
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_76),
	.O(Imm));


Reg1x2	b2v_inst9(
	.CLK(CLK),
	.I(DM),
	.O(DMEM));


Reg16	b2v_LO_REG(
	.WE(SYNTHESIZED_WIRE_69),
	.CLK(CLK),
	.I(SYNTHESIZED_WIRE_71),
	.O(LO_OUT));


endmodule
