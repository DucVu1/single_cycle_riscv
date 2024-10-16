library verilog;
use verilog.vl_types.all;
entity Single_Cycle is
    port(
        clk_ram         : in     vl_logic;
        rst_ni          : in     vl_logic;
        i_io_sw         : in     vl_logic_vector(16 downto 0);
        o_io_lcd        : out    vl_logic_vector(11 downto 0);
        o_io_ledg       : out    vl_logic_vector(7 downto 0);
        o_io_ledr       : out    vl_logic_vector(16 downto 0);
        o_io_hex0       : out    vl_logic_vector(6 downto 0);
        o_io_hex1       : out    vl_logic_vector(6 downto 0);
        o_io_hex2       : out    vl_logic_vector(6 downto 0);
        o_io_hex3       : out    vl_logic_vector(6 downto 0);
        o_io_hex4       : out    vl_logic_vector(6 downto 0);
        o_io_hex5       : out    vl_logic_vector(6 downto 0);
        o_io_hex6       : out    vl_logic_vector(6 downto 0);
        o_io_hex7       : out    vl_logic_vector(6 downto 0);
        rs1_data        : out    vl_logic_vector(31 downto 0);
        rs2_data        : out    vl_logic_vector(31 downto 0);
        pc_debug        : out    vl_logic_vector(31 downto 0);
        instruc_test    : out    vl_logic_vector(31 downto 0);
        wb_data         : out    vl_logic_vector(31 downto 0);
        alu_data        : out    vl_logic_vector(31 downto 0);
        ld_data         : out    vl_logic_vector(31 downto 0);
        r26             : out    vl_logic_vector(31 downto 0);
        r25             : out    vl_logic_vector(31 downto 0);
        clk_i           : out    vl_logic
    );
end Single_Cycle;
