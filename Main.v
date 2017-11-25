
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
  jump, aluOp, memwrite, IF_Flush, regread, memtoreg, aluSrcb, slti); // overflow flag not kept add_shoft_bar not kept epcwrite1 causewrite2 exception regread added aluSrcb added
  
  ctrlCktcompressed Ctrlckr (p0_instr[1:0], p0_instr[15:13], pc_inc, regwritec, branch, memread, IF_Flushc, regread, memtoregc, regdestc); //adderssrcA and B added  pc_incompressed added


   mux2to1_1bit ctrl_mux_1(regwrite, 1'b0, hd_stall , mux_regwrite);
  mux2to1_1bit ctrl_mux_2(pcwrite, 1'b0, hd_stall , mux_pcwrite);
   mux2to1_1bit ctrl_mux_3(memwrite, 1'b0, hd_stall , mux_memwrite);
   mux2to1_1bit ctrl_mux_4(regwritec, 1'b0, hd_stall , mux_regwritec);
   mux2to1_1bit ctrl_mux_5(pcwrite_c, 1'b0, hd_stall , mux_pcwritec);



ID_EX call (clk, reset, 1'b1, 1'b1, all control signals, p0_pc, p0_instr[35:31], p0_instr[40:36], p0_rs1, p0_rs2, p0_rsc, 
{2'b00, p0_instr[9:7]}, p0_instr[27:23], p0_instr[11:7], {2'b00,p0_instr[4:2]}, shift_amt_32, sign_ext_12_Itype, sign_ext_13, sign_ext_12_Stype, sign_ext_18,{15'b0,p0_instr[6:2],2'b0},    // inputs over
all control signals, p1_pc, p1_instr_rs1, p1_instr_rs2, p1_rs1, p1_rs2, p1_rsc, p1_instr_rsc, p1_regdest, p1_regdestc1, p1_regdestc2, p1_shift_amt_32, p1_sign_ext_12_Itype, p1_sign_ext_13, p1_sign_ext_12_Stype, p1_sign_ext_18, p1_concat 
 );


mux8to1_32bit Forward1  (p1_rs1, p2_aluout, p2_adderout, regdata, regdatac, alu_in1);   // some_out1 some_out2
mux8to1_32bit Forward2  (p1_rs2, p2_aluout, p2_adderout, regdata, regdatac, alu_in2_temp);
mux8to1_32bit Forward3  (p1_rsc, p2_aluout, p2_adderout, regdata, regdatac, adder_in_1);

mux8to1_32bit  lastmuxbeforealu (alu_in2_temp, p1_shift_amt_32, sign_ext_12_Itype, p1_sign_ext_12_Stype, p1_sign_ext_13, 32'b0, 32'b0, 32'b0, alusrcb, alu_in2);
      // the last mux before adder uses branch address and CLW instruction ka 2nd input


mux2to1_32bit destinationcompressed (p1_regdestc1, p1_regdestc2, regdestc, p1_regdestc);

// forwarding forw (p2_regwr1, p2_regwr2, p1_rs1, p1_rs2, p1_rs3, p3_regwr1, p3_regwr2, p2_regdest1, p2_regdest2, p3_regdest1, p3_regdest2, p2_memwr1, p2_memwr2, p3_memwr1, p3_memwr2);

alu ALU_call(alu_in1, aluIn2, p1_aluOp, p1_overflowFlag, p1_carryFlag, p1_negFlag,p1_zeroFlag,Npflag,aluOut); 

mux2to1 sltimux (32'b0, 32'b1, Npflag, slti_out);         // check if N/p flag is set when it is less or great
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
