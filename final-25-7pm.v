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

//should i give default values????
//incomplete
module ctrlCkt( input [6:0] opcode,  input [2:0] funct_3 , output reg [1:0] pc_in, output reg regWrite1,  
output reg jump, output reg [1:0] aluOp , output reg memWrite , output reg IF_Flush  , /*output reg regRead ,*/
output memtoReg , output reg [2:0] aluSrcB , output reg slti);
  

 always@(opcode or funct_3)
	begin
		case(opcode)																	//aluOp 0 - add	
			7'b0010011:																	// 1 - xor			
			begin																		// 2 - shift		
				case(funct_3)															// 3 - compare				
					3'b000:						//for addi
					begin
						pc_in = 2'b00;														// not sure
						regWrite1 = 1'b1;
						jump = 1'b0;
						aluOp = 2'b00;
						memWrite = 1'b0;
						IF_Flush = 1'b0;
						//regRead = 1'b1;
						memtoReg = 1'b0;
						aluSrcB = 3'b010;
						slti = 1'b0;
					end
					
					3'b010:						//for slti
					begin
						pc_in = 2'b00;														// not sure
						regWrite1 = 1'b1;
						jump = 1'b0;
						aluOp = 2'b11;
						memWrite = 1'b0;
						IF_Flush = 1'b0;
						//regRead = 1'b1;
						memtoReg = 1'b0;
						aluSrcB = 3'b010;
						slti = 1'b1;
					end
					
					3'b101:					//for SRLI
					begin
						pc_in = 2'b00;														// not sure
						regWrite1 = 1'b1;
						jump = 1'b0;
						aluOp = 2'b10;
						memWrite = 1'b0;
						IF_Flush = 1'b0;
						regRead = 1'b1;
						memtoReg = 1'b0;
						aluSrcB = 3'b001;
						slti = 1'b0;
					end
				endcase
			end
			
			7'b0110011:						//XOR
			begin
				pc_in = 2'b00;														// not sure
				regWrite1 = 1'b1;
				jump = 1'b0;
				aluOp = 2'b01;
				memWrite = 1'b0;
				IF_Flush = 1'b0;
				regRead = 1'b1;
				memtoReg = 1'b0;
				aluSrcB = 3'b000;
				slti = 1'b0;
			end
			
			7'b1100111:					//JALR
			begin
				pc_in = 2'b10;														// not sure
				regWrite1 = 1'b1;
				jump = 1'b1;
				aluOp = 2'b00;
				memWrite = 1'b0;
				IF_Flush = 1'b1;
				regRead = 1'b1;
				memtoReg = 1'b1;                                                   // not sure
				aluSrcB = 3'b100;
				slti = 1'b0;
			end
			
			7'b1100111:					//SW
			begin
				pc_in = 2'b00;														// not sure
				regWrite1 = 1'b0;
				jump = 1'b0;
				aluOp = 2'b00;
				memWrite = 1'b1;
				IF_Flush = 1'b0;
				regRead = 1'b1;
				memtoReg = 1'b0;       //dontcare                                  // not sure
				aluSrcB = 3'b011;
				slti = 1'b0;
			end
		endcase
	end
endmodule


//incomplete
//should i give default values????
module ctrlCktcompressed(input [1:0] opcode, input [2:0] funct_3 , output reg [1:0] pc_in, 
output reg regWrite2, output reg branch ,  output reg memReadc , output reg IF_Flush  , output reg regRead ,
output  memtoRegc , output reg adderSrcA , output reg adderSrcB , output reg regDestC);
  
  

	always@(opcode)
	begin
		case(funct_3)
			3'b010:							///c.lw
			begin
				pc_in = 2'b00;
				regWrite2 = 1'b1;
				branch = 1'b0;
				memReadc = 1'b1;
				IF_Flush = 1'b0;
				regRead = 1'b1;
				memtoRegc = 1'b1;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b1;
			end
			
			3'b011:							///c.lui
			begin
				pc_in = 2'b00;
				regWrite2 = 1'b1;
				branch = 1'b0;
				memReadc = 1'b0;				//doubt
				IF_Flush = 1'b0;
				regRead = 1'b0;
				memtoRegc = 1'b0;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b0;
			end
			
			3'b010:							///c.branch
			begin
				pc_in = 2'b01;
				regWrite2 = 1'b0;
				branch = 1'b1;
				memReadc = 1'b0;
				IF_Flush = 1'b1;
				regRead = 1'b1;
				memtoRegc = 1'b1;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b1;
			end
		endcase
	end
