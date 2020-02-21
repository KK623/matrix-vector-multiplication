`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/31 12:21:53
// Design Name: 
// Module Name: M2V_tb
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


module M2V_tb(

    );
    parameter DIMENSION=4, WIDTH=8;
    reg clk,rst,en;
        reg [DIMENSION*WIDTH-1:0] M1,M2,M3,M4;
        reg [DIMENSION*WIDTH-1:0] V;
        wire [WIDTH-1:0] MV1,MV2,MV3,MV4;
        
        
        M2V M2V_tb_module(clk,rst,en,
        M1,M2,M3,M4,
        V,
        MV1,MV2,MV3,MV4);
        
      initial 
             begin
             clk=1'b0;
             rst=1'b1;
             en=1'b0;
             
             
             M1=32'd0;
             M2=32'd0; 
             M3=32'd0; 
             M4=32'd0;
             
             V=32'd0;
             #30
             rst=1'b0;
             en=1'b1;
             M1=32'b00000001000000100000001100000100;
             M2=32'b00000001000000100000001100000100;
             M3=32'b00000001000000100000001100000100;
             M4=32'b00000001000000100000001100000100; 
             V=32'b00000001000000100000001100000100;
             #10
             rst=1'b1;

             end
          
             always
             begin
                    #10
                         clk=~clk;
             end     
    
endmodule
