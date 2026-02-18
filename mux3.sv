module mux3(
            input logic[31:0] imm32_final,
            input logic[31:0] mux2_result,   
            input logic alu_src,
            
            output logic[31:0] opr2
            );
            
            assign opr2 = (alu_src == 1'b0)?mux2_result:
                          (alu_src == 1'b1)?imm32_final:
                          0;
                          
endmodule