module forward_unit(
                    input logic reset,
                    input logic reg_we_M,
                    input logic reg_we_W,
                    input logic[4:0] rd_M,   
                    input logic[4:0] rd_W,
                    input logic[4:0] rs1_E,
                    input logic[4:0] rs2_E,
                    
                    output logic[1:0] forward_A,
                    output logic[1:0] forward_B
                    );
                    
                    assign forward_A = (reset == 1'b0)?2'b00:
                                       ((reg_we_M == 1'b1) && (rd_M != 5'b00000) && (rd_M == rs1_E))?2'b10:
                                       ((reg_we_W == 1'b1) && (rd_W != 5'b00000) && (rd_W == rs1_E) && ~(reg_we_M == 1'b1) && (rd_M != 5'b00000) && (rd_M == rs1_E))?2'b01:
                                       0;
                    
                    assign forward_B = (reset == 1'b0)?2'b00:
                                       ((reg_we_M == 1'b1) && (rd_M != 5'b00000) && (rd_M == rs2_E))?2'b10:
                                       ((reg_we_W == 1'b1) && (rd_W != 5'b00000) && (rd_W == rs2_E) && ~(reg_we_M == 1'b1) && (rd_M != 5'b00000) && (rd_M == rs2_E))?2'b01:
                                       0;
                                       
endmodule
                                       
                                       