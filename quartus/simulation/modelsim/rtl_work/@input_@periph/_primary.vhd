library verilog;
use verilog.vl_types.all;
entity Input_Periph is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        i_io_sw         : in     vl_logic_vector(16 downto 0);
        ld_data         : out    vl_logic_vector(31 downto 0)
    );
end Input_Periph;
