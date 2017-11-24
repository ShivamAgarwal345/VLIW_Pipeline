module hazard( input opcode[1:0], input [2:0] funct,input p1_memread, input p1_regwrite, p1_regdestc,input p2_memread, input p2_regwrite, p2_regdestc input src1, input src2, input src3,
			output reg id_ex_controlvalue, output reg pc_write, output reg if_id_write);
	always @ (p1_memread or p1_regwrite or src1 or src2 or src3 or p2_memread or p2_regwrite or p1_regdest or p1_regdestc or p2_regdestc or p2_regdestc )
	begin
            // Load use hazard
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
	
            // beq hazard
            if(opcode[1:0]==2'b01 && funct == 3'b111)               // opcode for branch
            begin
            if(p1_memwread == 1'b1 && p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest))
               // have to intoduce two stalls

            if (p1_regwrite == 1'b1 && (src1 == p1_regdestc || src2 == p1_regdest || src3 == p1_regdest))
                  begin
                id_ex_control_value=1;
                pc_write=0;
                if_id_write=0;                                      // single stall
            end  

            if (p2_memread == 1'b1 && p2_regwrite == 1'b1 && (src1 == p2_regdestc || src2 == p2_regdestc || src3 == p2_regdestc))
             begin
                id_ex_control_value=1;
                pc_write=0;
                if_id_write=0;                                      // single stall
            end
            end
    end

endmodule
