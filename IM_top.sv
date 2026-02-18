module IM_top(
               input logic clk,
               input logic mem_re,
               input logic mem_we,
               input logic[1:0] mem_store_type,
               input logic[2:0] mem_read_type,
               input logic[31:0] d_in,
               input logic[15:0] addr,
               input logic branch,
               input logic branch_flag,
               output logic pc_src,
               output logic[31:0] d_out
               );
               
               data_memory DM(
                              .clk(clk),
                              .mem_re(mem_re),
                              .mem_we(mem_we),
                              .mem_store_type(mem_store_type),
                              .mem_read_type(mem_read_type),
                              .d_in(d_in),
                              .addr(addr),
                              .d_out(d_out)
                              );
              and_gate andGate(
                               .branch(branch),
                               .branch_flag(branch_flag),
                               .pc_src(pc_src)
                               );

endmodule