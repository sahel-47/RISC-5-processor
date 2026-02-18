module memory_access_pipeline(
                              input logic branch_flag_M,
                              input logic reset,
                              input logic clk,
                              input logic branch_M,
                              input logic reg_we_M,
                              input logic mem_we_M,
                              input logic mem_re_M,
                              input logic mem_to_reg_M,
                              input logic[4:0] rd_M,
                              input logic[15:0] pc_plus4M,
                              input logic[31:0] ALU_out_M,
                              input logic[15:0] dest_pc_M,
                              input logic[2:0] mem_read_type_M,
                              input logic[1:0] mem_store_type_M,
                              input logic[31:0] reg2_din_M,
                              
                              output logic mem_to_reg_W,
                              output logic reg_we_W,
                              output logic[4:0] rd_W,
                              output logic[31:0] ALU_out_W,
                              output logic[31:0] d_out_W,
                              output logic pc_src
                              );
                              
                            wire[31:0] d_out_M;
                           
                            
                            logic mem_to_reg_Mp;
                            logic reg_we_Mp;
                            logic[4:0] rd_Mp;
                            logic[31:0] ALU_out_Mp;
                            logic[31:0] d_out_Mp;
                            
                            IM_top imt(
                                       .clk(clk),
                                       .mem_re(mem_re_M),
                                       .mem_we(mem_we_M),
                                       .mem_store_type(mem_store_type_M),
                                       .mem_read_type(mem_read_type_M),
                                       .d_in(reg2_din_M),
                                       .addr(ALU_out_M),
                                       .branch(branch_M),
                                       .branch_flag(branch_flag_M),
                                       .pc_src(pc_src),
                                       .d_out(d_out_M)
                                       );
                                       
                            always @(posedge clk or posedge reset) begin
                                    if(reset == 1'b1) begin
                                           mem_to_reg_Mp <= 0;
                                           reg_we_Mp <= 0;
                                           rd_Mp <= 0;
                                           ALU_out_Mp <= 0;
                                           d_out_Mp <= 0;
                                    end
                                    
                                    else begin
                                           mem_to_reg_Mp <= mem_to_reg_M;
                                           reg_we_Mp <= reg_we_M;
                                           rd_Mp <= rd_M;
                                           ALU_out_Mp <= ALU_out_M;
                                           d_out_Mp <= d_out_M;
                                    end            
                            
                            end
                            
                            assign mem_to_reg_W = mem_to_reg_Mp;
                            assign reg_we_W = reg_we_Mp;
                            assign rd_W = rd_Mp;
                            assign ALU_out_W = ALU_out_Mp;
                            assign d_out_W = d_out_Mp;
                                       
endmodule
                              