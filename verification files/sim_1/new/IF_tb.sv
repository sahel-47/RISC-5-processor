module IF_tb();

logic clk;
logic reset;
logic pc_src;
logic pc_write_zero;
logic[15:0] dest_pc;
wire[31:0] instr;
wire[15:0] pc;

IF_top DUT ( 
            .clk(clk),
            .reset(reset),
            .pc_src(pc_src),
            .pc_write_zero(pc_write_zero),
            .dest_pc(dest_pc),
            .instr(instr),
            .pc(pc)
            
            );
            
function void details();

$display("********************************");
$display("time = %0t",$time);
$display("clk = %0b",clk);
$display("reset = %0b",reset);
$display("pc_src = %0b",pc_src);
$display("pc_write_zero = %0b",pc_write_zero);
$display("dest_pc = %0b",dest_pc);
$display();
$display("instr = %0h",instr);
$display("pc = %0b",pc);

endfunction

initial begin

clk = 0;
reset = 0;
pc_src = 0;
pc_write_zero = 0;
dest_pc = 0;
details();

#10
clk = 1;
reset = 1;
details();

#10

clk = 0;
reset = 0;
details();

#10
clk = 1;
details();

#10

clk = 0;

#10 
clk =1;
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




end


endmodule










