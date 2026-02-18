module instruction_decode(       
                                //inputs from Fetch stage
								 input logic[31:0] instr,
								 input logic[15:0] pc,
								 //output to fetch stage
								 output logic[15:0] dest_pc,
								 //output to regfile		
								 output logic[4:0] rs1,
								 output logic[4:0] rs2,
								 output logic[4:0] rd,
								 //inputs from ALU
								 input logic[15:0] jalr_ra, //ignore
								 //output to ALU
								 output logic[31:0] imm32_final,
								 //to control unit
								 output logic[2:0] funct3,
								 output logic[6:0] funct7,	
								 output logic[6:0] opcode
								 ); 
								 
								 //internal wires
								 
								 wire r_inst_check, i_inst_check, s_inst_check, b_inst_check, u_inst_check, j_inst_check, i_jalr_check;;
								 
								 //validity check wires
								 
								 wire rs1_valid,rs2_valid, imm_valid,funct3_valid,rd_valid,funct7_valid;
								 
								 //Immediate wire declarations
								 
								 wire[11:0] i_imm;
								 wire[6:0] s_msb_imm;
								 wire[4:0] s_lsb_imm;
								 wire[19:0] u_imm;
								 wire[4:0]shamt;	
								 wire[12:0] b_imm;
								 wire[20:0] j_imm;
								 
								 //32 bit immediate value
								 
								 
								 wire[31:0] i_imm_32;
								 wire[31:0] u_imm_32;
								 wire[31:0] s_imm_32;
								 wire[31:0] shamt_32;
								 wire[31:0] b_imm_32;
								 wire[31:0] j_imm_32;		
								 
								 
								  //opcode check
								 assign opcode = instr[6:0];
								  
//								 				
	 
								 
								  //type check					 
								 assign r_inst_check = opcode == 7'b0110011;
								 assign i_inst_check = opcode ==? 7'b00x0011;
								 assign s_inst_check = opcode == 7'b0100011;
								 assign b_inst_check = opcode == 7'b1100011;
								 assign u_inst_check = opcode ==? 7'b0x10111;
								 assign j_inst_check = opcode == 7'b1101111;
								 assign i_jalr_check = opcode ==7'b1100111;			
								 
								 //validity check
								 assign rs1_valid = ~u_inst_check;
								 assign rs2_valid = r_inst_check || s_inst_check || b_inst_check;
								 assign imm_valid = ~r_inst_check;
								 assign funct3_valid = r_inst_check || i_inst_check || s_inst_check || b_inst_check;
								 assign rs1_valid =  r_inst_check || i_inst_check || s_inst_check || b_inst_check;
								 assign funct7_valid = r_inst_check;	
								 assign rd_valid = ~(s_inst_check||b_inst_check);
								 
								 
								 //instruction decoding
								 assign funct7 = (funct7_valid)?instr[31:25]:7'bzzzzzz;
								 assign funct3 = (funct3_valid)?instr[14:12]:3'bzzz;							
								 
								 //read and write registers
								 assign rs1 =(rs1_valid)?instr[19:15]:5'bzzzzz;
								 assign rs2 =(rs2_valid)?instr[24:20]:5'bzzzzz;
								 assign rd = (rd_valid)?instr[11:7]:5'bzzzzz;
								 
								 //immediates calculations
								 
								 assign i_imm = instr[31:20];
								 assign i_imm_32 = {{20{i_imm[11]}},i_imm};
								 assign shamt = instr[24:20];
								 assign shamt_32 = {{27{1'b0}},shamt};
								 assign s_msb_imm = instr[31:25];
								 assign s_lsb_imm = instr[11:7]; 
								 assign s_imm_32 = {{20{s_msb_imm[6]}},{s_msb_imm,s_lsb_imm}};
								 assign u_imm = instr[31:12];
								 assign u_imm_32 = {u_imm,{12{1'b0}}};
								 assign b_imm = {instr[31],instr[19:12],instr[20],instr[30:21],1'b0};
								 assign b_imm_32 = {{19{b_imm[12]}},b_imm};
								 assign j_imm = {instr[31],instr[19:12],instr[20],instr[30:21],1'b0};
								 assign j_imm_32 = {{11{j_imm[20]}},j_imm};
								 
								 //final immediate value
								 assign imm32_final = (i_inst_check && (funct3 == 3'b001||funct3==3'b101))?shamt_32:
								                             (i_inst_check)?i_imm_32:														 
															 (s_inst_check)?s_imm_32:
															 (u_inst_check)?u_imm_32:
															 (b_inst_check)?b_imm_32:
															 (j_inst_check)?j_imm_32:
															 (i_jalr_check)?i_imm_32:
															 0;
															 
								
															 
							// PC + imm ALU	
							assign dest_pc = (b_inst_check)?(pc + b_imm_32[15:0]):
							                 (j_inst_check)?(pc+j_imm_32[15:0]):
							                 (i_jalr_check)?jalr_ra:
							                 0;

                           
                            
									
endmodule
								 
								 
								 
								 
								 
								 
								 
				
	