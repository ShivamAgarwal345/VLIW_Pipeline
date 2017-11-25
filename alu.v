module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg overflow, output reg carry, output reg neg, output reg zero, output reg Npflag, output reg [31:0] aluOut);
 reg [32:0] temp;
 reg [31:0] overflow_check;
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'b00: begin
			       aluOut = aluIn1 + aluIn2;
			       temp = aluIn1 + aluIn2;
			       if((aluIn1[31]==aluIn2[31]) && (aluIn1[31]!=aluOut[31]))  overflow = 1'b1;
			       else                                                      overflow = 1'b0;
			       if(temp[32] == 1) carry = 1'b1;
			       else              carry = 1'b0;
			       if(aluOut[31] == 1)    neg = 1'b1;
			       else              neg = 1'b0;
			       if(aluOut == 0)   zero = 1'b1;
			       else              zero = 1'b0;
			       end	
			2'b11: begin
			       aluOut = aluIn2 - aluIn1;
			       overflow_check = ~(aluIn1) + 1;
			       if(aluIn1 < aluIn2) carry = 1'b1; 
			       else                carry = 1'b0;
			       if((aluIn1[31]==overflow_check[31]) && (aluIn1[31]!=aluOut[31]))  overflow = 1'b1;
			       else                                                      overflow = 1'b0;
			       if(aluIn1 == 32'b1000_0000_0000_0000_0000_0000_0000_0000 && aluIn2 == 32'd0) overflow = 1'b1;
			       if(aluOut[31] == 1)    neg = 1'b1;
			       else              neg = 1'b0;
			       if(aluOut == 0)   zero = 1'b1;
			       else              zero = 1'b0;
			       Npflag = carry;
			       end
			2'b10: begin
			       aluOut = aluIn1 >> aluIn2;
			       if(aluIn2 >= 32)  carry = aluIn1[31];
			       else              carry = aluIn1[aluIn2-1];
			       if(aluOut[31] == 1)    neg = 1'b1;
			       else              neg = 1'b0;
			       if(aluOut == 0)   zero = 1'b1;
			       else              zero = 1'b0;
			       overflow = 1'b0;
			       end
			2'b01: begin
			       aluOut = aluIn1 ^ aluIn2;
			       end  
		endcase
	end
	assign overflow1 = overflow;
endmodule

module D_ff (input clk, input reset, input regWrite1, input decOut1b1, input regWrite2, input decOut1b2, input d1, input d2, output reg q);
	always @ (posedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite1 == 1'b1 && decOut1b1 ==1'b1) begin q=d1; end
		if(regWrite2 == 1'b1 && decOut1b2 ==1'b1) begin q=d2; end
	end
endmodule


module register32bit( input clk, input reset, input regWrite1, input decOut1b1, input regWrite2, input decOut1b2, input [31:0] writeData1, input [31:0] writeData2, output  [31:0] outR );
	D_ff d0(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[0], writeData2[0], outR[0]);
	D_ff d1(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[1], writeData2[1], outR[1]);
	D_ff d2(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[2], writeData2[2], outR[2]);
	D_ff d3(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[3], writeData2[3], outR[3]);
	D_ff d4(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[4], writeData2[4], outR[4]);
	D_ff d5(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[5], writeData2[5], outR[5]);
	D_ff d6(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[6], writeData2[6], outR[6]);
	D_ff d7(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[7], writeData2[7], outR[7]);
	D_ff d8(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[8], writeData2[8], outR[8]);
	D_ff d9(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[9], writeData2[9], outR[9]);
	D_ff d10(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[10], writeData2[10], outR[10]);
	D_ff d11(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[11], writeData2[11], outR[11]);
	D_ff d12(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[12], writeData2[12], outR[12]);
	D_ff d13(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[13], writeData2[13], outR[13]);
	D_ff d14(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[14], writeData2[14], outR[14]);
	D_ff d15(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[15], writeData2[15], outR[15]);
	D_ff d16(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[16], writeData2[16], outR[16]);
	D_ff d17(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[17], writeData2[17], outR[17]);
	D_ff d18(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[18], writeData2[18], outR[18]);
	D_ff d19(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[19], writeData2[19], outR[19]);
	D_ff d20(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[20], writeData2[20], outR[20]);
	D_ff d21(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[21], writeData2[21], outR[21]);
	D_ff d22(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[22], writeData2[22], outR[22]);
	D_ff d23(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[23], writeData2[23], outR[23]);
	D_ff d24(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[24], writeData2[24], outR[24]);
	D_ff d25(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[25], writeData2[25], outR[25]);
	D_ff d26(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[26], writeData2[26], outR[26]);
	D_ff d27(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[27], writeData2[27], outR[27]);
	D_ff d28(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[28], writeData2[28], outR[28]);
	D_ff d29(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[29], writeData2[29], outR[29]);
	D_ff d30(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[30], writeData2[30], outR[30]);
	D_ff d31(clk, reset, regWrite1, decOut1b1, regWrite2, decOut1b2, writeData1[31], writeData2[31], outR[31]);
