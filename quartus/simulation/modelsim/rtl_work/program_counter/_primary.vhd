library verilog;
use verilog.vl_types.all;
entity program_counter is
    generic(
        Width           : integer := 32
    );
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        PC_in           : in     vl_logic_vector;
        PC_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end program_counter;
