module Instruction_Memory(
  input logic [31:0] inst_address,   // Instruction address
  output logic [31:0] instruction    // Output instruction
);

  logic [7:0] inst_mem [471:0]; // Instruction memory with 88 bytes of storage

  // Load the instructions from an external file using readmemb
  initial begin
    $readmemh("Instruction_Memory.mif", inst_mem);
  end

  // Fetch the 32-bit instruction from instruction memory
  always @ (inst_address) begin
    instruction[7:0]   = inst_mem[inst_address + 0];
    instruction[15:8]  = inst_mem[inst_address + 1];
    instruction[23:16] = inst_mem[inst_address + 2];
    instruction[31:24] = inst_mem[inst_address + 3];
  end

endmodule

