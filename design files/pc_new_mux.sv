module pc_new_mux(
                  input logic[15:0] pc_plus4,
                  input logic[15:0] dest_pc,
                  input logic pc_src,
                  output logic[15:0] pc_new
                  );
                  
                 assign pc_new = (pc_src)?dest_pc : pc_plus4;
endmodule