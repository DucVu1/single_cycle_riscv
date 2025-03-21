module dff_user(
	input clk, rst, d,
	output logic q
);
always_ff @(posedge clk, negedge rst) begin
	if (~rst)
		q <= 1'b0;
	else
		q <= d;
end
endmodule
