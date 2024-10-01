module control_unit(
                    input logic[6:0] opcode,
                    input logic[6:0] funct7,
                    input logic[2:0] funct3,
                    input stall,
                    
                    output logic reg_we,
                    output logic mem_we,
                    output logic mem_re,
                    output logic branch,
                    output logic mem_to_reg,
                    output logic alu_src,
                    output logic[6:0] ALU_control,
                    output logic[2:0] mem_read_type,
                    output logic[1:0] mem_store_type
                    
                    );
                    
                          /*
                          
						  mem read type 		mem store type
						  lb = 3'b001        sb = 2'b01 
						  lh = 3'b010        sh = 2'b10
						  lw = 3'b011        sw = 2'b11
						  lbu = 3'b100       default = 2'b00
						  lhu = 3'b101
						  default = 3'b000
						  
						  */
				    
				    always @(*) begin
				        case(opcode)
				            
				            7'b0110011 : begin //R - type
				                reg_we = 1;
				                mem_we = 0;
				                mem_re = 0;
				                branch = 0;
				                mem_to_reg = 0;
				                alu_src = 0;
				                mem_store_type = 2'b00;
				                mem_read_type = 3'b000;
				                
				                if(funct3 == 3'b000) begin
				                    if(funct7 == 7'b0000000) begin
				                        ALU_control = 7'b0000000; //add
				                    end
				                    
				                    else begin
				                        ALU_control = 7'b0001000; //sub
				                    end
				                end
				                else if(funct3 == 3'b010) begin
				                    ALU_control = 7'b0000010; //slt
				                end
				                else if(funct3 == 3'b100) begin
				                    ALU_control = 7'b0000100; //xor
				                end
				                else if(funct3 == 3'b111) begin
				                    ALU_control = 7'b0000111; //and
				                end
				                else if(funct3 == 3'b001) begin
				                    ALU_control = 7'b0000001; //sll
				                end
				                else if(funct3 == 3'b011) begin
				                    ALU_control = 7'b0000010; //sltu
				                end
				                else if(funct3 == 3'b110) begin
				                    ALU_control = 7'b0000110; //or
				                end
				                
				                else if(funct3 == 3'b101) begin
				                    if(funct7 == 7'b0000000) begin
				                        ALU_control = 7'b000101;//srl
				                    end
				                    else begin
				                        ALU_control = 7'b001101;//sra
				                    end
				               end     
				            end      
				            
				            7'b0010011: begin //9 instructions I type
				                reg_we = 1;
				                mem_we = 0;
				                mem_re = 0;
				                branch = 0;
				                mem_to_reg = 0;
				                alu_src = 1;
				                mem_store_type = 2'b00;
				                mem_read_type = 3'b000;
				                
				                if(funct3 == 3'b000) begin
				                    ALU_control = 7'b0000000; //addi
				                end
				                else if(funct3 == 3'b110) begin
				                    ALU_control = 7'b0000110;//ori
				                end
				                else if(funct3 == 3'b111) begin
				                    ALU_control = 7'b0000111; //andi
				                end
				                else if(funct3 == 3'b100) begin
				                    ALU_control = 7'b0000100; //xori
				                end
				                else if(funct3 == 3'b011) begin
				                    ALU_control = 7'b0000011; //sltiu
				                end
				                else if(funct3 == 3'b010) begin
				                    ALU_control = 7'b0000011;//slti
				                end
				                else if(funct3 == 3'b001) begin
				                    ALU_control = 7'b0000001; //slli
				                end
				                else if(funct3 == 3'b101) begin
				                    if(funct7 == 7'b0000000) begin
				                        ALU_control = 7'b0000101; //srli
				                    end
				                    else begin
				                        ALU_control = 7'b0001101;//srai
				                    end
				                end    
	                      	end		
                    
                    
                            7'b0000011: begin //load
                                reg_we = 1;
                                mem_we = 0;
                                mem_re = 1;
                                branch = 0;
                                mem_to_reg = 1;
                                alu_src = 1;
                                
                                ALU_control = 7'b0000000;
                                mem_store_type = 2'b00;
                                
                                if(funct3 == 3'b000) begin
                                    mem_read_type = 3'b001; //lb
                                end
                                
                                else if(funct3 == 3'b001) begin
                                    mem_read_type = 3'b010; //lh
                                end
                                
                                else if(funct3 == 3'b010) begin
                                    mem_read_type = 3'b011; //lw
                                end
                                
                                else if(funct3 == 3'b100) begin
                                    mem_read_type = 3'b100; //lbu
                                end
                                
                                else if(funct3 == 3'b101) begin
                                    mem_read_type = 3'b101; //lhu
                                end
                            
                            end    
                            
                            7'b0100011: begin //store
                                reg_we = 0;
                                mem_we = 1;
                                mem_re = 0;
                                branch = 0;
                                mem_to_reg = 1'bx;
                                alu_src = 1;
                                ALU_control = 7'b0000000;
                                mem_read_type = 3'b000;
                                
                                
                                if(funct3 == 3'b00) begin
                                    mem_store_type = 2'b01; //sb
                                end
                                
                                if(funct3 == 3'b001) begin
                                    mem_store_type = 2'b10; //sh
                                end
                                
                                if(funct3 == 3'b010) begin
                                    mem_store_type = 2'b11; // sw
                                end
                            end
                            
                            //RIS implemented
                            
                            7'b1100011: begin // B - type
                                reg_we = 0;
                                mem_we = 0;
                                mem_re = 0;
                                branch = 1;
                                mem_to_reg = 1'bx;
                                alu_src = 0;
                                mem_read_type = 3'b000;    
                                mem_store_type = 2'b00;
                                
                                if(funct3 == 3'b000) begin
                                    ALU_control = 7'b0010000; //BEQ
                                end
                                
                                else if(funct3 == 3'b001) begin
                                    ALU_control = 7'b0010001; //BNE
                                end
                                
                                else if(funct3 == 3'b100) begin 
                                    ALU_control = 7'b0000010; //BLT
                                end
                                
                                else if(funct3 == 3'b101) begin
                                    ALU_control = 7'b0010101;//BGE
                                end
                                
                                else if(funct3 == 3'b110) begin
                                    ALU_control = 7'b0010110; //BLTU
                                end
                                
                                else if(funct3 == 3'b111) begin
                                    ALU_control = 7'b0010111; //BGEU
                                end
                            end
                            
                            7'b1101111: begin //jal
								    reg_we = 1;
									mem_we = 0;
									mem_re = 0;
									branch = 1;
									mem_to_reg = 0;
									alu_src = 1;   
									mem_read_type = 3'b000;
									mem_store_type = 2'b00;
									
									ALU_control = 7'b0011111;
							end
							
							7'b1100111: begin //jalr
								    reg_we = 1;
									mem_we = 0;
									mem_re = 0;
									branch = 1;
									mem_to_reg = 0;
									alu_src = 1;
									mem_read_type = 3'b000;
									mem_store_type = 2'b00;
									
									 ALU_control = 7'b0111111;
							end
							
							7'b0x10111:begin//lui and auipc
								  reg_we = 1;
								  mem_we = 0;
								  mem_re = 0;
								  branch = 0;
								  mem_to_reg = 0;
								  alu_src = 1;  
								  mem_read_type = 3'b000;
								  mem_store_type = 2'b00;
								  
								  ALU_control = 7'b000000;
								end
										  
						  endcase
						  						  
						  end
						  //hazard unit inputs
						 always @(posedge stall) begin
						    if(stall) begin
						      reg_we = 1'b0;
							  mem_we = 1'b0;
							  mem_re = 1'b0;
							  branch = 1'b0;
						      mem_to_reg = 1'b0;
							  alu_src = 1'b0;  
							  mem_read_type = 3'b000;
							  mem_store_type = 2'b00;
							end
						  end
endmodule
                                
                                