library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        Width           : integer := 32
    );
    port(
        Operation       : in     vl_logic_vector(2 downto 0);
        Cin             : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Width : constant is 1;
end ALU;
