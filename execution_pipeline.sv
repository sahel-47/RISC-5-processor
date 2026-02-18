module execution_pipeline(
                        input clk,
                        input reset,
                        input logic reg_we_E,
                        input logic reg_we_W,
                        input logic mem_we_E,
                        input logic mem_re_E,
                        input logic branch_E,
                        input logic mem_to_reg_E,
                        input logic alu_src_E,
                        input logic[4:0] rd_W,
                        input logic[6:0] ALU_control_E,
                        input logic[2:0] mem_read_type_E,
                        input logic[1:0] mem_store_type_E,
                        input logic[4:0] rs1_E,
                        input logic[4:0] rs2_E,
                        input logic[4:0] rd_E,
                        input logic[31:0] imm32_final_E,
                        input logic[15:0] pc_E,
                        input logic[15:0] pc_plus4E,
                        input logic[31:0] read_reg1_E,
                        input logic[31:0] read_reg2_E,
                        input logic[15:0] dest_pc_E,
                        input logic[31:0] ALU_out_W,
                        
                        output logic branch_flag_M,
                        output logic branch_M,
                        output logic reg_we_M,
                        output logic mem_we_M,
                        output logic mem_re_M,
                        output logic mem_to_reg_M,
                        output logic[4:0] rd_M,
                        output logic[15:0] pc_plus4M,
                        output logic[31:0] ALU_out_M,
                        output logic[15:0] dest_pc_M,
                        output logic[2:0] mem_read_type_M,
                        output logic[1:0] mem_store_type_M,
                        output logic[31:0] reg2_din_M
                        
                        );
                        
                        wire[31:0] ALU_out_E;
                        wire branch_flag_E;
                      
                        logic[31:0] ALU_out_Ep;
                        logic branch_flag_Ep;
                        logic branch_Ep;
                        logic reg_we_Ep;
                        logic mem_we_Ep;
                        logic mem_re_Ep;
                        logic mem_to_reg_Ep;
                        logic[4:0] rd_Ep;
                        logic[15:0] pc_plus4Ep;
                        logic[15:0] dest_pc_Ep;
                        logic[2:0] mem_read_type_Ep;
                        logic[1:0] mem_store_type_Ep;
                        logic[31:0] reg2_din_Ep;
                        
                        ALU_top alu_top(
                                        .reset(reset),
                                        .read_reg1(read_reg1_E),
                                        .read_reg2(read_reg2_E),
                                        .EX_MEM_rd(ALU_out_M),
                                        .MEM_WB_rd(ALU_out_W),
                                        .alu_src(alu_src_E),
                                        .ALU_control(ALU_control_E),
                                        .reg_we_M(reg_we_M),
                                        .reg_we_W(reg_we_W),
                                        .rd_M(rd_M),
                                        .rd_W(rd_W),
                                        .rs1_E(rs1_E),
                                        .rs2_E(rs2_E),
                                        .imm32_final(imm32_final_E),
                                        .ALU_out(ALU_out_E),
                                        .branch_flag(branch_flag_E)
                                        );
                                        
                                        always @(posedge clk or posedge reset) begin
                                                if(reset == 1'b1) begin
                                                         branch_flag_Ep <= 0;
                                                         branch_Ep <= 0;
                                                         reg_we_Ep <= 0;
                                                         mem_we_Ep <= 0;
                                                         mem_re_Ep <= 0;
                                                         mem_to_reg_Ep <= 0;
                                                         rd_Ep <= 0;
                                                         pc_plus4Ep <= 0;
                                                         ALU_out_Ep <= 0;
                                                         dest_pc_Ep <= 0;
                                                         mem_read_type_Ep <= 0;
                                                         mem_store_type_Ep <= 0;
                                                         reg2_din_Ep <= 0;
                                                 end   
                                                 
                                                 else begin
                                                         ALU_out_Ep <= ALU_out_E;
                                                         branch_flag_Ep <= branch_flag_E;
                                                         branch_Ep <= branch_E;
                                                         reg_we_Ep <= reg_we_E;
                                                         mem_we_Ep <=  mem_we_E;
                                                         mem_re_Ep <= mem_re_E;
                                                         mem_to_reg_Ep <= mem_to_reg_E;
                                                         rd_Ep <= rd_E;
                                                         pc_plus4Ep <= pc_plus4E;
                                                         ALU_out_Ep <= ALU_out_E;
                                                         dest_pc_Ep <= dest_pc_E; 
                                                         mem_read_type_Ep <=  mem_read_type_E;
                                                         mem_store_type_Ep <= mem_store_type_E;
                                                         reg2_din_Ep <=  read_reg2_E;     
                                                end
                                                
                                        end
                                        
                                       assign branch_flag_M = branch_flag_Ep;
                                       assign  branch_M = branch_Ep;
                                       assign  reg_we_M = reg_we_Ep;
                                       assign  mem_we_M = mem_we_Ep;
                                       assign  mem_re_M = mem_re_Ep;
                                       assign  mem_to_reg_M = mem_to_reg_Ep;
                                       assign  rd_M = rd_Ep;
                                       assign  pc_plus4M = pc_plus4Ep;
                                       assign  ALU_out_M = ALU_out_Ep;
                                       assign  dest_pc_M = dest_pc_Ep;
                                       assign mem_read_type_M = mem_read_type_Ep;
                                       assign mem_store_type_M = mem_store_type_Ep;
                                       assign reg2_din_M =  reg2_din_Ep;
                        
                        
                        
                        
endmodule
