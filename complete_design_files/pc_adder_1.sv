module pc_adder_1(
                  input logic[15:0] pc,
                  output logic[15:0] pc_plus4
                  );
                  
                  assign pc_plus4 = pc + 16'b0000_0000_0000_0100;
endmodule