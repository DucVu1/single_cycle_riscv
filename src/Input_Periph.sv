module Input_Periph (
	input logic clk_i, rst_ni, 
	input logic [16:0] i_io_sw,
	output logic [31:0] ld_data
);

always_ff @(posedge clk_i,negedge rst_ni) begin 
	if (!rst_ni)
		ld_data <= 32'd0;
	else
		ld_data <= {15'd0,i_io_sw};
end
endmodule
