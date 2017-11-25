
module IF_ID (input clk, input reset, input regwrite, input decOut1b, input flush, input [31:0] pc,input [47:0] instr, output [31:0] p0_pc, input [47:0] p0_instr);
	register32bit_n_1 r0 (clk,reset,flush,regwrite, decOut1b, pc, p0_pc);
	register48bit_n_1 r1 (clk,reset,flush,regwrite, decOut1b, instr, p0_instr);
endmodule


module ID_EX(input clk, input reset, input regWrite, input decOut1b ,  input regWrite1 , 
input jump , input [1:0] aluOp , input memWrite , input IF_Flush , input memtoReg , input [2:0] aluSrcB , 
input slti , input regWritec , input branch , input memReadc , input memtoRegc , input regDestc , 
input [31:0] p0_pc , input [4:0] p0_rs , input [4:0] p0_rt , input [31:0] p0_rs1 , input [31:0] p0_rs2 , 
input [31:0] p0_rsc , input [4:0] p0_rs1c , input [4:0] p0_regDest , input [4:0] p0_regDestc1 , 
input [4:0] p0_regDestc2 , input [31:0] p0_shiftAmt , input [31:0] p0_signExt12I , input [31:0] p0_signExt13 , 
input [31:0] p0_signExt12S , input [31:0] p0_signExt18 , input [21:0] p0_concat , 

output p1_regWrite1 , 
output p1_jump , output [1:0] p1_aluOp , output p1_memWrite , output p1_IF_Flush , output p1_memtoReg , 
output [2:0] p1_aluSrcB , 
output p1_slti , output p1_regWritec , output p1_branch , output p1_memReadc , output p1_memtoRegc , 
output p1_regDestc , 
output [31:0] p1_pc , output [4:0] p1_rs , output [4:0] p1_rt , output [31:0] p1_rs1 , output [31:0] p1_rs2 , 
output [31:0] p1_rsc , output [4:0] p1_rs1c , output [4:0] p1_regDest , output [4:0] p1_regDestc1 , 
output [4:0] p1_regDestc2 , output [31:0] p1_shiftAmt , output [31:0] p1_signExt12I , output [31:0] p1_signExt13 , 
output[31:0] p1_signExt12S , output [31:0] p1_signExt18 , output [21:0] p1_concat);
  
  register1bit for_regWrite1 (clk,reset,regWrite,decOut1b,regWrite1,p1_regWrite1);
  register1bit for_jump (clk,reset,regWrite,decOut1b,jump,p1_jump);
  register2bit for_aluOp (clk,reset,regWrite,decOut1b,aluOp,p1_aluOp);
  register1bit for_memWrite (clk,reset,regWrite,decOut1b,memWrite,p1_memWrite);
  register1bit for_IFflush (clk,reset,regWrite,decOut1b,IF_Flush,p1_IF_Flush);
  register1bit for_memtoReg (clk,reset,regWrite,decOut1b,memtoReg,p1_memtoReg);
  register3bit for_aluSrcB (clk,reset,regWrite,decOut1b,aluSrcB,p1_aluSrcB);
  register1bit for_slti (clk,reset,regWrite,decOut1b,slti,p1_slti);
  register1bit for_regWritec (clk,reset,regWrite,decOut1b,regWritec,p1_regWritec);
  register1bit for_branch (clk,reset,regWrite,decOut1b,branch,p1_branch);
  register1bit for_memReadc (clk,reset,regWrite,decOut1b,memReadc,p1_memReadc);
  register1bit for_memtoRegc (clk,reset,regWrite,decOut1b,memtoRegc,p1_memtoRegc);
  register1bit for_regDestc (clk,reset,regWrite,decOut1b,regDestc,p1_regDestc);
  
  
  register32bit_n for_pc(clk, reset, regWrite, decOut1b, p0_pc, p1_pc );
  
  register5bit for_rs(clk, reset, regWrite, decOut1b, p0_rs, p1_rs );
  register5bit for_rt(clk, reset, regWrite, decOut1b, p0_rt, p1_rt );
  
  register32bit_n for_rs1(clk, reset, regWrite, decOut1b, p0_rs1, p1_rs1 );
  register32bit_n for_rs2(clk, reset, regWrite, decOut1b, p0_rs2, p1_rs2 );
  register32bit_n for_rsc(clk, reset, regWrite, decOut1b, p0_rsc, p1_rsc );

  register5bit for_rs1c(clk , reset , regWrite , decOut1b , p0_rs1c , p1_rs1c );
  register5bit for_regDest(clk , reset , regWrite , decOut1b , p0_regDest , p1_regDest );
  register5bit for_regDestc1(clk , reset , regWrite , decOut1b , p0_regDestc1 , p1_regDestc1 );
  register5bit for_regDestc2(clk , reset , regWrite , decOut1b , p0_regDestc2 , p1_regDestc2 );
  
  
  register32bit_n for_shiftAmt(clk, reset, regWrite, decOut1b, p0_shiftAmt, p1_shiftAmt );
  register32bit_n for_signExt12I(clk, reset, regWrite, decOut1b, p0_signExt12I, p1_signExt12I );
  register32bit_n for_signExt13(clk, reset, regWrite, decOut1b, p0_signExt13, p1_signExt13 );
  register32bit_n for_signExt12S(clk, reset, regWrite, decOut1b, p0_signExt12S, p1_signExt12S );
  register32bit_n for_signExt18(clk, reset, regWrite, decOut1b, p0_signExt18, p1_signExt18 );
  
  register22bit for_concat(clk,reset , regWrite , decOut1b , concat , p1_concat);
