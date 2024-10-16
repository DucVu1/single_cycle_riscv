module register_file #(parameter DATA_N = 32, SIZE = 32)
(
    input logic clk_i, rd_wren,
    input logic [4:0] rd_addr, rs1_addr, rs2_addr,
    input logic [DATA_N-1:0] rd_data,
    output logic [DATA_N-1:0] rs1_data, rs2_data, r26, r25
);
logic [4:0] ignor_regs = 5'd0;
logic [DATA_N-1:0] regs [0:SIZE-1];

 // Initial block to assign initial value to regs[11]
initial begin
	for(int i = 0; i<32; i++) begin 
		if(i == 11) 
			regs[i] = 32'd1;
		else
			regs[i] = 32'd0;
			end
end

always_ff @(posedge clk_i) begin
  if (rd_wren) begin
		regs[rd_addr] <= (rd_addr == ignor_regs) ? 32'd0 : rd_data;
  end
end
assign rs1_data = regs[rs1_addr];
assign rs2_data = regs[rs2_addr];
assign r26 = regs[5'd26];
assign r25 = regs[5'd25];

endmodule
