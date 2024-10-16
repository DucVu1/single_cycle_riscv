library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        Opcode          : in     vl_logic_vector(6 downto 0);
        Branch          : in     vl_logic;
        br_sel          : out    vl_logic;
        rd_wren         : out    vl_logic;
        op_a_sel        : out    vl_logic;
        op_b_sel        : out    vl_logic;
        mem_wren        : out    vl_logic;
        alu_op          : out    vl_logic_vector(1 downto 0);
        wb_sel          : out    vl_logic_vector(1 downto 0)
    );
end ControlUnit;
