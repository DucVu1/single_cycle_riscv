module LCD (
	input logic         clk_i, rst_ni,
	input logic         st_en,
	input logic [2:0]   funct3,
	input logic [31:0]  st_data,
	output logic [11:0] o_io_lcd
);

always_ff @(posedge clk_i, negedge rst_ni) begin 
	if (!rst_ni) begin 
		o_io_lcd <= 12'd0;
	end
	else if (st_en) begin
		case (funct3)
			3'd0: o_io_lcd[7:0] <= st_data[7:0];
			3'd1: begin
				o_io_lcd[10:0] <= st_data[10:0];
				o_io_lcd[11] <= st_data[11];
			end
			default: begin
				o_io_lcd[10:0] <= st_data[10:0];
				o_io_lcd[11] <= st_data[31];
			end
		endcase
	end
end
endmodule
