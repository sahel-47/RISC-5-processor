module instruction_fetch_pipeline(
                                  input logic clk,
                                  input logic reset,
                                  input logic pc_src,
                                  input logic IF_pipeline_write_zero,
                                  input logic pc_write_zero,
                                  input logic[15:0] dest_pc,
                                  output logic[31:0] instr_D,
                                  output logic[15:0] pc_D,
                                  output logic[15:0] pc_plus4D
                                  );
                                  
                                  wire[15:0] pc_IF;
                                  wire[31:0] instr_IF;
                                  wire[15:0] pc_plus4_IF;
                                  
                                  logic[15:0] pc_IFp;
                                  logic[31:0] instr_IFp;
                                  logic[15:0] pc_plus4_IFp;
                                  
                                  IF_top IF_stage(
                                         .clk(clk),
                                         .reset(reset),
                                         .pc_src(pc_src),
                                         .pc_write_zero(pc_write_zero),
                                         .dest_pc(dest_pc),
                                         .instr(instr_IF),
                                         .pc(pc_IF),
                                         .pc_plus4(pc_plus4_IF)
                                         );
                                         
                                always @(posedge clk) begin
                                         
                                         if(reset == 1'b1 || IF_pipeline_write_zero == 1'b1) begin
                                                  pc_IFp <= 0;
                                                  instr_IFp <= 0; 
                                                  pc_plus4_IFp <= 0;
                                         end
                                         
                                         else begin
                                             pc_IFp <= pc_IF;
                                             instr_IFp <= instr_IF;
                                             pc_plus4_IFp <= pc_plus4_IF;
                                         end
                                         
                                 end
                                 
                                 
                                 assign instr_D =  instr_IFp ;
                                 assign pc_D = pc_IFp;
                                 assign pc_plus4D = pc_plus4_IFp;
                      
endmodule
                                 
                                            