module shift_left_1bit #(parameter Width = 32)(
	input logic [Width - 1:0] in,
	output logic [Width - 1:0] out
);
generate
	genvar i;
	for (i = 0; i < Width; i = i+1) begin : generat_shifter
		if(i == 0) begin 
			MUX2_1_1bit MUX(.A(in[i]), .B(1'b0), .Option(1'b1), .Out(out[i]));
		end
		else begin
			MUX2_1_1bit MUX(.A(in[i]), .B(in[i - 1]), .Option(1'b1), .Out(out[i]));
		end
	end
endgenerate
endmodule
