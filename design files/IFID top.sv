module IFID_top(
                input logic clk,
                input logic reset,
                
                input logic pc_src,
                
                output logic reg_we_E,
                output logic mem_we_E,
                output logic mem_re_E,
                output logic branch_E,
                output logic mem_to_reg_E,
                output logic alu_src_E,
                output logic[6:0] ALU_control_E,
                output logic[2:0] mem_read_type_E,
                output logic[1:0] mem_store_type_E,
                output logic[4:0] rs1_E,
                output logic[4:0] rs2_E,
                output logic[4:0] rd_E,
                output logic[31:0] imm32_final_E,
                output logic[15:0] pc_E,
                output logic[15:0] pc_plus4_E,
                
                 output logic[31:0] read_reg1_E,
                 output logic[31:0] read_reg2_E,
                 output logic[15:0] dest_pc_E
                 
                
                );
                
                wire[31:0] instr_D;
                wire[15:0] pc_D;
                wire[15:0] pc_plus4_D;
                wire IFID_pipeline_write_zero; //HANGING
                wire pc_write_zero; //HANGING
                
                
                IF_pipeline IF_PIPELINE(
                                        .clk(clk),
                                        .reset(reset),
                                        .pc_src(pc_src), //BRUHHH
                                        .IFID_pipeline_write_zero(IFID_pipeline_write_zero),// HANGING
                                        .pc_write_zero(pc_write_zero),//HANGING
                                        .dest_pc(dest_pc),//HANGING
                                        
                                        .instr_D(instr_D),
                                        .pc_D(pc_D),
                                        .pc_plus4_D(pc_plus4_D)
                                        );
                
                ID_pipeline ID_PIPELINE(
                                        .clk(clk),
                                        .reset(reset),
                                        .instr_D(instr_D),
                                        .pc_D(pc_D),
                                        .pc_plus4_D(pc_plus4_D),
                                        .jalr_ra(jalr_ra), //HANGING 
                                        .final_result(final_result), //HANGING
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
                                        .pc_plus4_E(pc_plus4_E),
                                        .read_reg1_E(read_reg1_E),
                                        .read_reg2_E(read_reg2_E),
                                        .dest_pc_E(dest_pc_E),
                                        .IFID_pipeline_write_zero(IFID_pipeline_write_zero),
                                        .pc_write_zero(pc_write_zero)
                                        );
                                        
                                        
                                        
endmodule                       