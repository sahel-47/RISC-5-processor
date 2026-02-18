module mux2(
            input logic[31:0] read_reg2,
            input logic[31:0] EX_MEM_rd,
            input logic[31:0] MEM_WB_rd,
            input logic[1:0] forward_B,
            
            output logic[31:0] mux2_result
            );
            
            assign mux2_result = (forward_B == 2'b00)?read_reg2:
                                 (forward_B == 2'b10)?EX_MEM_rd:
                                 (forward_B == 2'b01)?MEM_WB_rd:
                                 0;
endmodule