module mux1(
            input logic[31:0] read_reg1,
            input logic[31:0] EX_MEM_rd,
            input logic[31:0] MEM_WB_rd,
            input logic[1:0] forward_A,
            
            output logic[31:0] opr1
            );
            
            assign opr1 = (forward_A == 2'b00)?read_reg1:
                          (forward_A == 2'b10)?EX_MEM_rd:
                          (forward_A == 2'b01)?MEM_WB_rd:
                          0;

endmodule