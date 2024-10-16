module user_ram #(parameter WORDS = 2048, WIDTH = 8)
(
	input logic                         we, clk,
	input logic [$clog2(WORDS) - 1 : 0] addr,
	input logic [WIDTH - 1 : 0]         wdata,
	output logic [WIDTH - 1 : 0]        q
);
logic [WIDTH - 1 : 0] ram [WORDS - 1 : 0];
initial begin
 for (int i = 0; i < WORDS; i++) begin
  ram[i] = 8'd0;
  end
 end
always_ff @(posedge clk) begin
	if(we) begin
		ram[addr] <= wdata;
	end else begin
		q <= ram[addr];
	end
end
endmodule
		
