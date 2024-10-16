module HEX#(parameter QUANTITY = 8)(
	input logic         clk_i, rst_ni, st_en,
	input logic  [2:0]  funct3, 
	input logic  [2:0]  addr,
	input logic  [31:0] st_data,
	output logic [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7
);
logic [7:0] hex_io [QUANTITY - 1 : 0];
always_ff @(posedge clk_i, negedge rst_ni) begin 
	if (!rst_ni) begin
		for(int i = 0; i < QUANTITY; i++) begin
			hex_io[i] <= 8'd0;
		end
	end else if (st_en) begin	
		case(funct3)
			3'd0: begin//Store Byte
				hex_io[addr] <= st_data[7:0];
			end
			3'd1: begin//Store Half
				hex_io[addr] <= st_data[7:0];
				hex_io[addr + 1] <= st_data[15:8];
			end
			default: begin
				hex_io[addr] <= st_data[7:0];
				hex_io[addr + 1] <= st_data[15:8];
				hex_io[addr + 2] <= st_data[23:16];
				hex_io[addr + 3] <= st_data[31:24];
				
			end
		endcase
	end
end
assign o_io_hex0 = hex_io[3'd0][6:0];
assign o_io_hex1 = hex_io[3'd1][6:0];
assign o_io_hex2 = hex_io[3'd2][6:0];
assign o_io_hex3 = hex_io[3'd3][6:0];
assign o_io_hex4 = hex_io[3'd4][6:0];
assign o_io_hex5 = hex_io[3'd5][6:0];
assign o_io_hex6 = hex_io[3'd6][6:0];
assign o_io_hex7 = hex_io[3'd7][6:0];

endmodule

