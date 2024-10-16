library verilog;
use verilog.vl_types.all;
entity ALU_Control is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        funct7          : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        Operation       : out    vl_logic_vector(3 downto 0)
    );
end ALU_Control;
