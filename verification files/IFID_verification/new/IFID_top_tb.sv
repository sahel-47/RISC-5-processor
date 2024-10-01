module IFID_top_tb();
    
    
                logic clk;
                logic reset;
                logic pc_src;
                
                wire reg_we_E;
                wire mem_we_E;
                wire mem_re_E;
                wire branch_E;
                wire mem_to_reg_E;
                wire alu_src_E;
                wire[6:0] ALU_control_E;
                wire[2:0] mem_read_type_E;
                wire[1:0] mem_store_type_E;
                wire[4:0] rs1_E;
                wire[4:0] rs2_E;
                wire[4:0] rd_E;
                wire[31:0] imm32_final_E;
                wire[15:0] pc_E;
                wire[15:0] pc_plus4_E;
                
                wire[31:0] read_reg1_E;
                wire[31:0] read_reg2_E;
                wire[15:0] dest_pc_E;
                wire IFID_pipeline_write_zero; //HANGING
                wire pc_write_zero; //HANGING
                
                IFID_top DUT(
                                  .clk(clk),
                                  .reset(reset),
                                  .pc_src(pc_src),
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
                                  .dest_pc_E(dest_pc_E)
                                  );
                
   initial begin
            reset = 1;
            pc_src = 0;
            clk = 0;
            
            #10
            clk = 1;
            #10
            clk = 0;
            reset = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            #10
            clk = 1;
            #10
            clk = 0;
            
      end
                          
endmodule
