library verilog;
use verilog.vl_types.all;
entity LU_1bit is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Operation       : in     vl_logic_vector(1 downto 0);
        Result          : out    vl_logic
    );
end LU_1bit;
