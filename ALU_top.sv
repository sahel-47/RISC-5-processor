module ALU_top(
               input reset,
               input logic[31:0] read_reg1,
               input logic[31:0] read_reg2,
               input logic[31:0] EX_MEM_rd,
               input logic[31:0] MEM_WB_rd,
               input logic alu_src,
               input logic[6:0] ALU_control,
               input logic reg_we_M,
               input logic reg_we_W,
               input logic[4:0] rd_M,
               input logic[4:0] rd_W,
               input logic[4:0] rs1_E,
               input logic[4:0] rs2_E,
               input logic[31:0] imm32_final,

               output logic[31:0] ALU_out,
               output logic branch_flag
               );
               
               wire[31:0] opr1, opr2, mux2_result;
               wire[1:0] forward_A, forward_B;
               
               ALU ab(
                      .opr1(opr1),
                      .opr2(opr2),
                      .ALU_control(ALU_control),
                      .branch_flag(branch_flag),
                      .ALU_out(ALU_out)
                      );
                      
                mux1 m1(
                        .read_reg1(read_reg1),
                        .EX_MEM_rd(EX_MEM_rd),
                        .MEM_WB_rd(MEM_WB_rd),
                        .forward_A(forward_A),
                        .opr1(opr1)
                        );
               
                mux2 m2(
                        .read_reg2(read_reg2),
                        .EX_MEM_rd(EX_MEM_rd),
                        .MEM_WB_rd(MEM_WB_rd),
                        .forward_B(forward_B),
                        .mux2_result(mux2_result)
                        );
                        
                mux3 m3(
                        .imm32_final(imm32_final),
                        .mux2_result(mux2_result),
                        .alu_src(alu_src),
                        .opr2(opr2)
                        );
                        
                forward_unit forwardUnit(
                                        .reg_we_M(reg_we_M),
                                        .reg_we_W(reg_we_W),
                                        .rd_M(rd_M),
                                        .rd_W(rd_W),
                                        .rs1_E(rs1_E),
                                        .rs2_E(rs2_E),
                                        .forward_A(forward_A),
                                        .forward_B(forward_B),
                                        .reset(reset)
                                        );
                                        
endmodule
                        
              