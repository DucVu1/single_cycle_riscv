module Immediate_generator #(parameter Width = 32)(
	input logic [Width-1:0] In,
	output logic [Width-1:0] Out);
always_comb begin
	case(In[6:0])
		7'b0000011 : Out = {{(32-12){In[31]}},In[31:20]}; //I-type for load Instruction 
		7'b0100011 : Out = {{(32-12){In[31]}},In[31:25],In[11:7]}; //S-type Instruction
		7'b1100011 : Out = {{(32-13){In[31]}},In[31],In[7],In[30:25],In[11:8], 1'b0}; //B-type Instruction SLA-1bit
		7'b0010011 : Out = {{(32-12){In[31]}},In[31:20]}; //I-type for arithmetic Instruction
		7'b1100111 : Out = {{(32-13){In[31]}},In[31:20], 1'b0}; // Jump 
		7'b1101111 : Out = {{(32-21){In[31]}},In[31],In[19:12],In[20],In[30:21], 1'b0};//Jump and Link
		7'b0110111 : Out = {In[31:12],{(32-20){1'b0}}}; //Load Upper Imm
		7'b0010111 : Out = {In[31:12],{(32-20){1'b0}}}; //Add Upper Imm to PC
	default : Out = 32'd0;
endcase
end
endmodule
