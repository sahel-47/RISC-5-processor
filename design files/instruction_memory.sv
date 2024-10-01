module instruction_memory(

                          input logic[15:0] pc,
                          input logic clk,
                          output logic[31:0] instr
                          );
                          
                          logic[31:0] memory[2047:0] ;
                          //16 bits can address 65,536 locations
                          
                          
                          always @(posedge clk) begin
                                
                                    instr <= memory[pc[15:2]];
                                    
                          end
                          
                          initial begin
                          
                          memory[0] = 32'h015a04b3; //add x9, x20, x21 R
                          memory[1] = 32'h40a48433; //sub x8, x9, x10 R
                          memory[2] = 32'h00d675b3; //and x11, x12, x13 R  
                          memory[3] = 32'h00530623; //sb x5, 12(x6) S
                          memory[4] = 32'h00741423;  // sh x7, 8(x8) S
                          memory[5] = 32'h00952823; //sw x9, 16(x10) S
                          memory[6] = 32'h00835283; // lhu x5, 8(x6) I
                          memory[7] = 32'h01042383; //lw x7, 16(x8) I
                          memory[8] = 32'hfe839ce3; //bne x7, x8, -8
                          memory[9] = 32'h00460583; //lb x11, 4(x12) I
                          memory[10] = 32'h00c30293; //addi x5, x6, 12 I
                          memory[11] = 32'h01451483; //lh x9, 20(x10) I
                          memory[12] = 32'h01456493; //ori x9, x10, 20 I
                          memory[13] = 32'h00164593; //xori x11, x12, 1 I
                          memory[14] = 32'h00628863; //beq x5, x6, 16 B
                          memory[15] = 32'h00447393; //andi x7, x8, 4 I
                          memory[16] = 32'h00a4cc63; //blt x9, x10, 24
                          end
                          
endmodule
                          