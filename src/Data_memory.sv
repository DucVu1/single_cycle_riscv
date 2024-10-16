module Data_memory #(parameter WORDS = 8192, WIDTH = 32)
(
	input logic                         st_en, clk_i, //rst,
	input logic [$clog2(WORDS) - 1 : 0] addr,
	input logic [2:0]                   funct3,
	input logic [WIDTH - 1 : 0]         st_data,
	output logic [WIDTH - 1 :0]         ld_data
	//output 
	//output logic                        clk_div4
);
logic [1:0] byte_align;
localparam ADDR = $clog2(WORDS);
//logic [1:0]  byte_align;
logic [10:0] addr0, addr1, addr2, addr3, unalign_addr;
logic [7:0]  st_data0, st_data1, st_data2, st_data3, q0, q1, q2, q3;
assign unalign_addr = addr[ADDR - 1 : 2] + 1'b1;
assign byte_align = addr[1:0];
always_comb begin
	addr0 = addr[ADDR - 1 : 2];
	addr1 = addr[ADDR - 1 : 2];
	addr2 = addr[ADDR - 1 : 2];
	addr3 = addr[ADDR - 1 : 2];
	st_data0 = 8'd0;
	st_data1 = 8'd0;
	st_data2 = 8'd0;
	st_data3 = 8'd0;
	ld_data = 32'd0;
	if (st_en) begin
		case(funct3)
		3'd0: begin //store byte
			case(byte_align)
				2'd0: begin
					st_data0 = st_data[7:0];
					st_data1 = 8'd0;
					st_data2 = 8'd0;
					st_data3 = 8'd0;
				end
				2'd1: begin
					st_data0 = 8'd0;
					st_data1 = st_data[7:0];
					st_data2 = 8'd0;
					st_data3 = 8'd0;
				end
				2'd2: begin
					st_data0 = 8'd0;
					st_data1 = 8'd0;
					st_data2 = st_data[7:0];
					st_data3 = 8'd0;
				end
				2'd3: begin 
					st_data0 = 8'd0;
					st_data1 = 8'd0;
					st_data2 = 8'd0;
					st_data3 = st_data[7:0];
				end
			endcase
		end
		3'd1: begin //store halfword
			case(byte_align)
				2'd0: begin
					st_data0 = st_data[7:0];
					st_data1 = st_data[15:8];
					st_data2 = 8'd0;
					st_data3 = 8'd0;
				end
				2'd1: begin
					st_data0 = 8'd0;
					st_data1 = st_data[7:0];
					st_data2 = st_data[15:8];
					st_data3 = 8'd0;
				end
				2'd2: begin
					st_data0 = 8'd0;
					st_data1 = 8'd0;
					st_data2 = st_data[7:0];
					st_data3 = st_data[15:8];
				end
				2'd3: begin 
					st_data0 = st_data[15:8];
					st_data1 = 8'd0;
					st_data2 = 8'd0;
					st_data3 = st_data[7:0];
					addr0 = unalign_addr;
				end
			endcase
		end
		3'd2: begin //store word
			case(byte_align)
				2'd0: begin
					st_data0 = st_data[7:0];
					st_data1 = st_data[15:8];
					st_data2 = st_data[23:16];
					st_data3 = st_data[31:24];
				end
				2'd1: begin
					st_data0 = st_data[31:24];
					st_data1 = st_data[7:0];
					st_data2 = st_data[15:8];
					st_data3 = st_data[23:16];
					addr0 = unalign_addr;
				end
				2'd2: begin
					st_data0 = st_data[23:16];
					st_data1 = st_data[31:24];
					st_data2 = st_data[7:0];
					st_data3 = st_data[15:8];
					addr0 = unalign_addr;
					addr1 = unalign_addr;
				end
				2'd3: begin 
					st_data0 = st_data[15:8];
					st_data1 = st_data[23:16];
					st_data2 = st_data[31:24];
					st_data3 = st_data[7:0];
					addr0 = unalign_addr;
					addr1 = unalign_addr;
					addr2 = unalign_addr;
				end
			endcase
		end
		default: begin
			st_data0 = st_data[7:0];
			st_data1 = st_data[15:8];
			st_data2 = st_data[23:16];
			st_data3 = st_data[31:24];
			end
		endcase
	end else begin
		case(funct3)
			3'd0: begin //load byte
				case(byte_align)
					2'd0: begin
						ld_data[7:0] = q0;
						ld_data[31:8] = {24{q0[7]}};end
					2'd1: begin
						ld_data[7:0] = q1;
						ld_data[31:8] = {24{q1[7]}};end
					2'd2: begin
						ld_data[7:0] = q2;
						ld_data[31:8] = {24{q2[7]}};end
					2'd3: begin
						ld_data[7:0] = q3;
						ld_data[31:8] = {24{q3[7]}};end
				endcase
			end
			3'd1: begin //load half word
				case(byte_align)
					2'd0: begin
						ld_data[7:0] = q0;
						ld_data[15:8] = q1;
						ld_data[31:16] = {16{q1[7]}};
					end
					2'd1: begin
						ld_data[7:0] = q1;
						ld_data[15:8] = q2;
						ld_data[31:16] = {16{q2[7]}};end
					2'd2: begin
						ld_data[7:0] = q2;
						ld_data[15:8] = q3;
						ld_data[31:16] = {16{q3[7]}};end
					2'd3: begin
						addr0 = unalign_addr;
						ld_data[7:0] = q3;
						ld_data[15:8] = q0;
						ld_data[31:16] = {16{q0[7]}};end
				endcase
			end
			3'd2: begin //load word
				case(byte_align)
					2'd0: begin
						ld_data[7:0] = q0;
						ld_data[15:8] = q1;
						ld_data[23:16] = q2;
						ld_data[31:24] = q3;
					end
					2'd1: begin
						addr0 = unalign_addr;
						ld_data[7:0] = q1;
						ld_data[15:8] = q2;
						ld_data[23:16] = q3;
						ld_data[31:24] = q0;
					end
					2'd2: begin
						addr0 = unalign_addr;
						addr1 = unalign_addr;
						ld_data[7:0] = q2;
						ld_data[15:8] = q3;
						ld_data[23:16] = q0;
						ld_data[31:24] = q1;
					end
					2'd3: begin
						addr0 = unalign_addr;
						addr1 = unalign_addr;
						addr2 = unalign_addr;
						ld_data[7:0] = q3;
						ld_data[15:8] = q0;
						ld_data[23:16] = q1;
						ld_data[31:24] = q2;
					end
				endcase
			end
			3'd4: begin //load unsined byte
				case(byte_align)
					2'd0: begin
						ld_data[7:0] = q0;
						ld_data[31:8] = 24'd0;end
					2'd1: begin
						ld_data[7:0] = q1;
						ld_data[31:8] = 24'd0;end
					2'd2: begin
						ld_data[7:0] = q2;
						ld_data[31:8] = 24'd0;end
					2'd3: begin
						ld_data[7:0] = q3;
						ld_data[31:8] = 24'd0;end
				endcase
			end
			3'd5: begin //load unsigned half word
				case(byte_align)
					2'd0: begin
						ld_data[7:0] = q0;
						ld_data[15:8] = q1;
						ld_data[31:16] = 16'd0;
					end
					2'd1: begin
						ld_data[7:0] = q1;
						ld_data[15:8] = q2;
						ld_data[31:16] = 16'd0;end
					2'd2: begin
						ld_data[7:0] = q2;
						ld_data[15:8] = q3;
						ld_data[31:16] = 16'd0;end
					2'd3: begin
						addr0 = unalign_addr;
						ld_data[7:0] = q3;
						ld_data[15:8] = q0;
						ld_data[31:16] = 16'd0;end
				endcase
			end
			default: ld_data = 32'd0;
		endcase
	end
end
user_ram bank0 (.we(st_en), .clk(clk_i), .addr(addr0), .wdata(st_data0), .q(q0));
user_ram bank1 (.we(st_en), .clk(clk_i), .addr(addr1), .wdata(st_data1), .q(q1));
user_ram bank2 (.we(st_en), .clk(clk_i), .addr(addr2), .wdata(st_data2), .q(q2));
user_ram bank3 (.we(st_en), .clk(clk_i), .addr(addr3), .wdata(st_data3), .q(q3));
//clock_divider clock_divier(.clk(clk_i), .rst(rst), .clk_div4(clk_div4));
endmodule
