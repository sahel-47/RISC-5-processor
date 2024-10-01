module IF_pipeline_tb();

logic clk;
logic reset;
logic pc_src;
logic IF_pipeline_write_zero;
logic pc_write_zero;
logic[15:0] dest_pc;

wire[31:0] instr_D;
wire[15:0] pc_D;

IF_pipeline IF_block(
                .clk(clk),
                .reset(reset),
                .pc_src(pc_src),
                .IF_pipeline_write_zero(IF_pipeline_write_zero),
                .pc_write_zero(pc_write_zero),
                .dest_pc(dest_pc),
                .instr_D(instr_D),
                .pc_D(pc_D)
                );
                
                
function void details(); 
        $display("time = %0t", $time);
        $display("********INPUTS**********");       
        $display("clk = %0b", clk);
        $display("reset = %0b", reset);
        $display("pc_src = %0b",pc_src);
        $display("IF_pipeline_write_zero = %0b", IF_pipeline_write_zero);
        $display("pc_write_zero = %0b", pc_write_zero);
        $display("dest_pc =%0b",dest_pc);
                
        $display("**********OUTPUTS*********");
        $display("instr_D = %0h",instr_D);
        $display("pc_D = %0d", pc_D);
endfunction

initial begin

clk = 0;
reset = 0;
pc_src = 0;
IF_pipeline_write_zero = 0;
pc_write_zero = 0;
dest_pc = 0;
details();

#10

clk = 1;
reset = 1;
details();

#10
reset = 0;
clk =0;
details();

#10 
clk = 1;
details();

#10 
clk = 0;
details();

#10
clk = 1;
details();

#10 
clk = 0;
details();

#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();


#10
clk = 1;
details();

#10 
clk = 0;
details();

#10
clk = 1;

#10
clk = 0;

#10
clk = 1;

#10
clk = 0;

#10
clk = 1;

#10 
clk = 0;


end

endmodule
         