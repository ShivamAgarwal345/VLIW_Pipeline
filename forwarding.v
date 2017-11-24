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