endmodule


//doubt rs2 and p1_reg
module EX_MEM(input clk, input reset, input regWrite , input decOut1b , input p1_regWrite1 , input p1_regWrite2 , 
input p1_memRead , input p1_memWrite , input [31:0] p1_adderOut , input [31:0] p1_aluOut , input [4:0] p1_regDest ,
 input [4:0] p1_regDestc , input [31:0] p1_rs2 , input [31:0] p1_signExt18, input [31:0] p1_pc,output p2_regWrite1 , 
 output p2_regWrite2 , output p2_memRead , output p2_memWrite, output [31:0] p2_adderOut , output [31:0] p2_aluOut
 , output [4:0] p2_regDest , output [4:0] p2_regDestc , output [31:0] p2_rs2 , output [31:0] p2_signExt18, output [31:0] p2_pc); 

	
	register1bit for_regWrite1 ( clk, reset, regWrite , decOut1b , p1_regWrite1, p2_regWrite1 );
	register1bit for_regWrite2 ( clk, reset, regWrite, decOut1b, p1_regWrite2, p2_regWrite2 );
	register1bit for_memRead ( clk, reset, regWrite, decOut1b, p1_memRead, p2_memRead );
	register1bit for_memWrite ( clk, reset, regWrite, decOut1b, p1_memWrite, p2_memWrite );
	
	register32bit_n for_adderOut ( clk, reset, regWrite, decOut1b, p1_adderOut , p2_adderOut );
	register32bit_n for_aluOut ( clk, reset, regWrite, decOut1b, p1_aluOut, p2_aluOut );
	
	register5bit for_regDest ( clk, reset, regWrite, decOut1b, p1_regDest, p2_regDest );
	register5bit for_regDest ( clk, reset, regWrite, decOut1b, p1_regDestc, p2_regDestc );
	
	register32bit_n for_rs1 ( clk, reset, regWrite, decOut1b, p1_rs2 , p2_rs2 );
	register32bit_n for_signExt ( clk, reset, regWrite, decOut1b, p1_signExt18 , p2_signExt18 );
	register32bit_n for_pc ( clk, reset, regWrite, decOut1b, p1_pc , p2_pc );

  
endmodule

//doubt in p2_memOut  // check size of p2_memOut
module MEM_WB (input clk , input reset, input regWrite , input decOut1b , input p2_memWrite , input p2_regWrite1 , 
input p2_regWrite2 , input [31:0] p2_pc , input [31:0] p2_memOut , input [31:0] p2_aluOut , input [4:0] p2_regDest, 
input [4:0] p2_regDestc , input [31:0] p2_signExt18 , output p3_memWrite , output p3_regWrite1 , 
output p3_regWrite2 , output [31:0] p3_pc, output [31:0] p3_memOut , output [31:0] p3_aluOut , 
output [4:0] p3_regDest , output [4:0] p3_regDestc , output [31:0] p3_signExt18);

	register1bit for_memWrite(clk, reset, regWrite, decOut1b, p2_memWrite, p3_memWrite );
	register1bit for_regWrite1(clk, reset, regWrite, decOut1b, p2_regWrite1, p3_regWrite1 );
	register1bit for_regWrite2(clk, reset, regWrite, decOut1b, p2_regWrite2, p3_regWrite2 );
	
	register32bit_n for_pc(clk, reset, regWrite, decOut1b, p2_pc, p3_pc );
	register32bit_n for_memOut(clk, reset, regWrite, decOut1b, p2_memOut , p3_memOut );
	register32bit_n for_alu(clk, reset, regWrite, decOut1b, p2_aluOut, p3_aluOut );
	
	register5bit for_regDest(clk, reset, regWrite, decOut1b, p2_regDest, p3_regDest );
	register5bit for_regDestc(clk, reset, regWrite, decOut1b, p2_regDest, p3_regDestc );
  
	register32bit_n for_signExt18(clk, reset, regWrite, decOut1b, p2_signExt18, p3_signExt18 );
endmodule