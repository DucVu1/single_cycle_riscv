module ControlUnit(
	input logic [6:0] Opcode,
	input logic Branch,
	output logic br_sel, rd_wren, op_a_sel, op_b_sel, mem_wren,
	output logic [1:0] alu_op,wb_sel
);
always_comb begin 
	case(Opcode)
		7'b0000011: //ld - I
		begin
			br_sel = 1'b0;
			rd_wren = 1'b1;
		  	op_a_sel = 1'b0;
			op_b_sel = 1'b1; //choose immediate value
			alu_op = 2'b00; //choose addition
			mem_wren = 1'b0; //read
			wb_sel = 2'b10; //choose ld_data
		end
		7'b0100011: //st - S
		begin 
			br_sel = 1'b0;
			rd_wren = 1'b0;
			op_a_sel = 1'b0;
			op_b_sel = 1'b1;
			alu_op = 2'b00; //choose addition
			mem_wren = 1'b1; //write
			wb_sel = 2'b11; // dummy value 
		end
		7'b0110011: //R-format
		begin
			br_sel = 1'b0;
			rd_wren = 1'b1; //write to register
			op_a_sel = 1'b0;
			op_b_sel = 1'b0;
			alu_op = 2'b01;
			mem_wren = 1'b0;
			wb_sel = 2'b01; //choose alu_data 
		end
		7'b1100011:  //B-format
		begin 
			br_sel = Branch ? 1'b1 : 1'b0;
			rd_wren = 1'b0;
			op_a_sel = 1'b1; //choose pc
			op_b_sel = 1'b1; //choose immediate value
			alu_op = 2'b00; //choose addition
			mem_wren = 1'b0;
			wb_sel = 2'b00; //choose alu_data
		end
		7'b0010011: // I instruction
		begin 
			br_sel = 1'b0;
			rd_wren = 1'b1;
			op_a_sel =1'b0;
			op_b_sel = 1'b1; //choose immediate value
			alu_op = 2'b10; //choose I instruciton
			mem_wren = 1'b0;
			wb_sel = 2'b01; //choose alu_data
		end
		7'b1101111: //Jump and Link
		begin
			br_sel = 1'b1;
			rd_wren = 1'b1;
			op_a_sel = 1'b1; //choose pc
			op_b_sel = 1'b1; //choose immediate_value
			alu_op = 2'b00;
			mem_wren = 1'b0;
			wb_sel = 2'b00; //choose pc_four
		end
		7'b1100111: //Jump and Link Reg
		begin
			br_sel =1'b1;
			rd_wren = 1'b1;
			op_a_sel = 1'b0; //choose rs1_data
			op_b_sel = 1'b1; //choose immediate_value
			alu_op = 2'b00;
			mem_wren = 1'b0;
			wb_sel = 2'b00; //choose pc_four
		end
		7'b0110111: //Load Upper Imm
		begin
			br_sel =1'b0;
			rd_wren = 1'b1;
			op_a_sel = 1'b0; //choose rs1_data
			op_b_sel = 1'b1; //choose immediate_value
			alu_op = 2'b00;
			mem_wren = 1'b0;
			wb_sel = 2'b01; //choose pc_four
		end
		7'b0010111: //Add Upper Imm to PC
		begin
			br_sel =1'b0;
			rd_wren = 1'b1;
			op_a_sel = 1'b1; //choose PC
			op_b_sel = 1'b1; //choose immediate_value
			alu_op = 2'b00;
			mem_wren = 1'b0;
			wb_sel = 2'b01; //choose alu_data
		end
	default:
		begin
			br_sel =1'b0;
			rd_wren = 1'b0;
			op_a_sel = 1'b0; 
			op_b_sel = 1'b0; 
			alu_op = 2'b00;
			mem_wren = 1'b0;
			wb_sel = 2'b00; 
		end
	endcase	
end
endmodule
