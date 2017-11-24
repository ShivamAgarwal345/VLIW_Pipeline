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
  jump, aluOp, memwrite, IF_Flush, regread, memtoreg, aluSrcb, slti);	// overflow flag not kept add_shoft_bar not kept epcwrite1 causewrite2 exception regread added aluSrcb added

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


alu ALU_call(alu_in1, aluIn2, p1_aluOp, p1_negativeFlag, p1_carryFlag, p1_overflowFlag, p1_zeroFlag, p1_flagWrite, aluOut1, alu_N/P_flag); 

mux2to1 sltimux (32'b0, 32'b1, alu_N/P_flag, slti_out);					// check if N/p flag is set when it is less or great
mux2to1 alufinaloutput (aluOut1, slti_out, slti, aluout);
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