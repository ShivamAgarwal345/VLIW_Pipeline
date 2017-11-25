/Normal Registers begin
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
