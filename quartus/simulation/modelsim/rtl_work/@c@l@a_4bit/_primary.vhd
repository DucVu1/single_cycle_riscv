library verilog;
use verilog.vl_types.all;
entity CLA_4bit is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        p               : out    vl_logic;
        g               : out    vl_logic;
        Sum             : out    vl_logic_vector(3 downto 0)
    );
end CLA_4bit;
