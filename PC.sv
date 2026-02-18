module PC( 
          input logic clk,
          input logic reset,
          input logic[15:0] pc_new,
          input logic pc_write_zero,
          output logic[15:0] pc
          );
          
          always @(posedge clk) begin
                if(reset == 1'b1)
                     pc <= {32{1'b0}};
                else if(pc_write_zero == 1'b1)
                     pc <= pc;
                else
                    pc <= pc_new;      
               
         end
                     
                     
endmodule        
          
          