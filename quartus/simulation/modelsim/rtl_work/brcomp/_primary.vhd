library verilog;
use verilog.vl_types.all;
entity brcomp is
    port(
        rs1_data        : in     vl_logic_vector(31 downto 0);
        rs2_data        : in     vl_logic_vector(31 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        Branch          : out    vl_logic
    );
end brcomp;
