module decode_pipeline(
                        input logic clk,
                        input logic reset,
                        input logic reg_we_W,//register write enable from WBstage
                        input logic[4:0] rd_W,//dest reg from WB stage
                        input logic[31:0] instr_D,
                        input logic[15:0] pc_D,//D wire
                        input logic[15:0] pc_plus4D,//D wire
                        input logic[31:0] final_result,//data to be written into reg file from WB stage
                        input logic[15:0] jalr_ra,
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
                        output logic[15:0] pc_plus4E,
                        output logic[31:0] read_reg1_E,
                        output logic[31:0] read_reg2_E,
                        output logic[15:0] dest_pc_E,
                        output logic IF_pipeline_write_zero,
                        output logic pc_write_zero                       
                        );
                        
                        
                        //wires between the  modules
                        wire[4:0] rs1, rs2;
                        //intermediate wires between the module and the pipeline reg
                        
                        wire reg_we_D, mem_we_D, mem_re_D, branch_D, mem_to_reg_D, alu_src_D;
                        wire [6:0] ALU_control_D;
                        wire[2:0] mem_read_type_D;
                        wire[1:0] mem_store_type_D;
                        wire[4:0] rs1_D, rs2_D, rd_D;
                        wire[31:0] imm32_final_D;
                        wire[31:0] read_reg1_D, read_reg2_D;
                        wire[15:0] dest_pc_D;
                        
                        
                        //data in pipeline
                        logic reg_we_Dp, mem_we_Dp, mem_re_Dp, branch_Dp, mem_to_reg_Dp, alu_src_Dp;
                        logic [6:0] ALU_control_Dp;
                        logic[2:0] mem_read_type_Dp;
                        logic[1:0] mem_store_type_Dp;
                        logic[4:0] rs1_Dp, rs2_Dp, rd_Dp;
                        logic[31:0] imm32_final_Dp;
                        logic[15:0] pc_Dp;
                        logic[15:0] pc_plus4Dp;
                        logic[31:0] read_reg1_Dp, read_reg2_Dp;
                        logic[15:0] dest_pc_Dp;
                        
                        ID_top id(
                                  .instr(instr_D),
                                  .pc(pc_D),
                                  .jalr_ra(jalr_ra),
                                  .rs1_D(rs1_D),
                                  .rs2_D(rs2_D),
                                  .rd_E(rd_E),
                                  .rs1(rs1_D),
                                  .rs2(rs2_D),
                                  .rd(rd_D),
                                  .imm32_final(imm32_final_D),
                                  .reg_we(reg_we_D),
                                  .mem_we(mem_we_D),
                                  .mem_re(mem_re_D),
                                  .mem_re_E(mem_re_E),
                                  .branch(branch_D),
                                  .mem_to_reg(mem_to_reg_D),
                                  .alu_src(alu_src_D),
                                  .ALU_control(ALU_control_D),
                                  .mem_read_type(mem_read_type_D),
                                  .mem_store_type(mem_store_type_D),
                                  .dest_pc(dest_pc_D),
                                  .pc_write_zero(pc_write_zero),
                                  .IF_pipeline_write_zero(IF_pipeline_write_zero),
                                  .reset(reset)
                                  );
                                  
                        reg_file register_file(
                                               .clk(clk),
                                               .reset(reset),
                                               .reg_we(reg_we_W),
                                               .rd(rd_W),
                                               .rs1(rs1_D),
                                               .rs2(rs2_D),
                                               .wd(final_result),
                                               .read_reg1(read_reg1_D),
                                               .read_reg2(read_reg2_D)
                                               );
                         always @(posedge clk or posedge reset) begin
                                if(reset == 1'b1) begin
                                        reg_we_Dp <= 0;
                                        mem_we_Dp <= 0;
                                        mem_re_Dp <= 0;
                                        branch_Dp <=  0;
                                        mem_to_reg_Dp <= 0;
                                        alu_src_Dp <= 0;
                                        ALU_control_Dp <= 0;     
                                        mem_read_type_Dp <= 0;
                                        mem_store_type_Dp <= 0;
                                        rs1_Dp <= 0;
                                        rs2_Dp <= 0;
                                        rd_Dp <= 0;
                                        imm32_final_Dp <= 0;
                                        pc_Dp <= 0;
                                        pc_plus4Dp <= 0;
                                        read_reg1_Dp <= 0;
                                        read_reg2_Dp <= 0;
                                        dest_pc_Dp <=0;
                                  end
                                  
                                  else begin
                                        reg_we_Dp <= reg_we_D;
                                        mem_we_Dp <= mem_we_D;
                                        mem_re_Dp <= mem_re_D;
                                        branch_Dp <= branch_D;
                                        mem_to_reg_Dp <=  mem_to_reg_D;
                                        alu_src_Dp <=  alu_src_D;
                                        ALU_control_Dp <= ALU_control_D;     
                                        mem_read_type_Dp <= mem_read_type_D;
                                        mem_store_type_Dp <= mem_store_type_D;
                                        rs1_Dp <= rs1_D;
                                        rs2_Dp <= rs2_D;
                                        rd_Dp <= rd_D;
                                        imm32_final_Dp <= imm32_final_D;
                                        pc_Dp <=  pc_D;
                                        pc_plus4Dp <= pc_plus4D;
                                        read_reg1_Dp <= read_reg1_D;
                                        read_reg2_Dp <= read_reg2_D;
                                        dest_pc_Dp <= dest_pc_D;
                                  end
                             
                         end
                         
                         
                         assign reg_we_E = reg_we_Dp;
                         assign mem_we_E = mem_we_Dp;
                         assign mem_re_E = mem_re_Dp;
                         assign branch_E = branch_Dp;
                         assign mem_to_reg_E = mem_to_reg_Dp;
                         assign alu_src_E = alu_src_Dp;
                         assign ALU_control_E =  ALU_control_Dp;
                         assign mem_read_type_E = mem_read_type_Dp;
                         assign mem_store_type_E =  mem_store_type_Dp;
                         assign rs1_E = rs1_Dp;
                         assign rs2_E = rs2_Dp;
                         assign rd_E = rd_Dp;
                         assign imm32_final_E = imm32_final_Dp;
                         assign pc_E =  pc_Dp;
                         assign pc_plus4E =  pc_plus4Dp;
                         assign read_reg1_E = read_reg1_Dp;
                         assign read_reg2_E = read_reg2_Dp;
                         assign dest_pc_E = dest_pc_Dp;
                                        
                                        
endmodule                        
                        
                        
                        
                        