endmodule



module registerSet( input clk, input reset, input regWrite1, input [31:0] decOut1, input regWrite2, 
input [31:0] decOut2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR0,outR1,outR2,outR3,outR4,
outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,
outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31 );
		register32bit r0( clk, reset, regWrite1, decOut1[0], regWrite2, decOut2[0], writeData1, writeData2, outR0 );
		register32bit r1( clk, reset, regWrite1, decOut1[1], regWrite2, decOut2[1], writeData1, writeData2, outR1 );
		register32bit r2( clk, reset, regWrite1, decOut1[2], regWrite2, decOut2[2], writeData1, writeData2, outR2 );
		register32bit r3( clk, reset, regWrite1, decOut1[3], regWrite2, decOut2[3], writeData1, writeData2, outR3 );
		register32bit r4( clk, reset, regWrite1, decOut1[4], regWrite2, decOut2[4], writeData1, writeData2, outR4 );
		register32bit r5( clk, reset, regWrite1, decOut1[5], regWrite2, decOut2[5], writeData1, writeData2, outR5 );
		register32bit r6( clk, reset, regWrite1, decOut1[6], regWrite2, decOut2[6], writeData1, writeData2, outR6 );
		register32bit r7( clk, reset, regWrite1, decOut1[7], regWrite2, decOut2[7], writeData1, writeData2, outR7 );
		register32bit r8( clk, reset, regWrite1, decOut1[8], regWrite2, decOut2[8], writeData1, writeData2, outR8 );
		register32bit r9( clk, reset, regWrite1, decOut1[9], regWrite2, decOut2[9], writeData1, writeData2, outR9 );
		register32bit r10( clk, reset, regWrite1, decOut1[10], regWrite2, decOut2[10], writeData1, writeData2, outR10 );
		register32bit r11( clk, reset, regWrite1, decOut1[11], regWrite2, decOut2[11], writeData1, writeData2, outR11 );
		register32bit r12( clk, reset, regWrite1, decOut1[12], regWrite2, decOut2[12], writeData1, writeData2, outR12 );
		register32bit r13( clk, reset, regWrite1, decOut1[13], regWrite2, decOut2[13], writeData1, writeData2, outR13 );
		register32bit r14( clk, reset, regWrite1, decOut1[14], regWrite2, decOut2[14], writeData1, writeData2, outR14 );
		register32bit r15( clk, reset, regWrite1, decOut1[15], regWrite2, decOut2[15], writeData1, writeData2, outR15 );
		register32bit r16( clk, reset, regWrite1, decOut1[16], regWrite2, decOut2[16], writeData1, writeData2, outR16 );
		register32bit r17( clk, reset, regWrite1, decOut1[17], regWrite2, decOut2[17], writeData1, writeData2, outR17 );
		register32bit r18( clk, reset, regWrite1, decOut1[18], regWrite2, decOut2[18], writeData1, writeData2, outR18 );
		register32bit r19( clk, reset, regWrite1, decOut1[19], regWrite2, decOut2[19], writeData1, writeData2, outR19 );
		register32bit r20( clk, reset, regWrite1, decOut1[20], regWrite2, decOut2[20], writeData1, writeData2, outR20 );
		register32bit r21( clk, reset, regWrite1, decOut1[21], regWrite2, decOut2[21], writeData1, writeData2, outR21 );
		register32bit r22( clk, reset, regWrite1, decOut1[22], regWrite2, decOut2[22], writeData1, writeData2, outR22 );
		register32bit r23( clk, reset, regWrite1, decOut1[23], regWrite2, decOut2[23], writeData1, writeData2, outR23 );
		register32bit r24( clk, reset, regWrite1, decOut1[24], regWrite2, decOut2[24], writeData1, writeData2, outR24 );
		register32bit r25( clk, reset, regWrite1, decOut1[25], regWrite2, decOut2[25], writeData1, writeData2, outR25 );
		register32bit r26( clk, reset, regWrite1, decOut1[26], regWrite2, decOut2[26], writeData1, writeData2, outR26 );
		register32bit r27( clk, reset, regWrite1, decOut1[27], regWrite2, decOut2[27], writeData1, writeData2, outR27 );
		register32bit r28( clk, reset, regWrite1, decOut1[28], regWrite2, decOut2[28], writeData1, writeData2, outR28 );
		register32bit r29( clk, reset, regWrite1, decOut1[29], regWrite2, decOut2[29], writeData1, writeData2, outR29 );
		register32bit r30( clk, reset, regWrite1, decOut1[30], regWrite2, decOut2[30], writeData1, writeData2, outR30 );
		register32bit r31( clk, reset, regWrite1, decOut1[31], regWrite2, decOut2[31], writeData1, writeData2, outR31 );
