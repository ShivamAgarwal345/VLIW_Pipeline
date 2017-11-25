
module IF_ID (input clk, input reset, input regwrite, input decOut1b, input flush, input [31:0] pc,input [47:0] instr, output [31:0] p0_pc, input [47:0] p0_instr);
	register32bit_n_1 r0 (clk,reset,flush,regwrite, decOut1b, pc, p0_pc);
	register48bit_n_1 r1 (clk,reset,flush,regwrite, decOut1b, instr, p0_instr);
endmodule