endmodule

module forwarding(input Ex, input jump, input branch funct,input p2_regwr1, input p2_regwr2, input [4:0] p0_rs1,input [4:0] p0_rs2,input [4:0] p0_rsc,input p3_regwr, input p3_regwrc,input [4:0] p3_regdest,input [4:0] p3_regdestc, input p3_memwr, input [4:0] p2_regdest,input [4:0] p2_regdestc,output reg [2:0]fwd1, output reg [2:0] fwd2, output reg [2:0] fwd3, output reg[2:0] fwd4, output [2:0] fwd5);
	always@(opcode, opcodec,  funct, p2_regwr1, p2_regwr2, p0_rs1, p0_rs2, p0_rsc, p3_regwr1, p3_regwr2, p3_regdest, p3_regdestc, p3_memwr, p2_regdest, p2_regdestc,  
	p2_memwr)
	begin

			// p0_rs1 is rs of current instruction p0_rsc is rs of compressed instruction
			// regwr2 anything2 means that of compressed instruction
			// p0 means current p1 is pipeline1 or basically instruction before the current1  and so on
			// since the instruction before this must have been a flush one if there was a hazard we only need to consider p2 and p3
			// 0000.. will be passed as opcode when this module is used in execute cycle to detect that we are currently not calling it for a branch or jump
			// branch and jump are considered the only instructions executing in ID cycle as of now

		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rs1)
		
		begin
		if(Ex == 1'b1)						// means checking at Exe stage is happening	
		fwd1 =  3'b001;
		if(jump && Ex==1'b0)							// 1100111 is opcode of jump and this checking is done at ID stage
		fwd3 = 3'b001;
		end
		
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rs1)
		
		begin
		if(Ex == 1'b1)
		fwd1 =  3'b010;
		if(jump && Ex==1'b0)							
		fwd3 = 3'b010;
		end

		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		
		begin
		if(Ex == 1'b1)
		fwd1 =  3'b011;
		if(jump && Ex == 1'b0)							
		fwd3 = 3'b011;
		end

		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		
		begin
		if(Ex == 1'b1)
		fwd1 =  3'b011;
		if(jump && Ex == 1'b0)							
		fwd3 = 3'b011;
		end

		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rs1)
		
		begin
		if(Ex == 1'b1)
		fwd1 =  3'b100;
		if(jump && Ex==1'b0)							// 1100111 is opcode of jump
		fwd3 = 3'b100;
		end

		else
		begin
		if(Ex == 1'b1)
		fwd1 =  3'b000;
		if (Ex == 1'b0 && jump)
		fwd3 = 3'b000;
		end
	

		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rs2)
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b001;
		end
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rs2)
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b010;
		end
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs2)
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b011;
		end
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs2)
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b011;
		end
		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rs2)
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b100;
		end
		else
		begin
		if(opcode == 7'b0000000)
		fwd2 = 3'b000;
		end


		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rsc)
		begin
		if(Ex == 1'b1)
		fwd3 = 3'b001;
																
		if(branch && Ex == 1'b0)
		fwd5 = 3'b001;
		end
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rsc)
		begin
		if(Ex == 1'b1)
		fwd3 = 3'b010;
		if (branch && Ex == 1'b0)				
		fwd5 = 3'b010;
		end
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		begin
		if(Ex == 1'b1)
		fwd3 = 3'b011;
		if (branch && Ex == 1'b0)			
		fwd5 = 3'b011;
		end
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		begin
		if(Ex == 1'b1)
		fwd3 = 3'b011;
		if (branch && Ex == 1'b0)				
		fwd5 = 3'b011;
		end
		else 
		begin
		if(Ex == 1'b1)
		fwd3 = 3'b100;
		if (branch && Ex == 1'b0)
		fwd5 = 3'b000;
		end
	end	
endmodule

module hazard( input jump, input branch,input p1_memread, input p1_regwrite, input p1_regdestc,input p2_memread, input p2_regwrite,input p2_regdestc, input src1, input src2, input src3,
			output reg id_ex_controlvalue, output reg pc_write, output reg if_id_write);
	always @ (p1_memread or p1_regwrite or src1 or src2 or src3 or p2_memread or p2_regwrite or p1_regdest or p1_regdestc or p2_regdestc or p2_regdestc )
	begin
            // Load use hazard
			if (p1_memread == 1'b1 && p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest))
			  begin
                id_ex_control_value=1;
                pc_write=0;
                if_id_write=0;
            end

            else
            begin
                id_ex_control_value=0;
                pc_write=1;
                if_id_write=1;
            end  
	
            // beq hazard
            if(opcode[1:0]==2'b01 && funct == 3'b111)               // opcode for branch
            begin
            if(p1_memwread == 1'b1 && p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest))
              begin
                id_ex_control_value=1;                             // I know we have to introduce two stalls but it will again be a hazard (see last type                                               // hazard type in my code) in the next cycle so only one stall needed for now
                pc_write=0;                     
                if_id_write=0;          
            end                                           

            if (p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest))
                  begin
                id_ex_control_value=1;
                pc_write=0;
                if_id_write=0;                                      // single stall
            end  

            if (p2_memread == 1'b1 && p2_regwrite == 1'b1 && (src1 == p2_regdestc || src2 == p2_regdestc || src3 == p2_regdestc))
             begin
                id_ex_control_value=1;
                pc_write=0;
                if_id_write=0;                                      // single stall
            end
            end
    end

endmodule

//Normal Registers begin
module D_ff_n(input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
	end
endmodule

//FOr accomodating flush
module D_ff_n_1(input clk, input reset, input flush, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1 || flush==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
	end
endmodule

module register48bit_n_1( input clk, input reset, input flush, input regWrite, input decOut1b, input [47:0] writeData, output  [47:0] outR );
	D_ff_n_1 d0(clk, reset, flush, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n_1 d1(clk, reset, flush, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_n_1 d2(clk, reset, flush, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_n_1 d3(clk, reset, flush, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_n_1 d4(clk, reset, flush, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_n_1 d5(clk, reset, flush, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_n_1 d6(clk, reset, flush, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_n_1 d7(clk, reset, flush, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_n_1 d8(clk, reset, flush, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_n_1 d9(clk, reset, flush, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_n_1 d10(clk, reset, flush, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_n_1 d11(clk, reset, flush, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_n_1 d12(clk, reset, flush, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_n_1 d13(clk, reset, flush, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_n_1 d14(clk, reset, flush, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_n_1 d15(clk, reset, flush, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff_n_1 d16(clk, reset, flush, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_n_1 d17(clk, reset, flush, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_n_1 d18(clk, reset, flush, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_n_1 d19(clk, reset, flush, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_n_1 d20(clk, reset, flush, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_n_1 d21(clk, reset, flush, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_n_1 d22(clk, reset, flush, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_n_1 d23(clk, reset, flush, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_n_1 d24(clk, reset, flush, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_n_1 d25(clk, reset, flush, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_n_1 d26(clk, reset, flush, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_n_1 d27(clk, reset, flush, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_n_1 d28(clk, reset, flush, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_n_1 d29(clk, reset, flush, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_n_1 d30(clk, reset, flush, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_n_1 d31(clk, reset, flush, regWrite, decOut1b, writeData[31], outR[31]);
	D_ff_n_1 d32(clk, reset, flush, regWrite, decOut1b, writeData[32], outR[32]);
	D_ff_n_1 d33(clk, reset, flush, regWrite, decOut1b, writeData[33], outR[33]);
	D_ff_n_1 d34(clk, reset, flush, regWrite, decOut1b, writeData[34], outR[34]);
	D_ff_n_1 d35(clk, reset, flush, regWrite, decOut1b, writeData[35], outR[35]);
	D_ff_n_1 d36(clk, reset, flush, regWrite, decOut1b, writeData[36], outR[36]);
	D_ff_n_1 d37(clk, reset, flush, regWrite, decOut1b, writeData[37], outR[37]);
	D_ff_n_1 d38(clk, reset, flush, regWrite, decOut1b, writeData[38], outR[38]);
	D_ff_n_1 d39(clk, reset, flush, regWrite, decOut1b, writeData[39], outR[39]);
	D_ff_n_1 d40(clk, reset, flush, regWrite, decOut1b, writeData[40], outR[40]);
	D_ff_n_1 d41(clk, reset, flush, regWrite, decOut1b, writeData[41], outR[41]);
	D_ff_n_1 d42(clk, reset, flush, regWrite, decOut1b, writeData[42], outR[42]);
	D_ff_n_1 d43(clk, reset, flush, regWrite, decOut1b, writeData[43], outR[43]);
	D_ff_n_1 d44(clk, reset, flush, regWrite, decOut1b, writeData[44], outR[44]);
	D_ff_n_1 d45(clk, reset, flush, regWrite, decOut1b, writeData[45], outR[45]);
	D_ff_n_1 d46(clk, reset, flush, regWrite, decOut1b, writeData[46], outR[46]);
	D_ff_n_1 d47(clk, reset, flush, regWrite, decOut1b, writeData[47], outR[47]);
endmodule
//Register 32 bit
module register32bit_n( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	D_ff_n d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_n d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_n d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_n d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_n d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_n d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_n d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_n d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_n d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_n d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_n d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_n d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_n d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_n d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_n d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff_n d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_n d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_n d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_n d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_n d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_n d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_n d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_n d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_n d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_n d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_n d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_n d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_n d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_n d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_n d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_n d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
endmodule

//Register 32 bit with flush

module register32bit_n_1( input clk, input reset, input flush, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	D_ff_n_1 d0(clk, reset, flush, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n_1 d1(clk, reset, flush, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_n_1 d2(clk, reset, flush, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_n_1 d3(clk, reset, flush, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_n_1 d4(clk, reset, flush, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_n_1 d5(clk, reset, flush, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_n_1 d6(clk, reset, flush, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_n_1 d7(clk, reset, flush, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_n_1 d8(clk, reset, flush, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_n_1 d9(clk, reset, flush, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_n_1 d10(clk, reset, flush, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_n_1 d11(clk, reset, flush, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_n_1 d12(clk, reset, flush, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_n_1 d13(clk, reset, flush, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_n_1 d14(clk, reset, flush, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_n_1 d15(clk, reset, flush, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff_n_1 d16(clk, reset, flush, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_n_1 d17(clk, reset, flush, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_n_1 d18(clk, reset, flush, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_n_1 d19(clk, reset, flush, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_n_1 d20(clk, reset, flush, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_n_1 d21(clk, reset, flush, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_n_1 d22(clk, reset, flush, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_n_1 d23(clk, reset, flush, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_n_1 d24(clk, reset, flush, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_n_1 d25(clk, reset, flush, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_n_1 d26(clk, reset, flush, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_n_1 d27(clk, reset, flush, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_n_1 d28(clk, reset, flush, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_n_1 d29(clk, reset, flush, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_n_1 d30(clk, reset, flush, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_n_1 d31(clk, reset, flush, regWrite, decOut1b, writeData[31], outR[31]);
endmodule
module register1bit_flag( input clk, input reset, input regWrite, input decOut1b, input writeData, output outR );
	D_ff_flag d0(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule

module register2bit( input clk, input reset, input regWrite, input decOut1b, input [1:0]writeData, output [1:0] outR );
	D_ff_n d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
endmodule

module register3bit( input clk, input reset, input regWrite, input decOut1b, input [2:0]writeData, output [2:0] outR );
	D_ff_n d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_n d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_n d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule

module IF_ID (input clk, input reset, input regwrite, input decOut1b, input flush, input [31:0] pc,input [47:0] instr, output [31:0] p0_pc, input [47:0] p0_instr);
	register32bit_n_1 r0 (clk,reset,flush,regwrite, decOut1b, pc, p0_pc);
	register48bit_n_1 r1 (clk,reset,flush,regwrite, decOut1b, instr, p0_instr);

endmodule


module pipeline(input clk, input reset, output [31:0] Result1, output [31:0] Result2);
wire PCWrite, p0_Write, IF_Flush, p3_regWrite1, p3_regWrite2, p3_negativeFlag1, reg_negativeFlag, p3_overflowFlag, reg_overflowFlag, p3_carryFlag, reg_carryFlag;
wire p3_zeroFlag1, reg_zeroFlag, p2_overflowFlag, memRead, memWrite, regWrite1, regWrite2, CauseWrite, EPC_Write, ID_Flush, EX_Flush, p1_negativeFlag, p1_carryFlag, p1_overflowFlag, p1_zeroFlag;
wire p1_memRead, p1_memWrite, p1_regWrite1, p1_regWrite2, alu_negativeFlag, alu_zeroFlag, alu_overflowFlag, alu_carryFlag, p2_negativeFlag, p2_carryFlag, p2_zeroFlag;
wire p2_memRead, p2_memWrite, p2_regWrite1, p2_regWrite2, p3_negativeFlag, p3_zeroFlag, p1_p2_overflowPast, flagWrite1, flagWrite2, p1_flagWrite, p2_flagWrite, p3_flagWrite;
wire memRead_mux, memWrite_mux, regWrite1_mux, regWrite2_mux, MEM_Flush, p1_EPCWrite, p1_CauseWrite, Cause_Val1;
wire [31:0] EPCVal, EPC_Val1, PC_MuxOut, PC_Out, PC_AdderOut, p0_pc, reg_rm1, reg_rn1, reg_rd1, reg_rm2, reg_rn2, reg_rd2, zeroExtOffset_IR1_10_6, zeroExtOffset_IR1_8_6, signExtOffset_IR2_7_0;
wire [31:0] adder_branch_input, branch_pc, p1_reg_rm1, p1_reg_rn1, p1_reg_rd1, p1_reg_rm2, p1_reg_rn2, p1_reg_rd2, p1_pc, p1_shiftimm, p1_aluimm, aluIn2, aluOut1, adderOut_instr2;
wire [31:0] p2_aluout, p2_adderout, p2_reg_rd2, alu_in1, alu_in2, adder_in1, adder_in2, mem_in, p2_pc, adder_epc_in;
wire [15:0] instr1, instr2, p0_instr1, p0_instr2, memout, p3_memOut;
wire [2:0] p3_rd1, p3_rd2, p1_rm1, p1_rn1, p1_rm2, p1_rn2, p1_rd1, p1_rd2, p2_rd1, p2_rd2;
wire [11:0] jump_pc;
wire [1:0] aluSrcB, aluOp, PCSource, p1_aluSrcB, p1_aluOp, aluSrcB_mux, aluOp_mux, ForwardA1, ForwardA2, ForwardB1, ForwardB2, ForwardC2;
wire [4:0] p1_opcode1, p1_opcode2;

or obj (pcwrite, jump, branchcomparator);
mux2to1_32bit mux_pc(pc_adderOut,branch_pc, pcwrite, PC_final);			
//PC1 represents branch_pc this will be true if branch is taken
	
register32bit_n PC( clk, reset, PC_write, 1'b1, PC_final, pcOut );
  
adder PC_add(pcOut, 32'b0000_0000_0000_0000_0000_0000_0000_0100, pc_adderOut);
  
Mem IM( clk, reset, 1'b0, 1'b1, pcOut, 32'b0000_0000_0000_0000_0000_0000_0000_0000, IR );
  
IF_ID p0_call(clk, reset, IF_ID_write, IF_Flush, 1'b1, PC_AdderOut, IR, p0_pc, p0_instr); 


signExt5to32 s1 (p0_instr1[40:36], shift_amt_32);
signExt12to32 s2 (p0_instr1[47:36], sign_ext_12_Itype);
signExt13to32 s3 ({p0_instr1[47:36], 1'b0}, sign_ext_13);
signExt12to32 s4 ({p0_instr[47:41], p0_instr1[27:23]}, sign_ext_12_Stype);
signExt18to32 s5 ({{p0_instr[12], p0_instr[6:2]}, 12'b0}, sign_ext_18);
signExt8to32 s6 ({p0_instr[12],p0_instr[6:5],p0_instr[2],p0_instr[11:10], p0_instr[4:3]}, branch_address);
// regdestcompressed to be decided by a mux during execute
registerFile rf_call(clk, reset, p3_regwrite1, p3_regwrite2, p0_instr1[35:31], p0_instr1[40:36], p0_instr2[9:7], p0_instr[27:23], ??,  p3_memout,
	p3_aluout, p0_rs1, p0_rs2, p0_rsc);	

wire [31:0] out1, out2;
mux8to1_32bit Forward1  (p0_pc, p2_aluout, p2_adderout, regdata, regdatac, forward5, out_temp1);


mux8to1_32bit Forward1  (p0_reg_rs1, p2_aluout, p2_adderout, regdata, regdatac, forward4, out_temp2);		

mux2to1_32bit IDaddersource1 (out_temp1,out_temp2,jump, out1);  

mux2to1_32bit IDaddersource2 (branch_address, sign_ext_13, jump, out2);
 
adder32 branch_adder(out1, out2, branch_pc);

comparator c1 (p0_rsc, 32'b0, flag); // flag = 1'b1 means result of comaprator was true

and a (flag, branch, branch_comparator); // branch comes from control ckt this signal is just for seeing if branch is required and ifflush will be made = this signal
// branch_comparator should be one for branch to be taken

  ctrlCkt Ctrlckt( p0_intr[22:16], p0_instr[30:28], pc_in, regwrite,  
  jump, aluOp, memwrite, IF_Flush, regread, memtoreg, aluSrcb, slti);	// overflow flag not kept add_shoft_bar not kept epcwrite1 causewrite2 exception regread added aluSrcb added
	
  ctrlCktcompressed Ctrlckr (p0_instr[1:0], p0_instr[15:13], pc_inc, regwritec, branch, memread, IF_Flushc, regread, memtoregc, regdestc); //adderssrcA and B added  pc_incompressed added


   mux2to1_1bit ctrl_mux_1(regwrite, 1'b0, hd_stall , mux_regwrite);
 	mux2to1_1bit ctrl_mux_2(pcwrite, 1'b0, hd_stall , mux_pcwrite);
   mux2to1_1bit ctrl_mux_3(memwrite, 1'b0, hd_stall , mux_memwrite);
   mux2to1_1bit ctrl_mux_4(regwritec, 1'b0, hd_stall , mux_regwritec);
   mux2to1_1bit ctrl_mux_5(pcwrite_c, 1'b0, hd_stall , mux_pcwritec);



ID_EX call (clk, reset, 1'b1, 1'b1, all control signals, p0_pc, p0_instr[35:31], p0_instr[40:36], p0_rs1, p0_rs2, p0_rsc, 
{2'b00, p0_instr[9:7]}, p0_instr[27:23], p0_instr[11:7], {2'b00,p0_instr[4:2]}, shift_amt_32, sign_ext_12_Itype, sign_ext_13, sign_ext_12_Stype, sign_ext_18,{15'b0,p0_instr[6:2],2'b0},  	// inputs over
all control signals, p1_pc, p1_instr_rs1, p1_instr_rs2, p1_rs1, p1_rs2, p1_rsc, p1_instr_rsc, p1_regdest, p1_regdestc1, p1_regdestc2, p1_shift_amt_32, p1_sign_ext_12_Itype, p1_sign_ext_13, p1_sign_ext_12_Stype, p1_sign_ext_18, p1_concat 
 );


mux8to1_32bit Forward1  (p1_rs1, p2_aluout, p2_adderout, regdata, regdatac, alu_in1);		// some_out1 some_out2
mux8to1_32bit Forward2  (p1_rs2, p2_aluout, p2_adderout, regdata, regdatac, alu_in2_temp);
mux8to1_32bit Forward3  (p1_rsc, p2_aluout, p2_adderout, regdata, regdatac, adder_in_1);

mux8to1_32bit  lastmuxbeforealu (alu_in2_temp, p1_shift_amt_32, sign_ext_12_Itype, p1_sign_ext_12_Stype, p1_sign_ext_13, 32'b0, 32'b0, 32'b0, alusrcb, alu_in2);
			// the last mux before adder uses branch address and CLW instruction ka 2nd input


mux2to1_32bit destinationcompressed (p1_regdestc1, p1_regdestc2, regdestc, p1_regdestc);

// forwarding forw (p2_regwr1, p2_regwr2, p1_rs1, p1_rs2, p1_rs3, p3_regwr1, p3_regwr2, p2_regdest1, p2_regdest2, p3_regdest1, p3_regdest2, p2_memwr1, p2_memwr2, p3_memwr1, p3_memwr2);

alu ALU_call(alu_in1, aluIn2, p1_aluOp, p1_overflowFlag, p1_carryFlag, p1_negFlag,p1_zeroFlag,Npflag,aluOut); 

mux2to1 sltimux (32'b0, 32'b1, Npflag, slti_out);					// check if N/p flag is set when it is less or great
mux2to1 alufinaloutput (aluOut1, slti_out, slti, aluout);
mux2to1 compressed_1st_input (p1_pc, p1_rsc, control , adder_in_1);
mux2to1 compressed_2nd_input (p1_concat, p1_branch_address, adder_in_2);

adder32 Adder_instr2_call(adder_in_1, p1_concat,  adder_out);




mux2to1_5bit reg_dest_c (p1_regdestc1, p1_regdestc2, control, p1_regdestc);
mux2to1_32bit alu_or_slti (aluOut, slti_out, slti, aluout); 


EX_MEM ex_mem(clk, reset, 1'b1, 1'b1, p1_regwrite, p1_regwritec, p1_memread, p1_memwrite,
  adder_out, aluout,   p1_regdest, p1_regdestc, p1_rs2, p1_sign_ext_18, p1_pc,
	p2_regwrite, p2_regwritec, p2_memread, p2_memwrite, 
	p2_adderOut, p2_AluOut, p2_regdest, p2_regdestc, p2_rs2, p2_sign_ext_18, p2_pc);

 
  wire [31:0] memOut;
  DataMem Data_mem(clk, reset, p2_memWrite, p2_memRead, p2_adderOut, p2_aluout, p2_rs2, memOut );
  
  
  
  MEM_WB mem_wb( clk, reset, 1'b1, 1'b1, p2_memwrite, p2_regwrite, p2_regwritec,
  p2_pc,
  memOut, p2_AluOut, 
  p2_regdest, p2_regdestc, p2_sign_ext_18,
  p3_memWrite, p3_regWrite1, p3_regWrite2, 
  p3_pc,
  p3_memOut, p3_aluOut, 
  p3_regdest, p3_regdestc, p3_sign_ext_18);

 
  mux2to1_32bit normalregdata (p3_aluout, p3_pc, memtoreg, regdata);
  mux2to1_32bit compressedregdata (  p3_sign_ext_18, p3_memout, memtoregc, regdatac);


  
  Forwarding fwd_ckt(1'b0, jump, branch, p2_regwrite, p2_regwritec, p0_instr[35:31], p0_instr[40:36], p0_instr[9:7], p3_regwrite, p3_regwritec, p3_regdest, p3_regdestc, p3_memwrite, p2_regdest, p2_regdestc,  
  forward1, forward2, forward3, forward4, forward5);

  Forwarding fwd_ckt1 (1'b1, 1'b0, 1'b0, p2_regwrite, p2_regwritec, p1_rs1, p1_rs2, p1_rsc, p3_regwrite, p3_regwritec, p3_regdest, p3_regdestc, p3_memwrite, p2_regdest, p2_regdestc,  
  forward1, forward2, forward3, forward4, forward5)

  hazard hazard_call(jump, branch, p1_memread, p1_regwrite, p2_memread, p2_regwrite, p2_regdestc,p0_instr[35:31], p0_instr[40:36], p0_instr[9:7], hd_stall, pc_write, if_id_write);
  
	 
					
 assign A = p3_memOut;
 assign B = p3_aluOut;
 
endmodule
