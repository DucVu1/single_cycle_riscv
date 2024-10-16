module LED (
	input logic         clk_i, rst_ni, st_en,
	input logic         addr,
	input logic  [2:0]  funct3,
	input logic  [16:0] st_data,
	output logic [16:0] o_io_ledr,
	output logic [7:0]  o_io_ledg
);
always_ff @(posedge clk_i, negedge rst_ni) begin 
	if (!rst_ni) begin 
		o_io_ledr <= 17'd0;
		o_io_ledg <= 8'd0;
	end
	else if (st_en) begin 
		if (~addr) begin
		       case(funct3)
				3'd0: o_io_ledr[7:0] <= st_data[7:0];
				3'd1: o_io_ledr[15:0] <= st_data[15:0];
				default: o_io_ledr <= st_data;
			endcase
		end
		else begin 
			o_io_ledg <= st_data[7:0];
		end
	end
end
endmodule
	
