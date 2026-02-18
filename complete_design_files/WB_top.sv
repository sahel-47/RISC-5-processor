module WB_top(
              input logic mem_to_reg_W,
              input logic reg_we_W,
              input logic[4:0] rd_W,
              input logic[31:0] ALU_out_W,
              input logic[31:0] d_out_W,
              
              output logic[31:0] final_result
              );
              
              
              mux_result mux_final(
                                   .mem_to_reg(mem_to_reg_W),
                                   .ALU_out(ALU_out_W),
                                   .d_out(d_out_W),
                                   .final_result(final_result)
                                   );
endmodule                                   