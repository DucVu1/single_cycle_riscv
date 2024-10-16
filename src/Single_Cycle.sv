module Single_Cycle (
	input logic         clk_ram, rst_ni,
	input logic  [16:0] i_io_sw, 
	output logic [11:0] o_io_lcd,
   output logic [7:0]  o_io_ledg,
	output logic [16:0] o_io_ledr,
   output logic [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7,
	output logic [31:0] rs1_data, rs2_data, pc_debug, instruc_test, wb_data, alu_data , ld_data,r26, r25,
	//output logic [1:0] byte_align,
	output logic clk_i
);

logic Branch, op_a_sel, op_b_sel, funct7, br_sel, rd_wren, mem_wren;
logic [1:0] alu_op, wb_sel;
logic [6:0] Opcode;
logic [2:0] funct3;
logic [3:0] Operation;
logic [4:0] rs1_addr, rs2_addr, rd_addr;
logic [31:0] nxt_pc, pc, pc_four, instr, imm, operand_a, operand_b;
assign pc_debug = pc;
assign instruc_test = instr;
MUX2_1 PC_MUX(.A(pc_four), .B(alu_data), .Option(br_sel), .Out(nxt_pc));

program_counter PC(.clk_i(clk_i), .rst_ni(rst_ni), .PC_in(nxt_pc), .PC_out(pc));

PC_incremented PC_incremented(.PC_in(pc), .PC_out(pc_four));

Instruction_Memory Instruction_Memory(.inst_address(pc), .instruction(instr));
assign funct7 = instr[30];
assign rs1_addr = instr[19:15];
assign rs2_addr = instr[24:20];
assign rd_addr = instr[11:7];
assign Opcode = instr[6:0];
assign funct3 = instr[14:12];
register_file register_file(.r26(r26), .r25(r25),.clk_i(clk_i), .rd_wren(rd_wren), .rd_addr(rd_addr), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_data(wb_data), .rs1_data(rs1_data), .rs2_data(rs2_data));

brcomp brcom(.rs1_data(rs1_data), .rs2_data(rs2_data), .funct3(funct3), .Branch(Branch));

Immediate_generator immediate_generator(.In(instr), .Out(imm));

MUX2_1 MUX_operand_a(.A(rs1_data), .B(pc), .Option(op_a_sel), .Out(operand_a));

MUX2_1 MUX_operand_b(.A(rs2_data), .B(imm), .Option(op_b_sel), .Out(operand_b));

ALU ALU(.Operation(Operation[3:1]), .Cin(Operation[0]), .A(operand_a), .B(operand_b), .Result(alu_data));

LSU LSU(.clk_i(clk_i), .clk_ram(clk_ram),.rst_ni(rst_ni), .st_en(mem_wren), .funct3(funct3), .addr(alu_data[15:0]), .st_data(rs2_data), .i_io_sw(i_io_sw), .ld_data(ld_data), .o_io_lcd(o_io_lcd), .o_io_ledg(o_io_ledg), .o_io_ledr(o_io_ledr), .o_io_hex0(o_io_hex0), .o_io_hex1(o_io_hex1), .o_io_hex2(o_io_hex2), .o_io_hex3(o_io_hex3), .o_io_hex4(o_io_hex4), .o_io_hex5(o_io_hex5), .o_io_hex6(o_io_hex6), .o_io_hex7(o_io_hex7));

MUX3_1 WB_MUX(.A(pc_four), .B(alu_data), .C(ld_data), .D(operand_b), .Option(wb_sel), .Out(wb_data));

ALU_Control ALU_Control(.ALUOp(alu_op), .funct7(funct7), .funct3(funct3), .Operation(Operation));

ControlUnit Control_Unit(.Opcode(Opcode), .Branch(Branch), .br_sel(br_sel), .rd_wren(rd_wren), .op_a_sel(op_a_sel), .op_b_sel(op_b_sel), .alu_op(alu_op), .mem_wren(mem_wren),.wb_sel(wb_sel));

clock_divider clock_divier(.clk(clk_ram), .rst(rst_ni), .clk_div4(clk_i));
endmodule