endmodule

//32to1mux[32]
module mux32to1_32bit(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15, 
	input [31:0] outR16, input [31:0] outR17, input [31:0] outR18, input [31:0] outR19,
	input [31:0] outR20, input [31:0] outR21, input [31:0] outR22, input [31:0] outR23,
	input [31:0] outR24, input [31:0] outR25, input [31:0] outR26, input [31:0] outR27,
	input [31:0] outR28, input [31:0] outR29, input [31:0] outR30, input [31:0] outR31,
	input [4:0] Sel, output reg [31:0] outBus);

	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,Sel)
		case(Sel)
			5'd0:outBus=outR0;
			5'd1:outBus=outR1;
			5'd2:outBus=outR2;
			5'd3:outBus=outR3;
			5'd4:outBus=outR4;
			5'd5:outBus=outR5;
			5'd6:outBus=outR6;
			5'd7:outBus=outR7;
			5'd8:outBus=outR8;
			5'd9:outBus=outR9;
			5'd10:outBus=outR10;
			5'd11:outBus=outR11;
			5'd12:outBus=outR12;
			5'd13:outBus=outR13;
			5'd14:outBus=outR14;
			5'd15:outBus=outR15;
			5'd16:outBus=outR16;
			5'd17:outBus=outR17;
			5'd18:outBus=outR18;
			5'd19:outBus=outR19;
			5'd20:outBus=outR20;
			5'd21:outBus=outR21;
			5'd22:outBus=outR22;
			5'd23:outBus=outR23;
			5'd24:outBus=outR24;
			5'd25:outBus=outR25;
			5'd26:outBus=outR26;
			5'd27:outBus=outR27;
			5'd28:outBus=outR28;
			5'd29:outBus=outR29;
			5'd30:outBus=outR30;
			5'd31:outBus=outR31;
		endcase
endmodule


