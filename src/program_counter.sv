module program_counter#(parameter Width = 32)(
	input logic clk_i, rst_ni,
	input logic [Width - 1:0] PC_in,
	output logic [Width - 1:0] PC_out
);
always_ff@(posedge clk_i, negedge rst_ni) begin: program_counter
	if(~rst_ni) begin 
		PC_out <= 32'd0;
		end
	else begin 
		PC_out <= PC_in;
		end
end
endmodule
	
