module reg_file(
                input clk,
                input reset,
                input reg_we,
                input logic[4:0] rd,
                input logic[4:0] rs1,
                input logic[4:0] rs2,
                input logic[31:0] wd,
                output logic[31:0] read_reg1,
                output logic[31:0] read_reg2
                );
                
                logic [31:0] registers[31:0];
                
                always @(posedge clk) begin
                    if(reset) begin
                        registers[0] <= 0;
                    end
                    
                    else begin
                        if(reg_we && (rd!=5'b00000)) begin
                            registers[rd] <= wd;
                        end
                     end
                 end
                 
                 assign read_reg1 = registers[rs1];
                 assign read_reg2 = registers[rs2];
                 
endmodule