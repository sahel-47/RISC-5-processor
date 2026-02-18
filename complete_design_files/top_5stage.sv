module top_5stage(
           input logic clk,
           input logic reset
           );
           
           wire[31:0] instr_D;
           wire reg_we_E, reg_we_M, reg_we_W;
           wire[4:0] rd_E, rd_M, rd_W;
           wire alu_src_E;
           wire mem_to_reg_E, mem_to_reg_M, mem_to_reg_W;
           wire[6:0] ALU_control_E;
           wire[2:0] mem_read_type_E, mem_read_type_M;
           wire[1:0] mem_store_type_E, mem_store_type_M;
           wire mem_re_E, mem_re_M;
           wire mem_we_E, mem_we_M;
           wire[4:0] rs1_E, rs2_E;
           wire[31:0] imm32_final_E;
           wire[15:0] pc_E,pc_D;
           wire[15:0] pc_plus4E, pc_plus4M;
           wire branch_flag_M;
           wire branch_E, branch_M;
           wire[31:0] read_reg1_E;
           wire[31:0] read_reg2_E;
           wire[15:0] dest_pc_E;
           wire[31:0] ALU_out_M;
           wire[15:0] dest_pc_M;
           wire[31:0] reg2_din_M;
           
           wire[31:0] ALU_out_W;
           wire[31:0] d_out_W;
           
           wire[31:0] final_result;
           
           wire pc_src;
wire IF_pipeline_write_zero;
wire pc_write_zero;
           
           
           wire [15:0] pc_plus4D; 
        
            wire [15:0] pc_plus4M;
            wire [15:0] pc_plus4D;
           
           instruction_fetch_pipeline IF_stage(
                                               .clk(clk),
                                               .reset(reset),
                                               .pc_src(pc_src),
                                               .IF_pipeline_write_zero(IF_pipeline_write_zero),
                                               .pc_write_zero(pc_write_zero),
                                               .dest_pc(dest_pc_M),
                                               .instr_D(instr_D),
                                               .pc_D(pc_D),
                                               .pc_plus4D(pc_plus4D
                                               );
           
           decode_pipeline ID_stage(
                                    .clk(clk),
                                    .reset(reset),
                                    .reg_we_W(reg_we_W),
                                    .rd_W(rd_W),
                                    .instr_D(instr_D),
                                    .pc_D(pc_D),
                                    .pc_plus4D(pc_plus4D),
                                    .final_result(final_result),
                                    
                                    .reg_we_E(reg_we_E),
                                    .mem_we_E(mem_we_E),
                                    .mem_re_E(mem_re_E),
                                    .branch_E(branch_E),
                                    .mem_to_reg_E(mem_to_reg_E),
                                    .alu_src_E(alu_src_E),
                                    .ALU_control_E(ALU_control_E),
                                    .mem_read_type_E(mem_read_type_E),
                                    .mem_store_type_E(mem_store_type_E),
                                    .rs1_E(rs1_E),
                                    .rs2_E(rs2_E),
                                    .rd_E(rd_E),
                                    .imm32_final_E(imm32_final_E),
                                    .pc_E(pc_E),
                                    .pc_plus4E(pc_plus4E),
                                    .read_reg1_E(read_reg1_E),
                                    .read_reg2_E(read_reg2_E),
                                    .dest_pc_E(dest_pc_E),
                                    .IF_pipeline_write_zero(IF_pipeline_write_zero),
                                    .pc_write_zero(pc_write_zero)
                                    );
           
           execution_pipeline IE_stage(
                                       .clk(clk),
                                       .reset(reset),
                                       .reg_we_E(reg_we_E),
                                       .mem_we_E(mem_we_E),
                                       .mem_re_E(mem_re_E),
                                       .branch_E(branch_E),
                                       .mem_to_reg_E(mem_to_reg_E),
                                       .alu_src_E(alu_src_E),
                                       .ALU_control_E(ALU_control_E),
                                       .mem_read_type_E(mem_read_type_E),
                                       .mem_store_type_E(mem_store_type_E),
                                       .rs1_E(rs1_E),
                                       .rs2_E(rs2_E),
                                       .rd_E(rd_E),
                                       .imm32_final_E(imm32_final_E),
                                       .pc_E(pc_E),
                                       .pc_plus4E(pc_plus4E),
                                       .read_reg1_E(read_reg1_E),
                                       .read_reg2_E(read_reg2_E),
                                       .dest_pc_E(dest_pc_E),
                                       
                                       .branch_flag_M(branch_flag_M),
                                       .branch_M(branch_M),
                                       .reg_we_M(reg_we_M),
                                       .reg_we_W(reg_we_W),
                                       .mem_we_M(mem_we_M),
                                       .mem_re_M(mem_re_M),
                                       .mem_to_reg_M(mem_to_reg_M),
                                       .rd_M(rd_M),
                                       .rd_W(rd_W),
                                       .pc_plus4M(pc_plus4M),
                                       .ALU_out_M(ALU_out_M),
                                       .ALU_out_W(ALU_out_W),
                                       .dest_pc_M(dest_pc_M),
                                       .mem_read_type_M(mem_read_type_M),
                                       .mem_store_type_M(mem_store_type_M),
                                       .reg2_din_M(reg2_din_M)
                                       );
           
           memory_access_pipeline MA_stage(
                                           .reset(reset),
                                           .clk(clk),
                                           .branch_M(branch_M),
                                           .branch_flag_M(branch_flag_M),
                                           .reg_we_M(reg_we_M),
                                           .mem_we_M(mem_we_M),
                                           .mem_re_M(mem_re_M),
                                           .mem_to_reg_M(mem_to_reg_M),
                                           .rd_M(rd_M),
                                           .pc_plus4M(pc_plus4M),
                                           .ALU_out_M(ALU_out_M),
                                           .dest_pc_M(dest_pc_M),
                                           .mem_read_type_M(mem_read_type_M),
                                           .mem_store_type_M(mem_store_type_M),
                                           .reg2_din_M(reg2_din_M),
                                           .mem_to_reg_W(mem_to_reg_W),
                                           .reg_we_W(reg_we_W),
                                           .rd_W(rd_W),
                                           .ALU_out_W(ALU_out_W),
                                           .d_out_W(d_out_W),
                                           .pc_src(pc_src)
                                           );
                                           
           WB_top WB_stage(
                           .reg_we_W(reg_we_W),
                           .mem_to_reg_W(mem_to_reg_W),
                           .rd_W(rd_W),
                           .ALU_out_W(ALU_out_W),
                           .d_out_W(d_out_W),
                           .final_result(final_result)
                           );
                           
endmodule                                                           
                                           
           
           
           
           