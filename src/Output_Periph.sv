module Output_Periph(
	input logic         clk_i, rst_ni, st_en,
	input logic  [2:0]  funct3,
	input logic  [7:0]  addr,
	input logic  [31:0] st_data,
	output logic [6:0]  o_io_hex0, o_io_hex1, o_io_hex2, o_io_hex3, o_io_hex4, o_io_hex5, o_io_hex6, o_io_hex7,
	output logic [11:0] o_io_lcd,
	output logic [7:0]  o_io_ledg,
	output logic [16:0] o_io_ledr,
	output logic [31:0] ld_data
);
logic led_en, lcd_en, hex_en;
assign led_en = (~addr[5] & ~addr[4]) | (~addr[5] & addr[4]);
assign lcd_en = addr[5] & addr[4];
assign hex_en = addr[5] & ~addr[4];
always_comb begin 
	case (addr[5:4])
		2'd0: begin//Red LEDS (17 bit)
		       case(funct3)
					3'd0: begin//Load byte
						ld_data = {{24{o_io_ledr[7]}}, o_io_ledr[7:0]};
					end
					3'd1: begin//Load half
						ld_data = {{16{o_io_ledr[15]}}, o_io_ledr[15:0]};
					end
					3'd2: begin//Load word
						ld_data = {15'd0, o_io_ledr};
					end
					3'd4: begin//Load byte unsigned
						ld_data = {24'd0, o_io_ledr[7:0]};
					end
					3'd5: begin//Load half unsigned
						ld_data = {16'd0, o_io_ledr[15:0]};
					end
				default: ld_data = 32'd0;
				endcase
				end 
		2'd1: begin//Green LEDS (8 bits)
			case(funct3)
		        	3'd0: begin//Load byte
						ld_data = {{24{o_io_ledg[7]}}, o_io_ledg[7:0]};
					end
			default: ld_data = {24'd0, o_io_ledr[7:0]};
			endcase
			end
		2'd2: begin//7 Seven-segment LEDS
			case(addr[3:0])
				4'd0: begin
					case(funct3)
							3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex0};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex1, 1'b0, o_io_hex0};
							end
							3'd2: begin//Load word
								ld_data = {1'b0, o_io_hex3, 1'b0, o_io_hex2, 1'b0, o_io_hex1, 1'b0, o_io_hex0};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex0};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex1, 1'b0, o_io_hex0};
							end
					default: ld_data = {25'd0, o_io_hex0};
					endcase
				end
				4'd1: begin
					case(funct3)
							3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex1};
							end
							3'd1: begin//Load half
							ld_data = {16'd0, 1'b0, o_io_hex2, 1'b0, o_io_hex1};
							end
							3'd2: begin//Load word
								ld_data = {1'b0, o_io_hex4, 1'b0, o_io_hex3, 1'b0, o_io_hex2, 1'b0, o_io_hex1};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex1};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex2, 1'b0, o_io_hex1};
							end
					default: ld_data =  {25'd0, o_io_hex1};
					endcase
					end
				4'd2: begin
						case(funct3)
							3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex2};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex3, 1'b0, o_io_hex2};
							end
							3'd2: begin//Load word
								ld_data = {1'b0, o_io_hex5, 1'b0, o_io_hex4, 1'b0, o_io_hex3, 1'b0, o_io_hex2};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex2};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex3, 1'b0, o_io_hex2};
							end
						default: ld_data = {25'd0, o_io_hex2};
						endcase
						end
				4'd3: begin
						case(funct3)
								3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex3};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex4, 1'b0, o_io_hex3};
							end
							3'd2: begin//Load word
								ld_data = {1'b0, o_io_hex6, 1'b0, o_io_hex5, 1'b0, o_io_hex4, 1'b0, o_io_hex3};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex3};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex4, 1'b0, o_io_hex3};
							end
						default: ld_data = {25'd0, o_io_hex3};
						endcase
						end
				4'd4: begin
						case(funct3)
								3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex4};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex5, 1'b0, o_io_hex4};
							end
							3'd2: begin//Load word
								ld_data = {1'b0, o_io_hex7, 1'b0, o_io_hex6, 1'b0, o_io_hex5, 1'b0, o_io_hex4};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex4};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex5, 1'b0, o_io_hex4};
							end
						default: ld_data = {25'd0, o_io_hex4};
						endcase
						end
				4'd5: begin
						case(funct3)
								3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex5};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex6, 1'b0, o_io_hex5};
							end
							3'd2: begin//Load word
								ld_data = {8'd0, 1'b0, o_io_hex7, 1'b0, o_io_hex6, 1'b0, o_io_hex5};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex5};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex6, 1'b0, o_io_hex5};
							end
						default: ld_data = {25'd0, o_io_hex5};
						endcase
						end
				4'd6: begin
						case(funct3)
								3'd0: begin//Load byte
								ld_data = {24'd0, 1'b0, o_io_hex6};
							end
							3'd1: begin//Load half
								ld_data = {16'd0, 1'b0, o_io_hex7, 1'b0, o_io_hex6};
							end
							3'd2: begin//Load word
								ld_data = {16'd0, 1'b0, o_io_hex7, 1'b0, o_io_hex6};
							end
							3'd4: begin//Load byte unsigned
								ld_data = {24'd0, 1'b0, o_io_hex6};
							end
							3'd5: begin//Load half unsigned
								ld_data = {16'd0, 1'b0, o_io_hex7, 1'b0, o_io_hex6};
							end
						default: ld_data = {24'd0, 1'b0, o_io_hex6};
						endcase
						end
				4'd7: begin
						ld_data ={24'd0, 1'b0, o_io_hex7};
						end
				default: ld_data = 32'd0;
				endcase
		end
		2'd3: begin
			 case(funct3)
		        	3'd0: begin//Load byte
					ld_data = {{24{o_io_lcd[7]}}, o_io_lcd[7:0]};
				end
				3'd1: begin//Load half
					ld_data = {20'd0, o_io_lcd};
				end
				3'd2: begin//Load word
					ld_data = {20'd0, o_io_lcd};
				end
				3'd4: begin//Load byte unsigned
					ld_data = {24'd0, o_io_lcd[7:0]};
				end
			default: ld_data = {20'd0, o_io_lcd};
			endcase
		end
	endcase
end

HEX HEX(.clk_i(clk_i), .rst_ni(rst_ni), .st_en(st_en & hex_en), .funct3(funct3),.addr(addr[2:0]), .st_data(st_data[31:0]), .o_io_hex0(o_io_hex0), .o_io_hex1(o_io_hex1),  .o_io_hex2(o_io_hex2), .o_io_hex3(o_io_hex3), .o_io_hex4(o_io_hex4), .o_io_hex5(o_io_hex5), .o_io_hex6(o_io_hex6), .o_io_hex7(o_io_hex7)); //3 bit addr
LED LED(.clk_i(clk_i), .rst_ni(rst_ni), .st_en(st_en & led_en), .funct3(funct3), .addr(addr[4]), .st_data(st_data[16:0]), .o_io_ledr(o_io_ledr), .o_io_ledg(o_io_ledg)); //1 bit addr 
LCD LCD(.clk_i(clk_i), .rst_ni(rst_ni), .st_en(st_en & lcd_en), .funct3(funct3),.st_data(st_data[31:0]), .o_io_lcd(o_io_lcd));
endmodule
