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
