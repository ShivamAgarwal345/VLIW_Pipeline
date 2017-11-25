module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg overflow, output reg carry, output reg neg, output reg zero, output reg N/pflag, output reg [31:0] aluOut);
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
			       N/pflag = carry;
			       end
			2'b01: begin
			       aluOut = aluIn1 >> aluIn2;
			       if(aluIn2 >= 32)  carry = aluIn1[31];
			       else              carry = aluIn1[aluIn2-1];
			       if(aluOut[31] == 1)    neg = 1'b1;
			       else              neg = 1'b0;
			       if(aluOut == 0)   zero = 1'b1;
			       else              zero = 1'b0;
			       overflow = 1'b0;
			       end
			2'b10: begin
			       aluOut = aluIn1 ^ aluIn2;
			       end  
		endcase
	end
	assign overflow1 = overflow;
endmodule