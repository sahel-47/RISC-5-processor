module ID_tb();

logic[31:0] instr;
logic[15:0] pc;
logic[15:0] jalr_ra;
logic stall;

wire[15:0] dest_pc;
wire[4:0] rs1;
wire[4:0] rs2;
wire[4:0] rd;
wire[31:0] imm32_final;
wire reg_we;
wire mem_we;
wire mem_re;
wire branch;
wire mem_to_reg;
wire alu_src;
wire[6:0] ALU_control;
wire[2:0] mem_read_type;
wire[1:0] mem_store_type;

ID_top DUT(
           .instr(instr),
           .pc(pc),
           .jalr_ra(jalr_ra),
           .dest_pc(dest_pc),
           .rs1(rs1),
           .rs2(rs2),
           .rd(rd),
           .imm32_final(imm32_final),
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
           
           
           function void details();
            $display("time = %0t",$time);
            $display("INSTRUCTION : %0h",instr);
            $display("PC = %0h",pc);
            $display("JALR return address = %0h",jalr_ra);
            $display("***********************************************");
            $display("dest pc = %0h",dest_pc);
            $display("rs1 = %0d",rs1);
            $display("rs2 = %0d",rs2);
            $display("rd = %0d",rd);
            $display("imm32 final = %0h",imm32_final);
            $display("stall = %0b",stall);
            $display("reg we = %0b",reg_we);
            $display("mem we = %0b",mem_we);
            $display("mem re = %0b",mem_re);
            $display("branch = %0b",branch);
            $display("mem to reg = %0b",mem_to_reg);
            $display("ALU src = %0b",alu_src);
            $display("ALU_control = %0b",ALU_control);
            $display("mem read type = %0b", mem_read_type);
            $display("mem store type = %0b",mem_store_type);
           endfunction
           
initial begin

pc = 0;
jalr_ra = 0;
instr = 32'b0;
stall = 0;

#10

instr = 32'h015a04b3; //add x9, x20, x21 R
details();
#10
instr = 32'h40a48433; //sub x8, x9, x10 R
details();
#10
instr = 32'h00d675b3; //and x11, x12, x13 R  
details();   
#10
instr = 32'h00530623; //sb x5, 12(x6) S
details(); 
#10      
instr = 32'h00741423;  // sh x7, 8(x8) S
details(); 
#10
instr = 32'h00952823; //sw x9, 16(x10) S
details(); 
#10
instr = 32'h00835283; // lhu x5, 8(x6) I
details(); 
#10
instr = 32'h01042383; //lw x7, 16(x8) I
details(); 
#10
instr = 32'h01451483; //lh x9, 20(x10) I
details(); 
#10
instr = 32'h00460583; //lb x11, 4(x12) I
details(); 
#10
instr = 32'h00c30293; //addi x5, x6, 12 I
details(); 
#10
instr = 32'h00447393; //andi x7, x8, 4 I
details(); 
#10
instr = 32'h01456493; //ori x9, x10, 20 I
details(); 
#10
instr = 32'h00164593; //xori x11, x12, 1 I
details(); 
#10
instr = 32'h00628863; //beq x5, x6, 16 B
details();
#10
instr = 32'hfe839ce3; //bne x7, x8, -8
details();
#10
instr = 32'h00a4cc63; //blt x9, x10, 24
details();
end
    
endmodule
