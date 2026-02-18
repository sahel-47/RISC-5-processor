module ALU(
           input logic[31:0] opr1,
           input logic[31:0] opr2,
           input logic[6:0] ALU_control,
           output logic branch_flag,
           output[31:0] ALU_out
           );
           
           wire signed[31:0] s_op_1, s_op_2;
           wire SLT, SGTE;
           
           assign s_op_1 = $signed(opr1);
           assign s_op_2 = $signed(opr2);
           
           assign SLT = s_op_1 < s_op_2;
           assign SGTE = s_op_1 >= s_op_2;
           
           assign ALU_out = (ALU_control == 7'b0000000)?(opr1 + opr2):
                            (ALU_control == 7'b0001000)?(opr1 - opr2):
                            (ALU_control == 7'b0000010)?(SLT):
                            (ALU_control == 7'b0010110 || ALU_control == 7'b0000011)?(opr1 < opr2):
                            (ALU_control == 7'b0010101)?(SGTE):
                            (ALU_control == 7'b0010111)?(opr1 >= opr2):
                            (ALU_control == 7'b0000110)?(opr1 | opr2):
                            (ALU_control == 7'b0000100)?(opr1 ^ opr2):
                            (ALU_control == 7'b0000111)?(opr1 & opr2):
                            (ALU_control == 7'b0000001)?(opr1 << opr2):
                            (ALU_control == 7'b0000101)?(opr1 >> opr2):
                            (ALU_control == 7'b0001101)?(opr1 >>> opr2):
                            (ALU_control == 7'b0011111 || ALU_control == 7'b0111111)?(opr1):
                            1'b0;
                            
             assign branch_flag = (ALU_control == 7'b0010000)?(opr1 == opr2):
                           (ALU_control == 7'b0010001)?(opr1 != opr2):
                           (ALU_control == 7'b0000010)?(SLT):
                           (ALU_control == 7'b0010101)?(SGTE):
                           (ALU_control == 7'b0010110)?(opr1 < opr2):
                           (ALU_control == 7'b0010111)?(opr1 >= opr2):
                           1'b0;

endmodule              
                            
           