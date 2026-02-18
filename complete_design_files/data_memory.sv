module data_memory(
                   input logic clk,
                   input logic mem_re,
                   input logic mem_we,
                   input logic[1:0] mem_store_type,
                   input logic[2:0] mem_read_type,
                   input logic[31:0] d_in,
                   input logic[15:0] addr,
                   
                   output logic[31:0] d_out
                   );
                   
                   
                   logic[7:0] memory[2047:0];//16,384 bytes of memory - BYTE ADDRESSABLE
                   
                   always @ (posedge clk) begin
                            if(mem_we) begin
                                
                                if(mem_store_type == 2'b01) begin
                                    memory[addr] <= d_in[7:0];
                                end
                                
                                else if(mem_store_type == 2'b10) begin
                                    memory[addr] <= d_in[7:0];
                                    memory[addr+1] <= d_in[15:8];
                                end
                                
                                else if(mem_store_type == 2'b11) begin
                                    memory[addr] <= d_in[7:0];
                                    memory[addr+1] <= d_in[15:8];
                                    memory[addr+2] <= d_in[23:16];
                                    memory[addr+3] <= d_in[31:24];  
                                end  
                            
                            end
                             
                             else if(mem_re) begin
                             
                                if(mem_read_type == 3'b001) begin//lb
                                    d_out[7:0] <= memory[addr];
                                end
                                
                                else if(mem_read_type == 3'b010) begin //lh
                                    d_out[15:8] <= memory[addr+1];
                                    d_out[7:0] <= memory[addr];
                                end
                                
                                else if(mem_read_type == 3'b011) begin //lw
                                    d_out[31:24] <= memory[addr+3];
                                    d_out[23:16] <= memory[addr+2];
                                    d_out[15:8] <= memory[addr+1];
                                    d_out[7:0] <= memory[addr];
                                end  
                                
                                else if(mem_read_type == 3'b100) begin
                                    if (memory[addr] < 8'd0) begin
                                        d_out = -memory[addr];
                                    end
                                   else begin
                                       d_out = memory[addr];
                                   end                                               
                                end
                             end   
                                
                                else if(mem_read_type == 3'b101) begin
                                    if ({memory[addr+1],memory[addr]} < 16'd0) begin
                                        d_out = -{memory[addr+1],memory[addr]};
                                    end
                                   else begin
                                       d_out = {memory[addr+1],memory[addr]};
                                   end                                                   
                                end 
                       end         
                                                
                            
endmodule
                             



