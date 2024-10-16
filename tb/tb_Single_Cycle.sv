module Single_Cycle_tb;

// Testbench signals
logic clk_i, clk_ram, rst_ni;
// logic [1:0] byte_align;
logic [16:0] io_sw;
logic [11:0] io_lcd;
logic [7:0] io_ledg;
logic [16:0] io_ledr;
logic [6:0] io_hex0, io_hex1, io_hex2, io_hex3, io_hex4, io_hex5, io_hex6, io_hex7;
logic [31:0] pc_debug, instruc_test, rs1_data, rs2_data, alu_data, wb_data, ld_data, r26, r25;

// Clock generation
initial begin
    clk_ram = 0;
    forever #5 clk_ram = ~clk_ram; // 10-time unit clock period
end

// Reset logic
initial begin
    rst_ni = 0;
    #20 rst_ni = 1;  // De-assert reset after 20 time units
end

// Open file for output
integer file;
initial begin
    file = $fopen("C:/Users/Duc/A PLACE HOLDER/University/Computer_Organization/project/RISCV/log_file_container/lsu_instruction.log", "w");
    if (file == 0) begin
        $display("Error: Could not open file.");
        $finish;
    end
end

// Close file at the end of simulation
final begin
    $fclose(file);
end

// Instantiate the DUT (Device Under Test)
Single_Cycle DUT (
    .clk_i(clk_i),
    .clk_ram(clk_ram),
    .rst_ni(rst_ni),
    .i_io_sw(io_sw),
    .o_io_lcd(io_lcd),
    .o_io_ledg(io_ledg),
    .o_io_ledr(io_ledr),
    .o_io_hex0(io_hex0),
    .o_io_hex1(io_hex1),
    .o_io_hex2(io_hex2),
    .o_io_hex3(io_hex3),
    .o_io_hex4(io_hex4),
    .o_io_hex5(io_hex5),
    .o_io_hex6(io_hex6),
    .o_io_hex7(io_hex7),
    .pc_debug(pc_debug),
    .instruc_test(instruc_test),
    .alu_data(alu_data),
    .rs1_data(rs1_data),
    .rs2_data(rs2_data),
    .wb_data(wb_data),
    .ld_data(ld_data),
//.byte_align(byte_align),
.r26(r26),
.r25(r25)
);

// Task to decode the instruction and print details to a file
task print_instruction;
    input [31:0] instruction;
    input [31:0] pc;
    reg [4:0] rs1, rs2, rd;
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;
    reg [31:0] imm;
    reg [31:0] mem_value;

    begin
        // Decode instruction fields
        opcode = instruction[6:0];
        rd = instruction[11:7];
        funct3 = instruction[14:12];
        rs1 = instruction[19:15];
        rs2 = instruction[24:20];
        funct7 = instruction[31:25];

        // For simplicity, assume the data values (connected to actual regfile/memory in real case)
        mem_value = 0; // Placeholder

        // Determine instruction type
        case (opcode)
            7'b0110011: begin // R-type
                $fdisplay(file, "Instruction_type: R, Address: 0x%0h, Register_source1: %0d = %08h, Register_source2: %0d = %08h, Register_destination: %0d = %08h", 
                    pc, rs1, rs1_data, rs2, rs2_data, rd, alu_data);
            end
            7'b0010011: begin // I-type
                imm = {{20{instruction[31]}}, instruction[31:20]}; // Sign-extend immediate
                $fdisplay(file, "Instruction_type: I, Address: 0x%0h, Register_source1: %0d = %08h, Register_destination: %0d = %08h", 
                    pc, rs1, rs1_data, rd, alu_data);
            end
            7'b0000011: begin // Load-type
                imm = {{20{instruction[31]}}, instruction[31:20]}; // Sign-extend immediate
                $fdisplay(file, "Instruction_type: L, Address: 0x%0h, Register_destination: %0d = %08h, Memory: 0x%0h, Value: 0x%0h", 
                    pc, rd, wb_data, alu_data, ld_data);
            end
            7'b0100011: begin // S-type (Store)
                imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type immediate
                $fdisplay(file, "Instruction_type: S, Address: 0x%0h, Register_source2: %0d = %08h, Memory: 0x%0h", 
                    pc, rs2, rs2_data, alu_data);
            end
            7'b1100011: begin // B-type (Branch)
                imm = {{19{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type immediate
                $fdisplay(file, "Instruction_type: B, Address: 0x%0h, Register_source1: %0d = %08h, Register_source2: %0d = %08h", 
                    pc, rs1, rs1_data, rs2, rs2_data);
            end
            7'b0110111: begin // U-type (LUI)
                imm = {instruction[31:12], 12'b0}; // Upper immediate
                $fdisplay(file, "Instruction_type: U, Address: 0x%0h, Register_destination: %0d = %08h", 
                    pc, rd, wb_data);
            end
	    7'b0010111: begin // U-type (AUIPC)
                imm = {instruction[31:12], 12'b0}; // Upper immediate
                $fdisplay(file, "Instruction_type: U, Address: 0x%0h, Register_destination: %0d = %08h", 
                    pc, rd, wb_data);
            end
            default: begin

                $fdisplay(file, "Unknown instruction type at address: 0x%0h", pc);
            end
        endcase
    end
endtask

// Print instruction at every clock cycle
always @(posedge clk_i) begin
    if (rst_ni) begin
        print_instruction(instruc_test, pc_debug);
    end
end

// Test stimulus
initial begin
    // Initialize inputs
    io_sw = 32'h0;

    // Wait for reset to de-assert
    #30;

    // Apply some test stimulus (you can customize based on your needs)
    io_sw = 32'hA5A5A5A5;

    // Simulate for some time
    $stop;
end

endmodule
