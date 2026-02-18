module and_gate(
                input logic branch,
                input logic branch_flag,
                output logic pc_src
                );
                
                assign pc_src = branch & branch_flag;
                


endmodule
