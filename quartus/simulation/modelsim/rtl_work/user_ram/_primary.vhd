library verilog;
use verilog.vl_types.all;
entity user_ram is
    generic(
        WORDS           : integer := 2048;
        WIDTH           : integer := 8
    );
    port(
        we              : in     vl_logic;
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector;
        wdata           : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORDS : constant is 1;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end user_ram;
