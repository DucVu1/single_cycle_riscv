library verilog;
use verilog.vl_types.all;
entity CLA_16bit is
    generic(
        Width           : integer := 16
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Cin             : in     vl_logic;
        p               : out    vl_logic;
        g               : out    vl_logic;
        Sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end CLA_16bit;
