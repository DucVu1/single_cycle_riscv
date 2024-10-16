library verilog;
use verilog.vl_types.all;
entity LCD is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        st_en           : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        st_data         : in     vl_logic_vector(31 downto 0);
        o_io_lcd        : out    vl_logic_vector(11 downto 0)
    );
end LCD;
