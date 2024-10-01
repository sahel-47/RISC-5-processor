module ID_top(
              //INSTRUCTION DECODE INPUTS
              input logic[31:0] instr,
              input logic[15:0] pc,
              input logic[15:0] jalr_ra,
              input logic reset,
              
              //INPUT TO HAZ DET UNIT FROM IDEX PIPELINE
              input logic mem_re_E, 
              input logic[4:0] rd_E,
              //INSTRUCTION DECODE OUTPUTS
              
              output logic[15:0] dest_pc,//TO IF STAGE (CHECK)
              
              output logic[4:0] rs1, // TO REG FILE
              output logic[4:0] rs2, //TO REG FILE
              output logic[4:0] rd, //TO REG FILE
              
              output logic[31:0] imm32_final, //TO ALU
              
              
              //CONTROL UNIT INPUTS
             
              
              //CONTROL UNIT OUTPUTS
               output logic reg_we,
               output logic mem_we,
               output logic mem_re,
               output logic branch,
               output logic mem_to_reg,
               output logic alu_src,
               output logic[6:0] ALU_control,
               output logic[2:0] mem_read_type,
               output logic[1:0] mem_store_type,
               
               //HAZARD DETECTION UNIT OUT PUTS
               output logic IFID_pipeline_write_zero, 
               output logic pc_write_zero    
             );
             
             wire[2:0] funct3;
             wire[6:0] funct7;
             wire[6:0] opcode;
             wire stall;  
         
             
             
             
             
             instruction_decode INSTRUCTION_DECODE(
                                         .instr(instr),
                                         .pc(pc),
                                         .jalr_ra(jalr_ra),
                                         .dest_pc(dest_pc),
                                         .rs1(rs1),
                                         .rs2(rs2),
                                         .rd(rd),
                                         .imm32_final(imm32_final),
                                         .opcode(opcode),
                                         .funct7(funct7),
                                         .funct3(funct3)
                                         );
              
             control_unit CONTROL_UNIT(
                                       .opcode(opcode),
                                       .funct7(funct7),
                                       .funct3(funct3),
                                       .stall(stall),
                                       .reg_we(reg_we),
                                       .mem_we(mem_we),
                                       .mem_re(mem_re),
                                       .branch(branch),
                                       .mem_to_reg(mem_to_reg),
                                       .alu_src(alu_src),
                                       .ALU_control(ALU_control),
                                       .mem_read_type(mem_read_type),
                                       .mem_store_type(mem_store_type) 
                                      );
                                      
              hazard_detection_unit HAZARD_DETECTION_UNIT(
                                                          .reset(reset),
                                                          .mem_re_E(mem_re_E),
                                                          .rs1_D(rs1),
                                                          .rs2_D(rs2),
                                                          .rd_E(rd_E),
                                                          .IFID_pipeline_write_zero(IFID_pipeline_write_zero),
                                                          .stall(stall),
                                                          .pc_write_zero(pc_write_zero)
                                                          );
              
              
endmodule             