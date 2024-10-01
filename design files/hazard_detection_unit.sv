module hazard_detection_unit(
                             input logic reset,
                             input logic mem_re_E,
                             input logic[4:0] rs1_D,
                             input logic[4:0] rs2_D,
                             input logic[4:0] rd_E,
                             output logic IFID_pipeline_write_zero,
                             output logic stall,
                             output logic pc_write_zero
                             );
                             
                             assign stall = (reset == 1'b1)?1'b0:
                                            ((mem_re_E == 1) && ((rs1_D == rd_E) || (rs2_D == rd_E)))?1'b1:
                                            0;
                                            
                             assign IFID_pipeline_write_zero = (reset == 1'b1)?1'b0:
                                            ((mem_re_E == 1) && ((rs1_D == rd_E) || (rs2_D == rd_E)))?1'b1:
                                            0;
                             
                             assign pc_write_zero = (reset == 1'b1)?1'b0:
                                            ((mem_re_E == 1) && ((rs1_D == rd_E) || (rs2_D == rd_E)))?1'b1:
                                            0;
                   
endmodule