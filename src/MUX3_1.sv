module MUX3_1(
	input logic [31:0] A, B, C, D,
	input logic [1:0] Option,
	output logic [31:0] Out
);
always_comb begin 
	case (Option)
		2'b00: Out = A;
		2'b01: Out = B;
		2'b10: Out = C;
		default: Out = D;
	endcase
end
endmodule
