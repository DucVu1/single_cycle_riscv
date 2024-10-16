library verilog;
use verilog.vl_types.all;
entity barrel_shifter_left_32 is
    port(
        data            : in     vl_logic_vector(31 downto 0);
        amt             : in     vl_logic_vector(4 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end barrel_shifter_left_32;
