module instruction_memory(
                          input logic [15:0] pc,
                          input logic clk,
                          output logic[31:0] instr
                          );
                          
                          logic[31:0] memory[2047:0];
                          
                          always @(posedge clk) begin
                                  
                                 instr <= memory[pc[15:2]];
                                 
                          end
                          
                          initial begin
                          memory[0] = 32'b0000000_01001_10101_000_01001_0110011;
                          memory[1] = 32'b000000000001_01001_000_01001_0010011;
                          memory[2] = 32'b0000011_01001_01010_010_11000_0100011;
                          memory[3] = 32'b00000000010000011010000100000011;
                          memory[4] = 32'b00110000101010011000101001100011;
                          end
endmodule


                          