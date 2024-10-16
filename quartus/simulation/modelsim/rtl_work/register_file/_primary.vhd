library verilog;
use verilog.vl_types.all;
entity register_file is
    generic(
        DATA_N          : integer := 32;
        SIZE            : integer := 32
    );
    port(
        clk_i           : in     vl_logic;
        rd_wren         : in     vl_logic;
        rd_addr         : in     vl_logic_vector(4 downto 0);
        rs1_addr        : in     vl_logic_vector(4 downto 0);
        rs2_addr        : in     vl_logic_vector(4 downto 0);
        rd_data         : in     vl_logic_vector;
        rs1_data        : out    vl_logic_vector;
        rs2_data        : out    vl_logic_vector;
        r26             : out    vl_logic_vector;
        r25             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_N : constant is 1;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end register_file;
