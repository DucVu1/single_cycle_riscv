module LSU(
	input logic         clk_ram, clk_i, rst_ni, st_en, //st_en 1 = write 0 = read
	input logic  [2:0]  funct3,
	input logic  [15:0] addr,
	input logic  [16:0] i_io_sw,
	input logic  [31:0] st_data, 
	output logic [31:0] ld_data,
   output logic [11:0] o_io_lcd, 
	output logic [7:0]  o_io_ledg,
   output logic [16:0] o_io_ledr, 
	output logic [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7
);
logic [31:0] ld_data_output_periph, ld_data_data, ld_data_input_periph;
logic        output_periph_en, data_memory_en;
assign data_memory_en = ~addr[15] & ~addr[14] & addr[13];
assign output_periph_en = ~addr[15] & addr[14] & addr[13] & addr[12] & ~addr[11] ;
always_comb begin 
	ld_data = 32'd0;
	if (~st_en) begin
		if(data_memory_en) begin
			ld_data = ld_data_data;
		end else if (output_periph_en) begin
			ld_data = ld_data_output_periph;
		end else begin
			case(funct3) 
				3'd0: ld_data = {{24{ld_data_input_periph[7]}}, ld_data_input_periph[7:0]};
				3'd1: ld_data = {{16{ld_data_input_periph[15]}}, ld_data_input_periph[15:0]};
				3'd2: ld_data = ld_data_input_periph;
				3'd4: ld_data = {24'd0, ld_data_input_periph[7:0]};
				default: ld_data = {16'd0, ld_data_input_periph[15:0]};
			endcase
			end
	end
	 	
end
Output_Periph Output_Periph(.clk_i(clk_i), .rst_ni(rst_ni), .st_en(st_en & output_periph_en), .funct3(funct3), .addr(addr[7:0]), .st_data(st_data[31:0]), .o_io_hex0(o_io_hex0), .o_io_hex1(o_io_hex1), .o_io_hex2(o_io_hex2), .o_io_hex3(o_io_hex3), .o_io_hex4(o_io_hex4), .o_io_hex5(o_io_hex5), .o_io_hex6(o_io_hex6), .o_io_hex7(o_io_hex7), .o_io_lcd(o_io_lcd), .o_io_ledg(o_io_ledg), .o_io_ledr(o_io_ledr), .ld_data(ld_data_output_periph));
Data_memory Data_memory(.clk_i(clk_ram), .st_en(st_en & data_memory_en), .funct3(funct3), .st_data(st_data), .addr(addr[12:0]), .ld_data(ld_data_data));  //addr [11:0]
Input_Periph Input_Periph(.clk_i(clk_i), .rst_ni(rst_ni), .i_io_sw(i_io_sw), .ld_data(ld_data_input_periph));
endmodule
