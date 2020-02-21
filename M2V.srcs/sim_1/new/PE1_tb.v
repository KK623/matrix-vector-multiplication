`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/30 17:31:55
// Design Name: 
// Module Name: PE1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PE1_tb(

    );
    parameter WIDTH=8;
     reg  clk;
      reg  rst;
      reg  en;
       reg  [WIDTH-1:0] in_A;
       reg  [WIDTH-1:0] in_B;
       wire[WIDTH-1:0] out_B;
       wire [WIDTH-1:0] P;
       PE1 PE1_tbmodule(clk,rst,en,in_A,in_B,out_B,P);
       
       
     initial 
       begin
       clk=1'b0;
       rst=1'b1;
       en=1'b1;
       
       in_A=8'd22;
       in_B=8'd3;
       #10
       rst=1'b0;
       //En=1'b1;
       #10
       rst=1'b1;

       
       end
    
       always
       begin
              #10
                   clk=~clk;
       end     
endmodule