//5to32decoder[32]
module decoder5to32_32bit(input [4:0] destReg, output reg [31:0] decOut);
	always @(destReg)
		case(destReg)
			5'd0: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0001;
			5'd1: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0010;
			5'd2: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0100;
			5'd3: decOut=32'b0000_0000_0000_0000_0000_0000_0000_1000;
			5'd4: decOut=32'b0000_0000_0000_0000_0000_0000_0001_0000;
			5'd5: decOut=32'b0000_0000_0000_0000_0000_0000_0010_0000;
			5'd6: decOut=32'b0000_0000_0000_0000_0000_0000_0100_0000;
			5'd7: decOut=32'b0000_0000_0000_0000_0000_0000_1000_0000;
			5'd8: decOut=32'b0000_0000_0000_0000_0000_0001_0000_0000;
			5'd9: decOut=32'b0000_0000_0000_0000_0000_0010_0000_0000;
			5'd10: decOut=32'b0000_0000_0000_0000_0000_0100_0000_0000;
			5'd11: decOut=32'b0000_0000_0000_0000_0000_1000_0000_0000;
			5'd12: decOut=32'b0000_0000_0000_0000_0001_0000_0000_0000;
			5'd13: decOut=32'b0000_0000_0000_0000_0010_0000_0000_0000;
			5'd14: decOut=32'b0000_0000_0000_0000_0100_0000_0000_0000;
			5'd15: decOut=32'b0000_0000_0000_0000_1000_0000_0000_0000;
			5'd16: decOut=32'b0000_0000_0000_0001_0000_0000_0000_0000;
			5'd17: decOut=32'b0000_0000_0000_0010_0000_0000_0000_0000;
			5'd18: decOut=32'b0000_0000_0000_0100_0000_0000_0000_0000;
			5'd19: decOut=32'b0000_0000_0000_1000_0000_0000_0000_0000;
			5'd20: decOut=32'b0000_0000_0001_0000_0000_0000_0000_0000;
			5'd21: decOut=32'b0000_0000_0010_0000_0000_0000_0000_0000;
			5'd22: decOut=32'b0000_0000_0100_0000_0000_0000_0000_0000;
			5'd23: decOut=32'b0000_0000_1000_0000_0000_0000_0000_0000;
			5'd24: decOut=32'b0000_0001_0000_0000_0000_0000_0000_0000;
			5'd25: decOut=32'b0000_0010_0000_0000_0000_0000_0000_0000;
			5'd26: decOut=32'b0000_0100_0000_0000_0000_0000_0000_0000;
			5'd27: decOut=32'b0000_1000_0000_0000_0000_0000_0000_0000;
			5'd28: decOut=32'b0001_0000_0000_0000_0000_0000_0000_0000;
			5'd29: decOut=32'b0010_0000_0000_0000_0000_0000_0000_0000;
			5'd30: decOut=32'b0100_0000_0000_0000_0000_0000_0000_0000;
			5'd31: decOut=32'b1000_0000_0000_0000_0000_0000_0000_0000;
		endcase
endmodule

//2to1mux[1]
module mux2to1_1bit(input outR0, input outR1, input Sel, output reg outBus);
	always@(in0,in1,Sel)
		case(Sel)
			1'd0:outBus=outR0;
			1'd1:outBus=outR1;
		endcase
endmodule

//2to1mux[2]
module mux2to1_2bit(input [1:0] outR0, input [1:0] outR1, input Sel, output reg [1:0] outBus);
	always@(in0,in1,Sel)
		case(Sel)
			1'd0:outBus=outR0;
			1'd1:outBus=outR1;
		endcase
endmodule

//2to1mux[32]
module mux2to1_32bit(input [31:0] outR0, input [31:0] outR1, input Sel, output reg [31:0] outBus);
	always@(in0,in1,Sel)
		case(Sel)
			1'd0:outBus=outR0;
			1'd1:outBus=outR1;
		endcase
endmodule

//4to1mux[32]
module mux4to1_32bit(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [1:0] Sel, output reg [31:0] outBus);
	always@(in0,in1,Sel)
		case(Sel)
			2'd0:outBus=outR0;
			2'd1:outBus=outR1;
			2'd2:outBus=outR2;
			2'd3:outBus=outR3;
		endcase
