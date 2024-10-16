module brcomp(
	//input logic choose_different,
	input logic [31:0] rs1_data, rs2_data,
	input logic [2:0] funct3,
	output logic Branch
);
logic Equal2,less_than,Cout;
logic [31:0] Equal, AU_buffer;
//logic [2:0] function3;
assign Equal = rs1_data^rs2_data;
assign Equal2 = |Equal;
//assign function3 = choose_different ? funct32 : funct3;
always_comb begin 
	case(funct3)
		3'd0: Branch = ~Equal2; //equal
		3'd1: Branch = Equal2; //not equal
		3'd4: begin //smaller
				if(rs1_data[31] & ~rs2_data[31])
					Branch = 1'b1; 
				else if(~rs1_data[31] & rs2_data[31])
					Branch = 1'b0;
				else
					Branch = less_than;
				end
		3'd5: begin // greater than or equal
				if(rs1_data[31] & ~rs2_data[31])
					Branch = 1'b0; 
				else if(~rs1_data[31] & rs2_data[31])
					Branch = 1'b1;
				else
					Branch = ~Equal2 ? 1'b1 : ~less_than;
				end 
		3'd6: Branch = Cout; //smaller than unsigned
		3'd7: Branch = ~Cout;// greater than or equal unsigned
		default: Branch = 1'b0;
		endcase
end

SMcomparator SMcomparator(.A(rs1_data),.B(rs2_data), .Cout(Cout), .less_than(less_than));
AU Adder(.A(rs1_data), .B(rs2_data), .Cin(1'b1), .Cout(Cout), .Sum(AU_buffer));
endmodule
