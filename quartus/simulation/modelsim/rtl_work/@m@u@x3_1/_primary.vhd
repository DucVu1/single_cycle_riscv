library verilog;
use verilog.vl_types.all;
entity MUX3_1 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C               : in     vl_logic_vector(31 downto 0);
        D               : in     vl_logic_vector(31 downto 0);
        Option          : in     vl_logic_vector(1 downto 0);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end MUX3_1;
