library verilog;
use verilog.vl_types.all;
entity LED is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        st_en           : in     vl_logic;
        addr            : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        st_data         : in     vl_logic_vector(16 downto 0);
        o_io_ledr       : out    vl_logic_vector(16 downto 0);
        o_io_ledg       : out    vl_logic_vector(7 downto 0)
    );
end LED;
