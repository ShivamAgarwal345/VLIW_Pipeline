module forwarding(input [6:0] opcode,input[1:0] opcodec,input[2:0] funct,input p2_regwr1, input p2_regwr2, input [4:0] p0_rs1,input [4:0] p0_rs2,input [4:0] p0_rsc,input p3_regwr, input p3_regwrc,input [4:0] p3_regdest,input [4:0] p3_regdestc, input p3_memwr, input [4:0] p2_regdest,input [4:0] p2_regdestc,output reg [2:0]fwd1, output reg [2:0] fwd2, output reg [2:0] fwd3, output reg[2:0] fwd4, output [2:0] fwd5);
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
		if(opcode == 7'b0000000)			
		fwd1 =  3'b001;
		if(opcode == 7'b1100111)			// 1100111 is opcode of jump
		fwd3 = 3'b001;
		end
		
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rs1)
		
		begin
		if(opcode == 7'b0000000)
		fwd1 =  3'b010;
		if(opcode == 7'b1100111)			// 1100111 is opcode of jump
		fwd3 = 3'b010;
		end

		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		
		begin
		if(opcode == 7'b0000000)
		fwd1 =  3'b011;
		if(opcode == 7'b1100111)			// 1100111 is opcode of jump
		fwd3 = 3'b011;
		end

		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rs1)
		
		begin
		if(opcode == 7'b0000000)
		fwd1 =  3'b011;
		if(opcode == 7'b1100111)			// 1100111 is opcode of jump
		fwd3 = 3'b011;
		end

		else if (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rs1)
		
		begin
		if(opcode == 7'b0000000)
		fwd1 =  3'b100;
		if(opcode == 7'b1100111)			// 1100111 is opcode of jump
		fwd3 = 3'b100;
		end

		else
		begin
		if(opcode == 7'b0000000)
		fwd1 =  3'b000;
		if (opcode == 7'b1100111)
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
		if(opcode ==2'b00 && funct == 3'b000)
		fwd3 = 3'b001;
																	// means branch instruction
		if(opcode ==2'b00 && funct == 3'b000)
		fwd5 = 3'b001;
		end
		else if (p2_regwrc==1'b1 && p2_regdestc!=5'b0 && p2_regdestc == p0_rsc)
		begin
		if(opcode ==2'b00 && funct == 3'b000)
		fwd3 = 3'b010;
		if (opcode1 == 2'b01 && funct == 3'b111)				// means branch instruction
		fwd5 = 3'b010;
		end
		else if (p3_regwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		begin
		if(opcode ==2'b00 && funct == 3'b000)
		fwd3 = 3'b011;
		if (opcode1 == 2'b01 && funct == 3'b111)				// means branch instruction
		fwd5 = 3'b011;
		end
		else if (p3_memwr==1'b1 && p3_regdest!=5'b0 && p3_regdest == p0_rsc)
		begin
		if(opcode ==2'b00 && funct == 3'b000)
		fwd3 = 3'b011;
		if (opcode1 == 2'b01 && funct == 3'b111)				// means branch instruction
		fwd5 = 3'b011;
		end
		else (p3_regwrc==1'b1 && p3_regdest!=5'b0 && p3_regdestc == p0_rsc)
		begin
		if(opcode ==2'b00 && funct == 3'b000)
		fwd3 = 3'b100;
		if (opcode1 == 2'b01 && funct == 3'b111)
		fwd3 = 3'b000;
		end
	end	
endmodule
