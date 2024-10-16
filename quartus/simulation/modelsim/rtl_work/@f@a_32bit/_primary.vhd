library verilog;
use verilog.vl_types.all;
entity FA_32bit is
    generic(
        N               : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Cin             : in     vl_logic;
        S               : out    vl_logic_vector;
        Cout            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end FA_32bit;
