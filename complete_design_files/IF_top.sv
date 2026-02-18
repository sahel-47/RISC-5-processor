module IF_top(
              input logic clk,
              input logic reset,
              input logic pc_src,
              input logic pc_write_zero, 
              input logic[15:0] dest_pc,
              output logic[31:0] instr,
              output logic[15:0] pc  ,
              output logic[15:0] pc_plus4            
              );
              
              wire[15:0] pc_new;
//              wire[15:0] pc_plus4;
              
              
              
              instruction_memory IM(
                                    .clk(clk),
                                    .pc(pc),
                                    .instr(instr)
                                    );
              PC Pc(
                    .clk(clk),
                    .reset(reset),
                    .pc_new(pc_new),
                    .pc_write_zero(pc_write_zero),
                    .pc(pc)
                    );
             
             pc_adder_1 PC_adder_1(
                                   .pc(pc),
                                   .pc_plus4(pc_plus4)
                                   );
                                  
             
             pc_new_mux PC_new_mux(
                                   .pc_plus4(pc_plus4),
                                   .dest_pc(dest_pc),
                                   .pc_src(pc_src),
                                   .pc_new(pc_new)
                                   );
                                   
             
endmodule          