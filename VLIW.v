//Memory design
module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (posedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule
module register_Mem(input clk,input reset,input regWrite,input decOut1b,input [31:0]init, input [31:0] d_in, output [31:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);
	
	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);

	D_ff_Mem dMem8 (clk,reset,regWrite,decOut1b,init[8],d_in[8],q_out[8]);
	D_ff_Mem dMem9 (clk,reset,regWrite,decOut1b,init[9],d_in[9],q_out[9]);
	D_ff_Mem dMem10 (clk,reset,regWrite,decOut1b,init[10],d_in[10],q_out[10]);
	D_ff_Mem dMem11 (clk,reset,regWrite,decOut1b,init[11],d_in[11],q_out[11]);
	
	D_ff_Mem dMem12 (clk,reset,regWrite,decOut1b,init[12],d_in[12],q_out[12]);
	D_ff_Mem dMem13 (clk,reset,regWrite,decOut1b,init[13],d_in[13],q_out[13]);
	D_ff_Mem dMem14 (clk,reset,regWrite,decOut1b,init[14],d_in[14],q_out[14]);
	D_ff_Mem dMem15 (clk,reset,regWrite,decOut1b,init[15],d_in[15],q_out[15]);
	D_ff_Mem dMem16 (clk,reset,regWrite,decOut1b,init[16],d_in[16],q_out[16]);
	D_ff_Mem dMem17(clk,reset,regWrite,decOut1b,init[17],d_in[17],q_out[17]);
	D_ff_Mem dMem18(clk,reset,regWrite,decOut1b,init[18],d_in[18],q_out[18]);
	D_ff_Mem dMem19(clk,reset,regWrite,decOut1b,init[19],d_in[19],q_out[19]);
	
	D_ff_Mem dMem20 (clk,reset,regWrite,decOut1b,init[20],d_in[20],q_out[20]);
	D_ff_Mem dMem21(clk,reset,regWrite,decOut1b,init[21],d_in[21],q_out[21]);
	D_ff_Mem dMem22 (clk,reset,regWrite,decOut1b,init[22],d_in[22],q_out[22]);
	D_ff_Mem dMem23 (clk,reset,regWrite,decOut1b,init[23],d_in[23],q_out[23]);

	D_ff_Mem dMem24 (clk,reset,regWrite,decOut1b,init[24],d_in[24],q_out[24]);
	D_ff_Mem dMem25 (clk,reset,regWrite,decOut1b,init[25],d_in[25],q_out[25]);
	D_ff_Mem dMem26 (clk,reset,regWrite,decOut1b,init[26],d_in[26],q_out[26]);
	D_ff_Mem dMem27 (clk,reset,regWrite,decOut1b,init[27],d_in[27],q_out[27]);
	
	D_ff_Mem dMem28 (clk,reset,regWrite,decOut1b,init[28],d_in[28],q_out[28]);
	D_ff_Mem dMem29 (clk,reset,regWrite,decOut1b,init[29],d_in[29],q_out[29]);
	D_ff_Mem dMem30 (clk,reset,regWrite,decOut1b,init[30],d_in[30],q_out[30]);
	D_ff_Mem dMem31 (clk,reset,regWrite,decOut1b,init[31],d_in[31],q_out[31]);
	
endmodule

module register_Mem_data(input clk,input reset,input regWrite,input decOut1b,input [15:0]init, input [15:0] d_in, output [15:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);
	
	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);

	D_ff_Mem dMem8 (clk,reset,regWrite,decOut1b,init[8],d_in[8],q_out[8]);
	D_ff_Mem dMem9 (clk,reset,regWrite,decOut1b,init[9],d_in[9],q_out[9]);
	D_ff_Mem dMem10 (clk,reset,regWrite,decOut1b,init[10],d_in[10],q_out[10]);
	D_ff_Mem dMem11 (clk,reset,regWrite,decOut1b,init[11],d_in[11],q_out[11]);
	
	D_ff_Mem dMem12 (clk,reset,regWrite,decOut1b,init[12],d_in[12],q_out[12]);
	D_ff_Mem dMem13 (clk,reset,regWrite,decOut1b,init[13],d_in[13],q_out[13]);
	D_ff_Mem dMem14 (clk,reset,regWrite,decOut1b,init[14],d_in[14],q_out[14]);
	D_ff_Mem dMem15 (clk,reset,regWrite,decOut1b,init[15],d_in[15],q_out[15]);
	
endmodule

module data_Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [15:0] dataIn,output [15:0] IR );
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,decOut;
	
	decoder4to16 dec0( pc[3:0], decOut);
	
	register_Mem_data r0(clk,reset,memWrite,decOut[0],16'b100_0000_0000_00000,dataIn,Qout0); 
	//register_Mem_data r0(clk,reset,memWrite,decOut[0],16'b000_0000_0000_00000,dataIn,Qout0);
	register_Mem_data r1(clk,reset,memWrite,decOut[1],16'b000_0000_0000_00001,dataIn,Qout1); 
	register_Mem_data r2(clk,reset,memWrite,decOut[2],16'b000_0000_0000_00010,dataIn,Qout2); 
	register_Mem_data r3(clk,reset,memWrite,decOut[3],16'b000_0000_0000_00011,dataIn,Qout3); 
	
	register_Mem_data r4(clk,reset,memWrite,decOut[4],16'b000_0000_0000_00100,dataIn,Qout4); 
	register_Mem_data r5(clk,reset,memWrite,decOut[5],16'b000_0000_0000_00101,dataIn,Qout5); 
	register_Mem_data r6(clk,reset,memWrite,decOut[6],16'b000_0000_0000_00110,dataIn,Qout6); 
	register_Mem_data r7(clk,reset,memWrite,decOut[7],16'b000_0000_0000_00111,dataIn,Qout7); 
	
	register_Mem_data r8(clk,reset,memWrite,decOut[8],16'b000_0000_0000_01000,dataIn,Qout8); 
	register_Mem_data r9(clk,reset,memWrite,decOut[9],16'b000_0000_0000_01001,dataIn,Qout9); 
	register_Mem_data r10(clk,reset,memWrite,decOut[10],16'b000_0000_0000_01010,dataIn,Qout10);
	register_Mem_data r11(clk,reset,memWrite,decOut[11],16'b000_0000_0000_01011,dataIn,Qout11);
	
	register_Mem_data r12(clk,reset,memWrite,decOut[12],16'b000_0000_0000_01100,dataIn,Qout12);
	register_Mem_data r13(clk,reset,memWrite,decOut[13],16'b000_0000_0000_01101,dataIn,Qout13);
	register_Mem_data r14(clk,reset,memWrite,decOut[14],16'b000_0000_0000_01110,dataIn,Qout14);
	register_Mem_data r15(clk,reset,memWrite,decOut[15],16'b000_0000_0000_01111,dataIn,Qout15);
	
	mux16to1_16bits mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[3:0],IR);
endmodule

//Final Memory - 1 - Instructions with no-ops(Group 1 and Group 2) + Undefined Exception
module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [15:0] IR1, output [15:0] IR2 );
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,temp;
	wire [15:0] decOut;
	decoder4to16 dec0( pc[5:2], decOut);
	//R-type with no-ops
	register_Mem r0(clk,reset,memWrite,decOut[0],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout0); //add $r1,$r0,7 
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b_000_0000_0000_00000_0001111_001_000_101,dataIn,Qout1); //sub $r5,$r0,1
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b000_0000_0000_00000_0001110_111_000_010,dataIn,Qout2); //add $r2, $r0, 7
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b_000_0000_0000_00000_0001111_100_000_011,dataIn,Qout3); //sub $r3,$r0,4
	register_Mem r4(clk,reset,memWrite,decOut[4],32'b_000_0000_0000_00000_00000_00100_001_100,dataIn,Qout4); //shift 4, $r1, $r4
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b000_0000_0000_00000_0001110_001_001_001,dataIn,Qout5); //add 1 to r1
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b000_0000_0000_00000_0100000111_010_101,dataIn,Qout6); //mul $r5, $r5, $r2
	//Group 2 with no-ops
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b01010_01_010_000_100_000_0000_0000_00000,dataIn,Qout7); //lw $r2+$r0->$r4
	register_Mem r8(clk,reset,memWrite,decOut[8],32'b01011_10_000_000_011_000_0000_0000_00000,dataIn,Qout8); //sw $r3 -> $r0, $r0
	//Group 1 Group 2 without hazards
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b01010_01_010_000_111_0001110_011_000_001,dataIn,Qout9); //add r1->r0+3 lw $r7->r0+r2
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b01010_01_010_000_001_0001111_011_010_100,dataIn,Qout10); //sub r4->r2-3 lw r1->r2+r0
	//Exception - Undefined Instruction - to r15
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b000_1111_010_000_100_111_1111_1111_11111,dataIn,Qout11); //lw undefined 
	//Useless
	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 111_1000_0000_01000_000_1110_1110_00001,dataIn,Qout12);	//add jump - 4
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 000_0000_0000_00000000_0000_0000_00000,dataIn,Qout13); //no-op
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b000_0000_0000_00000_000_1110_1110_00001,dataIn,Qout14); //add
	//Exception Target
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b000_0000_0000_00000_0001110_110_000_001,dataIn,Qout15);//add $r1,$r0,6 
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],temp);	
	assign IR1=temp[15:0];
	assign IR2=temp[31:16];
endmodule

/*
//Final memory - 2 Jump to last instruction with add
module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [15:0] IR1, output [15:0] IR2 );
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,temp;
	wire [15:0] decOut;
	decoder4to16 dec0( pc[5:2], decOut);
	//R-type with no-ops
	register_Mem r0(clk,reset,memWrite,decOut[0],32'b11110_00000011110_0001110_111_000_010,dataIn,Qout0); //add $r2,$r0,7 with Jump to 60
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b_000_0000_0000_00000_0001111_001_000_101,dataIn,Qout1); //Jumped over
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b000_0000_0000_00000_0001110_111_000_010,dataIn,Qout2); //Jumped over
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b_000_0000_0000_00000_0001111_100_000_011,dataIn,Qout3); //Jumped over
	register_Mem r4(clk,reset,memWrite,decOut[4],32'b_000_0000_0000_00000_00000_00100_001_100,dataIn,Qout4); //Jumped over
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b000_0000_0000_00000_0001110_001_001_001,dataIn,Qout5); //Jumped over
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b000_0000_0000_00000_0100000111_010_101,dataIn,Qout6); //Jumped over
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b01010_01_010_000_100_000_0000_0000_00000,dataIn,Qout7); //Jumped over
	register_Mem r8(clk,reset,memWrite,decOut[8],32'b01011_10_000_000_011_000_0000_0000_00000,dataIn,Qout8); //Jumped over
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b01010_01_010_000_111_0001110_011_000_001,dataIn,Qout9); //Jumped over
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b01010_01_010_000_001_0001111_011_010_100,dataIn,Qout10); //Jumped over
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b000_1111_010_000_100_111_1111_1111_11111,dataIn,Qout11); //Jumped over
	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 111_1000_0000_01000_000_1110_1110_00001,dataIn,Qout12);	//Jumped over
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 000_0000_0000_00000000_0000_0000_00000,dataIn,Qout13); //Jumped over
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b000_0000_0000_00000_000_1110_1110_00001,dataIn,Qout14); //Jumped over
	//Jump Target
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout15);//add $r1,$r0,7 This gets executed straight away
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],temp);	
	assign IR1=temp[15:0];
	assign IR2=temp[31:16];
endmodule
*/
/*
//Final memory 3 - Load use hazard, Forwarding - MEM and EX, Overflow Exception - Jumping to last instruction
module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [15:0] IR1, output [15:0] IR2 );
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,temp;
	wire [15:0] decOut;
	decoder4to16 dec0( pc[5:2], decOut);
	//Make data memory r0 - 16th bit 1 others 0
	register_Mem r0(clk,reset,memWrite,decOut[0],32'b01010_01_010_000_001_000_0000_0000_00000,dataIn,Qout0); //lw r1
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b00000_00_000_000_000_000_0010_0000_01101,dataIn,Qout1); //Shift r1 by 16 to r5
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b000_0000_0000_00000_0001111_001_101_100,dataIn,Qout2); //r5-1=r4 Overflow Exception
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b_000_0000_0000_00000_0001111_100_000_011,dataIn,Qout3); //Skipped
	register_Mem r4(clk,reset,memWrite,decOut[4],32'b_000_0000_0000_00000_00000_00100_001_100,dataIn,Qout4); //Skipped
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b000_0000_0000_00000_0001110_001_001_001,dataIn,Qout5); //Skipped
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b000_0000_0000_00000_0100000111_010_101,dataIn,Qout6); //Skipped
	//Group 2 with no-ops
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b01010_01_010_000_100_000_0000_0000_00000,dataIn,Qout7); //Skipped
	register_Mem r8(clk,reset,memWrite,decOut[8],32'b01011_10_000_000_011_000_0000_0000_00000,dataIn,Qout8); //Skipped
	//Group 1 Group 2 without hazards
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b01010_01_010_000_111_0001110_011_000_001,dataIn,Qout9); //Skipped
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b01010_01_010_000_001_0001111_011_010_100,dataIn,Qout10); //Skipped
	//Exception - Undefined Instruction - to r15
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b000_1111_010_000_100_111_1111_1111_11111,dataIn,Qout11); //Skipped
	//Useless
	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 111_1000_0000_01000_000_1110_1110_00001,dataIn,Qout12);	//Skipped
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 000_0000_0000_00000000_0000_0000_00000,dataIn,Qout13); //Skipped
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b000_0000_0000_00000_000_1110_1110_00001,dataIn,Qout14); //Skipped
	//Exception Target
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout15);//add $r1,$r0,7 
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],temp);	
	assign IR1=temp[15:0];
	assign IR2=temp[31:16];
endmodule
*/
/*
//Final memory - 4 Load use hazard, Branch stalling, Forwarding - MEM and EX, Overflow Exception - Jumping to last instruction
module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [15:0] IR1, output [15:0] IR2 );
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,temp;
	wire [15:0] decOut;
	decoder4to16 dec0( pc[5:2], decOut);
	//Make data memory r0 - 16th bit 1 others 0
	register_Mem r0(clk,reset,memWrite,decOut[0],32'b01010_01_010_000_001_000_0000_0000_00000,dataIn,Qout0); //lw r1
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b00000_00_000_000_000_000_0010_0000_01101,dataIn,Qout1); //Shift r1 by 16 to r5
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b11011001_00011000_0001111_001_101_100,dataIn,Qout2); //r5-1=r4 Overflow Exception and Branch
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b_000_0000_0000_00000_0001111_100_000_011,dataIn,Qout3); //Skipped
	register_Mem r4(clk,reset,memWrite,decOut[4],32'b_000_0000_0000_00000_00000_00100_001_100,dataIn,Qout4); //Skipped
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b000_0000_0000_00000_0001110_001_001_001,dataIn,Qout5); //Skipped
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b000_0000_0000_00000_0100000111_010_101,dataIn,Qout6); //Skipped
	//Group 2 with no-ops
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b01010_01_010_000_100_000_0000_0000_00000,dataIn,Qout7); //Skipped
	register_Mem r8(clk,reset,memWrite,decOut[8],32'b01011_10_000_000_011_000_0000_0000_00000,dataIn,Qout8); //Skipped
	//Group 1 Group 2 without hazards
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b01010_01_010_000_111_0001110_011_000_001,dataIn,Qout9); //Skipped
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b01010_01_010_000_001_0001111_011_010_100,dataIn,Qout10); //Skipped
	//Exception - Undefined Instruction - to r15
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b000_1111_010_000_100_111_1111_1111_11111,dataIn,Qout11); //Skipped
	//Useless
	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 111_1000_0000_01000_000_1110_1110_00001,dataIn,Qout12);	//Skipped
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 000_0000_0000_00000000_0000_0000_00000,dataIn,Qout13); //Skipped
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b000_0000_0000_00000_000_1110_1110_00001,dataIn,Qout14); //Skipped
	//Exception Target
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout15);//add $r1,$r0,7 
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],temp);	
	assign IR1=temp[15:0];
	assign IR2=temp[31:16];
endmodule
*/
/*
//Final memory - 5, Dependencies, Forwarding, Undefined Exception, Jumping to last instruction, EPC
module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn,output [15:0] IR1, output [15:0] IR2 );
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,temp;
	wire [15:0] decOut;
	decoder4to16 dec0( pc[5:2], decOut);
	//R-type with no-ops
	register_Mem r0(clk,reset,memWrite,decOut[0],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout0); //add $r1,$r0,7 (7)
	register_Mem r1(clk,reset,memWrite,decOut[1],32'b01010_01_001_000_100_0001111_001_001_101,dataIn,Qout1); //sub $r5,$r1,1 (6) lw r1+r0->r4
	register_Mem r2(clk,reset,memWrite,decOut[2],32'b01011_10_000_001_011_0001110_100_100_010,dataIn,Qout2); //add $r2, $r4, 4 (11) sw r1+r0->r3
	register_Mem r3(clk,reset,memWrite,decOut[3],32'b_000_0000_0000_00000_0001111_100_001_011,dataIn,Qout3); //sub $r3,$r1,4
	register_Mem r4(clk,reset,memWrite,decOut[4],32'b_000_0000_0000_00000_00000_00100_001_100,dataIn,Qout4); //shift 4, $r1, $r4
	register_Mem r5(clk,reset,memWrite,decOut[5],32'b000_0000_0000_00000_0001110_001_001_001,dataIn,Qout5); //add 1 to r1
	register_Mem r6(clk,reset,memWrite,decOut[6],32'b000_0000_0000_00000_0100000111_010_001,dataIn,Qout6); //mul $r1, $r1, $r2
	//Group 2 with no-ops
	register_Mem r7(clk,reset,memWrite,decOut[7],32'b01010_01_010_000_100_000_0000_0000_00000,dataIn,Qout7); //lw $r2+$r0->$r4
	register_Mem r8(clk,reset,memWrite,decOut[8],32'b01011_10_000_000_011_000_0000_0000_00000,dataIn,Qout8); //sw $r3 -> $r0, $r0
	//Group 1 Group 2 without hazards
	register_Mem r9(clk,reset,memWrite,decOut[9],32'b01010_01_010_000_111_0001110_011_000_001,dataIn,Qout9); //add r1->r0+3 lw $r7->r0+r2
	register_Mem r10(clk,reset,memWrite,decOut[10],32'b01010_01_010_000_001_0001111_011_010_100,dataIn,Qout10); //sub r4->r2-3 lw r1->r2+r0
	//Exception - Undefined Instruction - to r15
	register_Mem r11(clk,reset,memWrite,decOut[11],32'b000_1111_010_000_100_111_1111_1111_11111,dataIn,Qout11); //lw undefined 
	//Useless
	register_Mem r12(clk,reset,memWrite,decOut[12],32'b 111_1000_0000_01000_000_1110_1110_00001,dataIn,Qout12);	//Skipped
	register_Mem r13(clk,reset,memWrite,decOut[13],32'b 000_0000_0000_00000000_0000_0000_00000,dataIn,Qout13); //Skipped
	register_Mem r14(clk,reset,memWrite,decOut[14],32'b000_0000_0000_00000_000_1110_1110_00001,dataIn,Qout14); //Skipped
	//Exception Target
	register_Mem r15(clk,reset,memWrite,decOut[15],32'b000_0000_0000_00000_0001110_111_000_001,dataIn,Qout15);//add $r1,$r0,7 
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],temp);	
	assign IR1=temp[15:0];
	assign IR2=temp[31:16];
endmodule
*/
module decoder4to16( input [3:0] destReg, output reg [15:0] decOut);
	always @ (destReg)
	begin
	case(destReg)
	4'b0000: decOut=16'b0000000000000001;
	4'b0001: decOut=16'b0000000000000010;
	4'b0010: decOut=16'b0000000000000100;
	4'b0011: decOut=16'b0000000000001000;
	4'b0100: decOut=16'b0000000000010000;
	4'b0101: decOut=16'b0000000000100000;
	4'b0110: decOut=16'b0000000001000000;
	4'b0111: decOut=16'b0000000010000000;
	4'b1000: decOut=16'b0000000100000001;
	4'b1001: decOut=16'b0000001000000000;
	4'b1010: decOut=16'b0000010000000000;
	4'b1011: decOut=16'b0000100000000000;
	4'b1100: decOut=16'b0001000000000000;
	4'b1101: decOut=16'b0010000000000000;
	4'b1110: decOut=16'b0100000000000000;
	4'b1111: decOut=16'b1000000000000000;
	endcase
	end
endmodule
module mux16to1_16bits( input [15:0] outR0,input [15:0] outR1,input [15:0] outR2,input [15:0] outR3,input [15:0] outR4,input [15:0] outR5,input [15:0] outR6,input [15:0] outR7,input [15:0] outR8,input [15:0] outR9,input [15:0] outR10,input [15:0] outR11,input [15:0] outR12,input [15:0] outR13,input [15:0] outR14,input [15:0] outR15, input [3:0] Sel, output reg [15:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	case (Sel)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	endcase
endmodule

module mux16to1( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [31:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	case (Sel)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	endcase
endmodule
//Memory Design ends

//RegFile Design

module D_ff (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=1'b0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) q=d;
	end
endmodule

module D_ff_2 (input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input d1, input d2, output reg	 q);
	always @ (posedge clk)
	begin
	if(reset==1'b1)
		q=1'b0;
	else if(regWrite1 == 1'b1 && decOut1b1==1'b1) 
		q=d1;
	else if(regWrite2 == 1'b1 && decOut1b2==1'b1) 
		q=d2;
	end
endmodule

module register32bit_2( input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR);
	D_ff_2 d0(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[0], writeData2[0], outR[0]);
	D_ff_2 d1(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[1], writeData2[1], outR[1]);
	D_ff_2 d2(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[2], writeData2[2], outR[2]);
	D_ff_2 d3(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[3], writeData2[3], outR[3]);
	D_ff_2 d4(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[4], writeData2[4], outR[4]);
	D_ff_2 d5(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[5], writeData2[5], outR[5]);
	D_ff_2 d6(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[6], writeData2[6], outR[6]);
	D_ff_2 d7(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[7], writeData2[7], outR[7]);
	D_ff_2 d8(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[8], writeData2[8], outR[8]);
	D_ff_2 d9(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[9], writeData2[9], outR[9]);
	D_ff_2 d10(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[10], writeData2[10], outR[10]);
	D_ff_2 d11(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[11], writeData2[11], outR[11]);
	D_ff_2 d12(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[12], writeData2[12], outR[12]);
	D_ff_2 d13(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[13], writeData2[13], outR[13]);
	D_ff_2 d14(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[14], writeData2[14], outR[14]);
	D_ff_2 d15(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[15], writeData2[15], outR[15]);
	D_ff_2 d16(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[16], writeData2[16], outR[16]);
	D_ff_2 d17(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[17], writeData2[17], outR[17]);
	D_ff_2 d18(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[18], writeData2[18], outR[18]);
	D_ff_2 d19(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[19], writeData2[19], outR[19]);
	D_ff_2 d20(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[20], writeData2[20], outR[20]);
	D_ff_2 d21(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[21], writeData2[21], outR[21]);
	D_ff_2 d22(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[22], writeData2[22], outR[22]);
	D_ff_2 d23(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[23], writeData2[23], outR[23]);
	D_ff_2 d24(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[24], writeData2[24], outR[24]);
	D_ff_2 d25(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[25], writeData2[25], outR[25]);
	D_ff_2 d26(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[26], writeData2[26], outR[26]);
	D_ff_2 d27(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[27], writeData2[27], outR[27]);
	D_ff_2 d28(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[28], writeData2[28], outR[28]);
	D_ff_2 d29(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[29], writeData2[29], outR[29]);
	D_ff_2 d30(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[30], writeData2[30], outR[30]);
	D_ff_2 d31(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[31], writeData2[31], outR[31]);
endmodule		

module register32bit( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output [31:0] outR);
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
endmodule		

module registerSet( input clk, input reset, input regWrite1, input regWrite2, input [7:0] decOut1, input [7:0] decOut2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR0, output [31:0] outR1, output [31:0] outR2, output [31:0] outR3, output [31:0] outR4, output [31:0] outR5, output [31:0] outR6, output [31:0] outR7);
	register32bit_2 r0 (clk, reset, 1'b0, 1'b0, decOut1[0], decOut2[0],  writeData1 ,writeData2, outR0);
	register32bit_2 r1 (clk, reset, regWrite1, regWrite2, decOut1[1], decOut2[1], writeData1 , writeData2, outR1 );
	register32bit_2 r2 (clk, reset, regWrite1, regWrite2, decOut1[2], decOut2[2], writeData1 , writeData2 , outR2 );
	register32bit_2 r3 (clk, reset, regWrite1, regWrite2, decOut1[3], decOut2[3], writeData1 , writeData2 , outR3 );
	register32bit_2 r4 (clk, reset, regWrite1, regWrite2, decOut1[4], decOut2[4], writeData1 , writeData2 , outR4 );
	register32bit_2 r5 (clk, reset, regWrite1, regWrite2, decOut1[5], decOut2[5], writeData1 , writeData2 , outR5 );
	register32bit_2 r6 (clk, reset, regWrite1, regWrite2, decOut1[6], decOut2[6], writeData1 , writeData2 , outR6 );
	register32bit_2 r7 (clk, reset, regWrite1, regWrite2, decOut1[7], decOut2[7], writeData1 , writeData2 , outR7 );
endmodule

module decoder3to8( input [2:0] destReg, output reg [7:0] decOut);
	always @ (destReg)
	begin
	case(destReg)
	3'b000: decOut=8'b00000001;
	3'b001: decOut=8'b00000010;
	3'b010: decOut=8'b00000100;
	3'b011: decOut=8'b00001000;
	3'b100: decOut=8'b00010000;
	3'b101: decOut=8'b00100000;
	3'b110: decOut=8'b01000000;
	3'b111: decOut=8'b10000000;
	endcase
	end
endmodule

module mux8to1( input [31:0] outR0, input [31:0] outR1,input [31:0]outR2, input [31:0] outR3, input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7, input [2:0] Sel, output reg [31:0] outBus );
	always @ (outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or Sel)
	begin
	case(Sel)
	3'b000: outBus=outR0;
	3'b001: outBus=outR1;
	3'b010: outBus=outR2;
	3'b011: outBus=outR3;
	3'b100: outBus=outR4;
	3'b101: outBus=outR5;
	3'b110: outBus=outR6;
	3'b111: outBus=outR7;
	endcase
	end
endmodule

module registerFile(input clk, input reset, input regWrite1, input regWrite2, input [2:0] srcRegA1, input [2:0] srcRegB1, input [2:0] srcRegC1, input [2:0] destReg1, input [2:0] srcRegA2, input [2:0] srcRegB2, 
	input [2:0] srcRegC2, input [2:0] destReg2, input [31:0] writeData1,input [31:0] writeData2, output [31:0] outBusA1, output [31:0] outBusB1, output [31:0] outBusC1, output [31:0] outBusA2, output [31:0] outBusB2, output [31:0] outBusC2);
	wire [7:0] decOut1, decOut2;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	//For instr1
	decoder3to8 d0(destReg1,decOut1);
	decoder3to8 d1(destReg2,decOut2);
	registerSet rSet (clk, reset, regWrite1, regWrite2, decOut1, decOut2, writeData1, writeData2, outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);
	mux8to1 m01(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegA1,outBusA1);
	mux8to1 m02(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegB1,outBusB1);
	mux8to1 m03(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegC1,outBusC1);
	mux8to1 m11(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegA2,outBusA2);
	mux8to1 m12(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegB2,outBusB2);
	mux8to1 m13(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,srcRegC2,outBusC2);
endmodule	
//Register File Design Ends
	
module register4bit( input clk, input reset, input regWrite, input decOut1b, input [3:0] writeData, output  [3:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
endmodule

module register1bit( input clk, input reset, input regWrite, input decOut1b, input writeData, output outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule

module register2bit( input clk, input reset, input regWrite, input decOut1b, input [1:0]writeData, output [1:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
endmodule

module register16bit( input clk, input reset, input regWrite, input decOut1b, input [15:0]writeData, output [15:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
endmodule

module register3bit( input clk, input reset, input regWrite, input decOut1b, input [2:0]writeData, output [2:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule

module register5bit( input clk, input reset, input regWrite, input decOut1b, input [4:0]writeData, output [4:0] outR ); //ADDED
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
endmodule


module adder32(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always @ (in1 or in2)
	begin
		adder_out=in1 + in2;
	end
endmodule	

module adder16(input [15:0] in1, input [15:0] in2, output reg [15:0] adder_out);
	always @ (in1 or in2)
	begin
		adder_out=in1 + in2;
	end
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



module mux4to1_16bits(input [15:0] in1, input [15:0] in2, input [15:0] in3, input [15:0] in4, input[1:0] sel, output reg [15:0] muxout);
	always@(in1 or in2 or in3 or in4 or sel)
	begin
	case(sel)
		2'b00: muxout = in1;
		2'b01: muxout = in2;
		2'b10: muxout = in3;
		2'b11: muxout = in4;
	endcase
	end
endmodule

module mux4to1_32bits(input [31:0] in1, input [31:0] in2, input [31:0] in3, input[1:0] sel, output reg [31:0] muxout);
	always@(in1 or in2 or in3 or sel)
	begin
	case(sel)
		2'b00: muxout = in1;
		2'b01: muxout = in2;
		2'b10: muxout = in3;
	endcase
	end
endmodule
module mux4to1_32bits1(input [31:0] in1, input [31:0] in2, input [31:0] in3, input [31:0] in4, input[1:0] sel, output reg [31:0] muxout);
	always@(in1 or in2 or in3 or in4 or sel)
	begin
	case(sel)
		2'b00: muxout = in1;
		2'b01: muxout = in2;
		2'b10: muxout = in3;
		3'b11: muxout = in4;
	endcase
	end
endmodule
module mux2to1_32bits(input [31:0] in1, input [31:0] in2, input sel, output reg [31:0] muxout);
  always@(in1 or in2 or sel)
  begin
	case(sel)
		1'b0: muxout = in1;
		1'b1: muxout = in2;
	endcase
	end
endmodule
module mux2to1_2bits(input [1:0] in1, input [1:0] in2, input sel, output reg [1:0] muxout);
  always@(in1 or in2 or sel)
  begin
	case(sel)
		1'b0: muxout = in1;
		1'b1: muxout = in2;
	endcase
	end
endmodule

module mux2to1_1bit(input in1, input in2, input sel, output reg muxout);
  always@(in1 or in2 or sel)
  begin
	case(sel)
		1'b0: muxout = in1;
		1'b1: muxout = in2;
	endcase
	end
endmodule
module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, input negativeFlag_input, input carryFlag_input, input overflowFlag_input, input zeroFlag_input, input flagWrite, output reg [31:0] aluOut1, output reg negativeFlag, output reg carryFlag, output reg overflowFlag, output reg zeroFlag);
	always @ (aluIn1 or aluIn2 or aluOp)
	begin
		negativeFlag =negativeFlag_input;
		carryFlag = carryFlag_input;
		overflowFlag = overflowFlag_input;
		zeroFlag = zeroFlag_input;
		case(aluOp)
		2'b00:
		begin
			{carryFlag,aluOut1}=aluIn1+aluIn2;
			negativeFlag = aluOut1[31];
			if (aluOut1==32'd0)
				zeroFlag = 1'b1;
			else
				zeroFlag = 1'b0;
			if (aluIn1[31]==1'b0 && aluIn2[31]==1'b0 && aluOut1[31]==1'b1)
				overflowFlag=1'b1;
			else if (aluIn1[31]==1'b1 && aluIn2[31]==1'b1 && aluOut1[31]==1'b0)
				overflowFlag=1'b1;
			else
				overflowFlag=1'b0;
		end
		2'b01:
		begin
			{carryFlag,aluOut1}=aluIn1-aluIn2;
			negativeFlag = aluOut1[31];
			if (aluOut1==32'd0)
				zeroFlag=1'b1;
			else
				zeroFlag=1'b0;
			if(aluIn1[31]==1'b0 && aluIn2[31]==1'b1 && aluOut1[31]==1'b1)
				overflowFlag=1'b1;
			else if (aluIn1[31]==1'b1 && aluIn2[31]==1'b0 && aluOut1[31]==1'b0)
				overflowFlag=1'b1;
			else
				overflowFlag=1'b0;
		end
		2'b10:
		begin
			aluOut1=aluIn1*aluIn2;
			negativeFlag=aluOut1[31];
			if(aluOut1==32'd0)
				zeroFlag=1'b1;
			else
				zeroFlag=1'b0;
		end
		2'b11:
		begin
			{carryFlag, aluOut1} = aluIn1<<aluIn2;
			negativeFlag=aluOut1[31];
			if (aluOut1==32'd0)
				zeroFlag=1'b1;
			else
				zeroFlag=1'b0;
		end
		endcase
		if(flagWrite==0)
		begin
			negativeFlag =negativeFlag_input;
			carryFlag = carryFlag_input;
			overflowFlag = overflowFlag_input;
			zeroFlag = zeroFlag_input;
		end
	end
endmodule

module IF_ID(input clk, input reset,input pregWrite, input IF_Flush, input decOut1b, input [47:0] pc, input [31:0] instr1, input [15:0] instr2, output [31:0] p0_instr1, output [15:0] p0_instr2, output [47:0] p0_pc);
	register16bit reginstr1( clk, reset | IF_Flush, pregWrite, decOut1b, instr1, p0_instr1 );
	register16bit reginstr2( clk, reset | IF_Flush, pregWrite, decOut1b, instr2, p0_instr2 );
	register32bit regpc( clk, reset | IF_Flush, pregWrite, decOut1b, pc, p0_pc );
endmodule

module ID_EX(input clk, input reset,input ID_Flush, input flagWrite, input p2_overflowFlag, input reg_negativeFlag, input reg_carryFlag, input reg_overflowFlag, input reg_zeroFlag, input [2:0] rm1, input [2:0] rn1, input [2:0] rm2, input [2:0] rn2, input [31:0] reg_rm1,input [31:0] reg_rn1, input [31:0] reg_rd1, input [2:0] rd1, input [31:0] reg_rm2, input [31:0] reg_rn2, input [31:0] reg_rd2, input [2:0] rd2,
	input [31:0] p0_pc, input EPCWrite, input CauseWrite, input [1:0] aluSrcB, input memRead, input memWrite, input regWrite1, input regWrite2, input [1:0] aluOp, input [31:0] shiftimm, input[31:0] aluimm, input [4:0] opcode1, input [4:0] opcode2, output p1_negativeFlag, output p1_carryFlag, output p1_overflowFlag, output p1_zeroFlag,
	output [2:0] p1_rm1, output [2:0] p1_rn1, output [2:0] p1_rm2, output [2:0] p1_rn2, output [31:0] p1_reg_rm1, output [31:0] p1_reg_rn1, output [31:0] p1_reg_rd1, output [2:0] p1_rd1, output [31:0] p1_reg_rm2, output [31:0] p1_reg_rn2, output [31:0] p1_reg_rd2, output [2:0] p1_rd2,
	output [31:0] p1_pc, output p1_EPCWrite, output p1_CauseWrite, output [1:0] p1_aluSrcB, output p1_memRead, output p1_memWrite, output p1_regWrite1, output p1_regWrite2, output [1:0] p1_aluOp,
	output [31:0] p1_shiftimm, output [31:0] p1_aluimm, output [4:0] p1_opcode1, output [4:0] p1_opcode2, output p1_p2_overflowPast, output p1_flagWrite);
	
	wire pregWrite, decOut1b = 1'b1;
	register3bit regrm1( clk, reset | ID_Flush, pregWrite, decOut1b, rm1, p1_rm1 );
	register3bit regrn1( clk, reset | ID_Flush, pregWrite, decOut1b, rn1, p1_rn1 );
	register3bit regrd1( clk, reset | ID_Flush, pregWrite, decOut1b, rd1, p1_rd1 );
	register3bit regrm2( clk, reset | ID_Flush, pregWrite, decOut1b, rm2, p1_rm2 );
	register3bit regrn2( clk, reset | ID_Flush, pregWrite, decOut1b, rn2, p1_rn2 );
	register3bit regrd2( clk, reset | ID_Flush, pregWrite, decOut1b, rd2, p1_rd2 );

	register32bit regregrm1( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rm1, p1_reg_rm1 );
	register32bit regregrm2( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rm2, p1_reg_rm2 );
	register32bit regregrn1( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rn1, p1_reg_rn1 );
	register32bit regregrn2( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rn2, p1_reg_rn2 );
	register32bit regregrd1( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rd1, p1_reg_rd1 );
	register32bit regregrd2( clk, reset | ID_Flush, pregWrite, decOut1b, reg_rd2, p1_reg_rd2 );
	register1bit flagWrite_reg(clk, reset, pregWrite, decOut1b, flagWrite, p1_flagWrite);
	register32bit regpc( clk, reset, pregWrite, decOut1b, p0_pc, p1_pc );
	register32bit regshiftimm( clk, reset | ID_Flush, pregWrite, decOut1b, shiftimm, p1_shiftimm );
	register32bit regaluimm( clk, reset | ID_Flush, pregWrite, decOut1b, aluimm, p1_aluimm );
	register1bit overflowPast_reg(clk, reset, pregWrite, decOut1b, p2_overflowFlag, p1_p2_overflowPast);
	register2bit regalusrcb( clk, reset | ID_Flush, pregWrite, decOut1b, aluSrcB, p1_aluSrcB );
	register1bit regmemread( clk, reset | ID_Flush, pregWrite, decOut1b, memRead, p1_memRead );
	register1bit regmemwrite( clk, reset | ID_Flush, pregWrite, decOut1b, memWrite, p1_memWrite );
	register1bit regregwrite1( clk, reset | ID_Flush, pregWrite, decOut1b, regWrite1, p1_regWrite1 );
	register1bit regregwrite2( clk, reset | ID_Flush, pregWrite, decOut1b, regWrite2, p1_regWrite2 );
	register2bit regaluOp (clk, reset | ID_Flush, pregWrite, decOut1b, aluOp, p1_aluOp); 
	register1bit EPC(clk, reset, pregWrite, decOut1b, EPCWrite, p1_EPCWrite); 
	register1bit Cause(clk, reset, pregWrite, decOut1b, CauseWrite, p1_CauseWrite); 
	register1bit negativeFlag_reg(clk, reset | ID_Flush, pregWrite, decOut1b, reg_negativeFlag, p1_negativeFlag); 
	register1bit carryFlag_reg(clk, reset | ID_Flush, pregWrite, decOut1b, reg_carryFlag, p1_carryFlag); 
	register1bit overflowFlag_reg(clk, reset | ID_Flush, pregWrite, decOut1b, reg_overflowFlag, p1_overflowFlag); 
	register1bit zeroFlag_reg(clk, reset | ID_Flush, pregWrite, decOut1b, reg_zeroFlag, p1_zeroFlag); 
	
	register5bit opcode1_reg(clk, reset | ID_Flush, pregWrite, decOut1b, opcode1, p1_opcode1);
	register5bit opcode2_reg(clk, reset | ID_Flush, pregWrite, decOut1b, opcode2, p1_opcode2);
endmodule
	
module EX_MEM(input clk, input reset,input pregWrite, input EX_Flush, input decOut1b, input p1_flagWrite, input [31:0] p1_pc, input alu_shift_negativeFlag, input alu_shift_carryFlag, input alu_shift_overflowFlag, input alu_shift_zeroFlag,
	input [31:0] aluout,input [31:0] adderout, input [31:0] p1_reg_rd2, input [2:0] p1_rd1,input [2:0] p1_rd2, input p1_memWrite,input p1_memRead, input p1_regWrite1, input p1_regWrite2, output [31:0] p2_pc,
	output p2_negativeFlag, output p2_carryFlag, output p2_overflowFlag, output p2_zeroFlag, output [31:0] p2_aluout,output [31:0] p2_adderout, output [31:0] p2_reg_rd2, output [2:0] p2_rd1,output [2:0] p2_rd2, output p2_memWrite,output p2_memRead, output p2_regWrite1, output p2_regWrite2, output p2_flagWrite);
	
	register32bit regaluout( clk, reset | EX_Flush, pregWrite, decOut1b, aluout, p2_aluout );
	register32bit regadderout( clk, reset | EX_Flush, pregWrite, decOut1b, adderout, p2_adderout );
	register32bit regmemData(clk, reset | EX_Flush, pregWrite, decOut1b, p1_reg_rd2, p2_reg_rd2);
	register3bit reg2rd1( clk, reset | EX_Flush, pregWrite, decOut1b, p1_rd1, p2_rd1 );
	register3bit reg2rd2( clk, reset | EX_Flush, pregWrite, decOut1b, p1_rd2, p2_rd2 );
	register1bit reg2memwrite( clk, reset | EX_Flush, pregWrite, decOut1b, p1_memWrite, p2_memWrite );
	register1bit reg2memread( clk, reset | EX_Flush, pregWrite, decOut1b, p1_memRead, p2_memRead );
	register1bit reg2regwrite1( clk, reset | EX_Flush, pregWrite, decOut1b, p1_regWrite1, p2_regWrite1 );
	register1bit reg2regwrite2( clk, reset | EX_Flush, pregWrite, decOut1b, p1_regWrite2, p2_regWrite2 );
	register1bit flagWrite_reg(clk, reset, pregWrite, decOut1b, p1_flagWrite, p2_flagWrite); 
	register32bit pc_forward(clk, reset, pregWrite, decOut1b, p1_pc, p2_pc);

	register1bit negativeFlag_reg(clk, reset | EX_Flush, pregWrite, decOut1b, alu_shift_negativeFlag, p2_negativeFlag);
	register1bit carryFlag_reg(clk, reset | EX_Flush, pregWrite, decOut1b, alu_shift_carryFlag, p2_carryFlag);
	register1bit overflowFlag_reg(clk, reset | EX_Flush, pregWrite, decOut1b, alu_shift_overflowFlag, p2_overflowFlag);
	register1bit zeroFlag_reg(clk, reset | EX_Flush, pregWrite, decOut1b, alu_shift_zeroFlag, p2_zeroFlag);
endmodule

module MEM_WB(input clk, input reset,input pregWrite, input MEM_Flush, input decOut1b, input p2_flagWrite, input p2_negativeFlag, input p2_carryFlag, input p2_overflowFlag, input p2_zeroFlag, input [31:0] p2_aluout,input [15:0] memout, input [2:0] p2_rd1,input [2:0] p2_rd2,
	input p2_regWrite1, input p2_regWrite2, output p3_negativeFlag, output p3_carryFlag, output p3_overflowFlag, output p3_zeroFlag, output [31:0] p3_aluout, output [2:0] p3_rd1,output [15:0] p3_memOut, output [2:0] p3_rd2,
	output p3_regWrite1, output p3_regWrite2, output p3_flagWrite);
	
	register32bit regaluout3( clk, reset | MEM_Flush, pregWrite, decOut1b, p2_aluout, p3_aluout );
	register3bit regrd13( clk, reset | MEM_Flush, pregWrite, decOut1b, p2_rd1, p3_rd1 );
	register3bit regrd23( clk, reset | MEM_Flush, pregWrite, decOut1b, p2_rd2, p3_rd2 );	
	register1bit reg3regwrite1( clk, reset | MEM_Flush, pregWrite, decOut1b, p2_regWrite1, p3_regWrite1 );
	register1bit reg3regwrite2( clk, reset | MEM_Flush, pregWrite, decOut1b, p2_regWrite2, p3_regWrite2 );
	register16bit regmemout( clk, reset | MEM_Flush, pregWrite, decOut1b, memout, p3_memOut );
	register1bit flagWrite_reg(clk, reset, pregWrite, decOut1b, p2_flagWrite, p3_flagWrite); 
	register1bit negativeFlag_reg(clk, reset | MEM_Flush, pregWrite, decOut1b, p2_negativeFlag, p3_negativeFlag); //added
	register1bit carryFlag_reg(clk, reset | MEM_Flush, pregWrite, decOut1b, p2_carryFlag, p3_carryFlag);
	register1bit overflowFlag_reg(clk, reset | MEM_Flush, pregWrite, decOut1b, p2_overflowFlag, p3_overflowFlag);
	register1bit zeroFlag_reg(clk, reset | MEM_Flush, pregWrite, decOut1b, p2_zeroFlag, p3_zeroFlag);
	
endmodule

//module hazard takes care of two cases. One is lw problem (Mem/Ex hazard). The other is when branch instruction is present 
module hazard( input p1_memread, input p1_regwrite, p1_regdestc, input src1, input src2, input src3,
			output reg id_ex_controlvalue, output reg pc_write, output reg if_id_write);
	always @ (p1_memread or p1_regwrite or src1 or src2 or src3)
	begin
			if (p1_memread == 1'b1 && p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest)
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
	end
endmodule

module forwarding(input p2_regwr1, input p2_regwr2, input [4:0] p0_rs1,input [4:0] p0_rs2,input [4:0] p0_rsc,input p3_regwr, input p3_regwrc,input [4:0] p3_regdest,input [4:0] p3_regdestc, input p3_memwr, input [4:0] p2_regdest,input [4:0] p2_regdestc,output reg [2:0]fwd1, output reg [2:0] fwd2);
	always@(p2_regwr1, p2_regwr2, p0_rs1, p0_rs2, p0_rsc, p3_regwr1, p3_regwr2, p3_regdest, p3_regdestc, p3_memwr, p2_regdest, p2_regdestc,  
	p2_memwr)
	begin


		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rs1)
		fwd1 = 3'b001;
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rs1)
		fwd1 = 3'b010;
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		fwd1 = 3'b011;
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		fwd1 = 3'b011;	
		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rs1)
		fwd1 = 3'b100;
		else
		fwd1 = 3'b000;

		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rs2)
		fwd2 = 3'b001;
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rs2)
		fwd2 = 3'b010;
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs2)
		fwd2 = 3'b011;
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs2)
		fwd2 = 3'b011;	
		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rs2)
		fwd2 = 3'b100;
		else
		fwd2 = 3'b000;

		if(p2_regwr==1'b1 && p2_regdest!=5'b0 && p2_regdest == p0_rsc)
		fwd3 = 3'b001;
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rsc)
		fwd3 = 3'b010;
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		fwd3 = 3'b011;
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		fwd3 = 3'b011;	
		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rsc)
		fwd3 = 3'b100;
		else
		fwd3 = 3'b000;

	end	
endmodule

module ctrlCkt	(input [9:0] opcode1, input [9:0] opcode2 , input p2_overflowFlag, output reg [1:0] aluSrcB, output reg memRead, output reg memWrite, output reg regWrite1, 
					output reg regWrite2, output reg [1:0] aluOp, output reg [1:0] PCSource, output reg CauseWrite, output reg  EPCWrite, output reg IF_Flush, output reg ID_Flush, output reg EX_Flush, output reg MEM_Flush, output reg flagWrite);
	reg a,b;
	always @ (opcode1 or opcode2 or p2_overflowFlag)
	begin
		CauseWrite=1'b0; 
		EPCWrite=1'b0;
		a=1'b0;
		b=1'b0;
		IF_Flush=0;
		ID_Flush=0;
		EX_Flush=0;
		MEM_Flush=0;
		flagWrite=1;
		if(opcode1[9:0]==10'd0)
		begin
			aluSrcB=2'b00; 
			aluOp=2'b00; 
			regWrite1=1'b0;
			flagWrite=0;
		end
		else if(opcode1[9:3]==7'b0001110) //ADD instr
		begin
			aluSrcB=2'b00; //selecting add/sub immediate value instr[8:6]
			regWrite1=1'b1;
			aluOp=2'b00; //addition
		end
		else if(opcode1[9:3]==7'b0001111) //SUB instr
		begin
			aluSrcB=2'b00; //selecting immediate value instr[8:6]
			regWrite1=1'b1;
			aluOp=2'b01; //subtraction
		end
		else if(opcode1[9:0]==10'b0100000111) //MUL instr
		begin
			aluSrcB=2'b10; //selecting reg_rd1
			regWrite1=1'b1;
			aluOp=2'b10;
		end
		else if(opcode1[9:5]==5'b00000) //SHIFT instr
		begin
			aluSrcB=2'b01; //selecting shift immediate value instr[10:6]
			aluOp=2'b11; 
			regWrite1=1'b1;
		end
		else 
		begin
			a=1'b1;
		end
		if(a==1'b0)
		begin
		if(opcode2[9:3]==7'b0101001) //Load instr
		begin
			memRead=1'b1;
			memWrite=1'b0;
			regWrite2=1'b1;
			PCSource=2'b00; //PC+4
		end
		else if(opcode2[9:3]==7'b0101110) //Store instr
		begin
			memRead=1'b0;
			memWrite=1'b1;
			regWrite2=1'b0;
			PCSource=2'b00; //PC+4
		end
		else if(opcode2[9:5]==5'b11110) //Jump instr
		begin
			memRead=1'b0; //Don't care
			memWrite=1'b0; //Don't care
			regWrite2=1'b0; //Don't care
			PCSource=2'b01; //1 to select jump instr
			IF_Flush=1;
		end
		else if(opcode2[9:2]==8'b11011001) //Branch instr
		begin
			memRead=1'b0; //Don't care						
			memWrite=1'b0; //Don't care
			regWrite2=1'b0; //Don't care
			PCSource = 2'b00;
			if(p2_overflowFlag==1)
			begin
				IF_Flush=1;
				PCSource=2'b10; //2 to select branch instr
			end
			
		end
		else if(opcode2[9:2]==8'd0)
		begin
			memRead=1'b0; //Don't care						
			memWrite=1'b0; //Don't care
			regWrite2=1'b0; //Don't care
			PCSource = 2'b00;
		end
		else
		begin 
			b=1'b1;
		end
		end
		if(a==1'b1 || b==1'b1)
		begin
			if(p2_overflowFlag == 1)
				EX_Flush = 1;
			CauseWrite=1'b1;
			EPCWrite=1'b1;
			IF_Flush=1;
			ID_Flush=1;
			PCSource = 2'b11;
		end
		if(p2_overflowFlag == 1)
		begin
			EX_Flush = 1;
			CauseWrite=1'b1;
			EPCWrite=1'b1;
			IF_Flush=1;
			MEM_Flush=1;
			ID_Flush=1;
			PCSource = 2'b11;
		end
	end
endmodule

module compare (input [31:0] Result2, input p3_zeroFlag, input p3_negativeFlag, output reg p3_zeroFlag1, output reg p3_negativeFlag1);
always @ (Result2 or p3_zeroFlag or p3_negativeFlag)
begin
	if(Result2==32'd0)
		p3_zeroFlag1=1'd1;
	else
		p3_zeroFlag1=p3_zeroFlag;
	p3_negativeFlag1 = p3_negativeFlag | Result2[31];
end
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
register32bit pc_Reg(clk, reset, PCWrite, 1'b1, PC_MuxOut, PC_Out);
adder32 pc_Adder(PC_Out, 32'd4, PC_AdderOut);
mux4to1_32bits1 mux(PC_AdderOut,{p0_pc[31:12],jump_pc}, branch_pc, 32'd60, PCSource, PC_MuxOut);
Mem IM_Call(clk, reset, 1'b0, 1'b1, PC_Out, 32'd0, instr1, instr2);

mux4to1_32bit mux_pc(pc_adderOut, PC1, PC2, 32'd60, pc_in_sel, pc_final); 
register32bit_n PC( clk, reset, pc_write, 1'b1, pc_final, pcOut );

IF_ID p0_call(clk, reset, IF_ID_write, IF_Flush, 1'b1, PC_AdderOut, instr1, instr2, p0_instr1, p0_instr2, p0_pc); 


signExt5to32 s1 (p0_instr1[24:20], shift_amt_32);
signExt12to32 s2 (p0_instr1[31:20], sign_ext_12_Itype);
signExt13to32 s3 ({p0_instr1[31:20], 1'b0}, sign_ext_13);
signExt12to32 s4 ({p0_instr1[31:25], p0_instr1[11:7]}, sign_ext_12_Stype);
signExt18to32 s5 ({{p0_instr2[12], p0_instr2[6:2]}, 12'b0}, sign_ext_18);
signExt8to32 s6 ({p0_instr2[12],p0_instr2[6:5],p0_instr2[2],p0_instr2[11:10], p0_instr2[4:3]}, branch_address);

registerFile rf_call(clk, reset, p3_regWrite1, p3_regWrite2, p0_instr1[19:15], p0_instr1[24:20], p0_instr2[9:7], p0_instr2[8:6], p0_instr2[5:3], p0_instr2[2:0],
	p3_rd2, Result1, Result2, reg_rm1, p0_reg_rs1, p0_reg_rs2, p0_reg_rs_c, p0_reg_rn2, p0_reg_rd2);	//yso much shit here

adder32 branch_adder(adder_branch_input, p0_pc, branch_pc);

comparator c1 (p0_rsc, 32'b0, flag); // flag = 1'b1 means result of comaprator was true

and a (to_pc_se_pehle_mux, branch, branch_comparator); // branch comes from control ckt this signal is just for seeing if branch is required and ifflush will be made = this signal


  ctrlCkt Ctrlckt( p0_intr[22:16], p0_instr[30:28], pc_in, regwrite,  
  jump, aluOp, memwrite, IF_Flush, regread, memtoreg, aluSrcb);	// overflow flag not kept add_shoft_bar not kept epcwrite1 causewrite2 exception regread added aluSrcb added

  ctrlCktcompressed Ctrlckr (p0_instr[1:0], p0_instr[15:13], pc_inc regwritec, branchc, memread, IF_Flushc, regread, memtoregc, addersrcA, addersrcB, regdestc ) //adderssrcA and B added  pc_incompressed added


   mux2to1_1bit ctrl_mux_1(regwrite, 1'b0, hd_stall , mux_regwrite);
 	mux2to1_1bit ctrl_mux_2(pcwrite, 1'b0, hd_stall , mux_pcwrite);
   mux2to1_1bit ctrl_mux_3(memwrite, 1'b0, hd_stall , mux_memwrite);
   mux2to1_1bit ctrl_mux_4(regwritec, 1'b0, hd_stall , mux_regwritec);
   mux2to1_1bit ctrl_mux_5(pcwrite_c, 1'b0, hd_stall , mux_regwritec);

    mux2to1_32bit branch_mux(p0_pc, bvalue, branch_comparator , PC1); 
     
 
ID_EX p1_call(clk,reset, 1'b1, 1'b1, all control signals,p0_pc, p1_pc, topcsepehlemux, p0_rs1, p1_rs1, p0_rs2, p1_rs2, p0_rs3, p1_rs3, p0_instr[27:23], p1_regdest, p1_instr[11:7], p1_regdestc1, p0_instr[4:2], p1_regdestc2,shift_amt_32,p1_shift_amt_32, sign_ext_12_Itype,p1_sign_ext_12_Itype, sign_ext_13,p1_sign_ext_13,sign_ext_12_Stype,p1_sign_ext_12_Stype,sign_ext_18,p1_sign_ext_18,p0_instr[35:31],p0_instr[40:36],p1_instr_rs1,p1_instr_rs2,p0_instr[4:2], p1_instr_rsc, branch_address, p1_branch_address, {15'b0,p0_instr[6:2],2'b0}, p1_concat, p1_to_pc_se_pehle_mux);			//instr_rs means the actual bits not reg(rs)


mux8to1 alusrca (p1_rs1, p3_aluout, p3_adderout, p2_aluout, p2_adderout, wb_out, wb_outc, alusrca, 32'b0, aluIn1); 

mux8to1 m1 (p1_rs2, p3_aluout, p3_adderout, p2_aluout, p2_adderout, wb_out, wb_outc, alusrca, 32'b0, temp); 
assign p1_rs2 = temp;
mux4to1 m2 	(temp, p1_shift_amt_32,p1_sign_ext_12_Itype, p1_sign_ext_13, p1_sign_ext_12_Stype, 32'b0, 32'b0, 32'b0, signal, aluIn2);


mux8to1_32bits1 Forward1  (p1_rs1, p2_adderout, p2_adderout, p3_someout, p3_someout1, alu_in1);		// some_out1 some_out2
mux8to1_32bits1 Forward2  (p1_rs2, p2_adderout, p2_adderout, p3_someout, p3_someout1, alu_in2_temp);
mux8to1_32bits1 Forward3  (p1_rsc, p2_adderout, p2_adderout, p3_someout, p3_someout1, adder_in1_temp);
mux2to1_32bits  obj        (adder_in1_temp, p1_pc, branchc, adder_in1);
mux8to1_32bits  lastmuxbeforealu (alu_in2_temp, p1_shift_amt_32, sign_ext_12_Itype, p1_sign_ext_12_Stype, p1_sign_ext_13, 32'b0, 32'b0, 32'b0, alu_in2);
mux2to1_32bits  obj1       (p1_branch_address, p1_concat, adder_in2);			// the last mux before adder uses branch address and CLW instruction ka 2nd input




forwarding forw (p2_regwr1, p2_regwr2, p1_rs1, p1_rs2, p1_rs3, p3_regwr1, p3_regwr2, p2_regdest1, p2_regdest2, p3_regdest1, p3_regdest2, p2_memwr1, p2_memwr2, p3_memwr1, p3_memwr2);


alu ALU_call(alu_in1, aluIn2, p1_aluOp, p1_negativeFlag, p1_carryFlag, p1_overflowFlag, p1_zeroFlag, p1_flagWrite, aluOut1, alu_negativeFlag, alu_carryFlag, alu_overflowFlag, alu_zeroFlag); 


mux2to1 compressed_1st_input (p1_pc, p1_rsc, control , adder_in_1);
mux2to1 compressed_2nd_input (p1_concat, p1_branch_address, adder_in_2);

adder32 Adder_instr2_call(adder_in_1, adder_in_2,  adderOut_instr2);




mux2to1 reg_dest_c (p1_regdestc1, p1_regdestc2, control, p1_regdestc);

EX_MEM ex_mem(clk, reset, 1'b1, 1'b1, p1_regWrite1, p1_regWrite2, p1_memRead, p1_memWrite,
  adder_out, aluOut,   p1_regdest, p1_regdestc, p1_rs2, p1_sign_ext_18,
	p2_regWrite1, p2_regWrite2, p2_memRead, p2_memWrite, 
	p2_adderOut, p2_AluOut, p2_regdest1, p2_regdest2, p2_rs2, p2_sign_ext_18,  n/pflag, p2_n/pflag, p1_reg);

  
  //Data Mem

  mux2to1 slti (32'b0, 32'b1, p2_n/pflag, sltiout);

  wire [31:0] memOut;
  DataMem Data_mem(clk, reset, p2_memWrite, p2_memRead, p2_adderOut, p2_aluout, p2_rs2, memOut );
  
  
  
  MEM_WB mem_wb( clk, reset, 1'b1, 1'b1, p2_memWrite, p2_regWrite1, p2_regWrite2,
  p2_Overflow, p2_pc,
  memOut, p2_AluOut, 
  p2_regdest, p2_regdestc, p2_sign_ext_18, sltiout,
  p3_memWrite, p3_regWrite1, p3_regWrite2, 
  p3_overflow, p3_pc,
  p3_memOut, p3_aluOut, 
  p3_sign_ext_18,
  p3_sltiout,
  p3_regdest, p3_regdestc);

  mux4to1 normalregdata (p3_pc, p3_aluout, p3_slti, 32'b0, control, regdata);
  mux2to1 compressedregdata (  p3_sign_ext_18, p3_memout, control, regdatac);


  
  Forwarding fwd_ckt(p2_regwr1, p2_regwr2, p0_instr[35:31], p0_instr[40:36], p0_instr[9:7], p3_regwr1, p3_regwr2, p3_regdest, p3_regdestc, p3_memwr, p2_regdest, p2_regdestc,  
   cntr1, cntrl2);


hazard hazard_call(p1_memread, p1_regwrite, p1_regdestc,  p0_instr[35:31], p0_instr[40:36], p0_instr[9:7], id_ex_control_value, pc_write, if_id_write);

	
	wire NEGATIVE, ZERO, CARRY;
	
	register1bit_flag Overflow_reg( clk, reset, p3_VFlagWrite, 1'b1, p3_overflow, OVERFLOW );
	register1bit_flag Negative_reg( clk, reset, p3_NFlagWrite, 1'b1, p3_neg, NEGATIVE );
	register1bit_flag Zero_reg( clk, reset, p3_ZFlagWrite, 1'b1, p3_zero, ZERO );
	register1bit_flag Carry_reg( clk, reset, p3_CFlagWrite, 1'b1, p3_carry, CARRY );
					
 assign A = p3_memOut;
 assign B = p3_aluOut;
 
endmodule