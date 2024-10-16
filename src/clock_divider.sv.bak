module clock_divider(
	input clk, rst,
	output clk_div4
);
logic clk_div2;
dff_user dff0(.clk(clk), .rst(rst), .d(~clk_div2), .q(clk_div2));
dff_user dff1(.clk(clk_div2), .rst(rst), .d(~clk_div4), .q(clk_div4));
endmodule