endmodule

//8to1mux[32]
module mux8to1_32bit(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,input [2:0] Sel, 
	output reg [31:0] outBus);
	always@(in0,in1,Sel)
		case(Sel)
			3'd0:outBus=outR0;
			3'd1:outBus=outR1;
			3'd2:outBus=outR2;
			3'd3:outBus=outR3;
			3'd0:outBus=outR4;
			3'd1:outBus=outR5;
			3'd2:outBus=outR6;
			3'd3:outBus=outR7;
		endcase
endmodule

//register5bit
module register5bit( input clk, input reset, input regWrite, input decOut1b, input [4:0]writeData, output [4:0] outR );
	D_ff_n d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_n d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_n d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_n d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
endmodule

//2to1mux[5]
module mux2to1_5bit(input [4:0] outR0, input [4:0] outR1, input Sel, output reg [4:0] outBus);
	always@(in0,in1,Sel)
		case(Sel)
			1'd0:outBus=outR0;
			1'd1:outBus=outR1;
		endcase
endmodule

module signExt5to32( input [4:0] shftamt, output reg [31:0] signExtshftamt);		//Reg[rd] = Reg[Rs1] << shftamt
	always @ (offset)
	begin
		signExtshftamt={{28{shftamt[5]}},shftamt[3:0]};
	end
endmodule
module signExt12to32( input [11:0] offset, output reg [31:0] signExtOffset);		
	always @ (offset)
	begin
		signExtOffset={{20{offset[11]}},offset[11:0]};
	end
endmodule
module signExt13to32( input [12:0] offset, output reg [31:0] signExtOffset);		
	always @ (offset)
	begin
		signExtOffset={{19{offset[12]}},offset[12:0]};
	end
endmodule
module signExt18to32( input [17:0] offset, output reg [31:0] signExtOffset);		
	always @ (offset)
	begin
		signExtOffset={{14{offset[17]}},offset[17:0]};
	end
endmodule

module signExt8to32( input [7:0] offset, output reg [31:0] signExtOffset);		
	always @ (offset)
	begin
		signExtOffset={{24{offset[7]}},offset[7:0]};
	end
endmodule

module left_shift32(input [31:0] input1, output reg [31:0] output1);
	always @ (input1)
	begin
		output1=input1<<2;
	end
endmodule

module registerFile(input clk, input reset, input p3_regWrite1 , input p3_regWrite2 , input [4:0] p0_instr1 ,
input [4:0] p0_instr2 , input [2:0] p0_instr3 , input [4:0] p3_regDest1 , input [4:0] p3_regDest2 , 
input [31:0] p3_memOut, input [31:0] p3_aluOut , output [31:0] p0_rs1,output [31:0] p0_rs2,output [31:0] p0_rs3 );

 	wire [31:0] decoderOut1;
 	wire [31:0] decoderOut2;

	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,
	outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,
	outR30,outR31; 
	   
	decoder5to32_32bit decoder1_insideRegisterFile(p3_regDest1,decoderOut1);
	decoder5to32_32bit decoder2_insideRegisterFile(p3_regDest2,decoderOut2);
	    
   registerSet regSet0(clk, reset, p3_regWrite1, decoderOut1, p3_regWrite2, decoderOut2, p3_aluOut, p3_memOut, 
	outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,
	outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31);
    
 	mux32to1_32bit rs_insideRegisterFile(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
	outR27,outR28,outR29,outR30,outR31,p0_instr1,p0_rs1); //p0_instr1 gives rs
	
 	mux32to1_32bit rt_insideRegisterFile(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
	outR27,outR28,outR29,outR30,outR31,p0_instr2,p0_rs2);  //p0_instr2 gives rt
	
	mux32to1_32bit rsc_insideRegisterFile(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,
	outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
	outR27,outR28,outR29,outR30,outR31,p0_instr3,p0_rs3); //p0_instr3 gives rsc

 	  	  	  		 
endmodule