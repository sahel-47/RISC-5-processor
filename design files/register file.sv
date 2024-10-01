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
                
                logic[31:0] registers[0:31];
                
                always @(posedge clk or posedge reset) begin
                    if(reset) begin
                        for( int i = 1 ; i <32; i++) begin
                            registers[i] <= 32'b0;
                        end
                    end  
                    
                    else begin
                        if(reg_we && (rd != 5'b00000)) begin
                            registers[rd] <= wd; //REGISTER WRITE
                         end
                    end
                 end
                 
                 always_comb begin
                    
                    if(rs1 == 5'b00000)
                        read_reg1 = 32'b0;
                    else 
                        read_reg1 = registers[rs1];
                        
                    if (rs2 == 5'b00000) 
                        read_reg2 = 32'b0; 
                    else 
                        read_reg2 = registers[rs2];
                 end
                 
endmodule
                        
                        