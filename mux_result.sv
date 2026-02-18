module mux_result(
                  input logic mem_to_reg,
                  input logic[31:0] d_out,
                  input logic[31:0] ALU_out,
                  output logic[31:0] final_result
                  );
                  
                  assign final_result = (mem_to_reg)?d_out : ALU_out;
                  
endmodule