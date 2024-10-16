library verilog;
use verilog.vl_types.all;
entity clock_divider is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_div4        : out    vl_logic
    );
end clock_divider;
