module ctrlCkt( input [6:0] opcode,  input [2:0] funct_3 , output reg regWrite1,  
output reg jump, output reg [1:0] aluOp , output reg memWrite , output reg IF_Flush  , 
output memtoReg , output reg [2:0] aluSrcB , output reg slti );
  

 always@(opcode or funct_3)
	begin
		case(opcode)																	//aluOp 0 - add	
			7'b0010011:																	// 1 - xor			
			begin																		// 2 - shift		
				case(funct_3)															// 3 - compare				
					3'b000:						//for addi
					begin
																				// not sure
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
																				// not sure
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
																				// not sure
						regWrite1 = 1'b1;
						jump = 1'b0;
						aluOp = 2'b10;
						memWrite = 1'b0;
						IF_Flush = 1'b0;
						//regRead = 1'b1;
						memtoReg = 1'b0;
						aluSrcB = 3'b001;
						slti = 1'b0;
					end
				endcase
			end
			
			7'b0110011:						//XOR
			begin
																		// not sure
				regWrite1 = 1'b1;
				jump = 1'b0;
				aluOp = 2'b01;
				memWrite = 1'b0;
				IF_Flush = 1'b0;
				//regRead = 1'b1;
				memtoReg = 1'b0;
				aluSrcB = 3'b000;
				slti = 1'b0;
			end
			
			7'b1100111:					//JALR
			begin
																		// not sure
				regWrite1 = 1'b1;
				jump = 1'b1;
				aluOp = 2'b00;
				memWrite = 1'b0;
				IF_Flush = 1'b1;
				//regRead = 1'b1;
				memtoReg = 1'b1;                                                   // not sure
				aluSrcB = 3'b100;
				slti = 1'b0;
			end
			
			7'b1100111:					//SW
			begin
																		// not sure
				regWrite1 = 1'b0;
				jump = 1'b0;
				aluOp = 2'b00;
				memWrite = 1'b1;
				IF_Flush = 1'b0;
				//regRead = 1'b1;
				memtoReg = 1'b0;       //dontcare                                  // not sure
				aluSrcB = 3'b011;
				slti = 1'b0;
			end
		endcase
	end
endmodule


//incomplete
//should i give default values????
module ctrlCktcompressed(input [1:0] opcode, input [2:0] funct_3 , 
output reg regWrite2, output reg branch ,  output reg memReadc , output reg IF_Flush  , 
output  memtoRegc  , output reg regDestC );
  
  

	always@(opcode)
	begin
		case(funct_3)
			3'b010:							///c.lw
			begin
				
				regWrite2 = 1'b1;
				branch = 1'b0;
				memReadc = 1'b1;
				IF_Flush = 1'b0;
				//regRead = 1'b1;
				memtoRegc = 1'b1;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b1;
			end
			
			3'b011:							///c.lui
			begin
				
				regWrite2 = 1'b1;
				branch = 1'b0;
				memReadc = 1'b0;				//doubt
				IF_Flush = 1'b0;
				//regRead = 1'b0;
				memtoRegc = 1'b0;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b0;
			end
			
			3'b010:							///c.branch
			begin
				
				regWrite2 = 1'b0;
				branch = 1'b1;
				memReadc = 1'b0;
				IF_Flush = 1'b1;
				//regRead = 1'b1;
				memtoRegc = 1'b1;
				//adderSrcA = ;
				//adderSrcB = ;
				regDestC = 1'b1;
			end
		endcase
	end
endmodule