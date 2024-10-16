library verilog;
use verilog.vl_types.all;
entity AU is
    generic(
        Width           : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Cin             : in     vl_logic;
        Cout            : out    vl_logic;
        Sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end AU;
