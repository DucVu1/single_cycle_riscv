library verilog;
use verilog.vl_types.all;
entity Single_Cycle is
    port(
        clk_i           : in     vl_logic;
        rst_ni          : in     vl_logic;
        io_sw           : in     vl_logic_vector(31 downto 0);
        io_lcd          : out    vl_logic_vector(7 downto 0);
        io_ledg         : out    vl_logic_vector(8 downto 0);
        io_ledr         : out    vl_logic_vector(17 downto 0);
        io_hex0         : out    vl_logic_vector(6 downto 0);
        io_hex1         : out    vl_logic_vector(6 downto 0);
        io_hex2         : out    vl_logic_vector(6 downto 0);
        io_hex3         : out    vl_logic_vector(6 downto 0);
        io_hex4         : out    vl_logic_vector(6 downto 0);
        io_hex5         : out    vl_logic_vector(6 downto 0);
        io_hex6         : out    vl_logic_vector(6 downto 0);
        io_hex7         : out    vl_logic_vector(6 downto 0);
        pc_debug        : out    vl_logic_vector(31 downto 0);
        instruc_test    : out    vl_logic_vector(31 downto 0);
        wb_mux_out      : out    vl_logic_vector(31 downto 0);
        alu_data_out    : out    vl_logic_vector(31 downto 0);
        rs1             : out    vl_logic_vector(4 downto 0);
        rs2             : out    vl_logic_vector(4 downto 0);
        branch_signal   : out    vl_logic
    );
end Single_Cycle;
