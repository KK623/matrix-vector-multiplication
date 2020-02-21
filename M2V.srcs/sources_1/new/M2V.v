`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/30 18:04:06
// Design Name: 
// Module Name: M2V
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


module M2V#(parameter DIMENSION=4, WIDTH=8)
(clk,rst,en,
M1,M2,M3,M4,
V,
MV1,MV2,MV3,MV4

    );
    input clk,rst,en;
    input [DIMENSION*WIDTH-1:0] M1,M2,M3,M4;
    input [DIMENSION*WIDTH-1:0] V;
    output reg [WIDTH-1:0] MV1,MV2,MV3,MV4;
    
    wire [WIDTH-1:0] r1[DIMENSION+2:0];
    wire [WIDTH-1:0] r2[DIMENSION+2:0];
    wire [WIDTH-1:0] r3[DIMENSION+2:0];
    wire [WIDTH-1:0] r4[DIMENSION+2:0];
    
    wire [WIDTH-1:0] col[DIMENSION-1:0];
    
    wire [WIDTH-1:0] r12,r23,r34;
    wire en12,en23,en34;
    
    reg [2:0] count;
    reg en_n;
    
    wire [WIDTH-1:0]  wMV1,wMV2,wMV3,wMV4;
    PE1 PE_r1(.clk(clk),.rst(rst),.en(en),.in_A(r1[count]),.in_B(col[count]),.out_B(r12),.P(wMV1),.en_o(en12));
     PE1 PE_r2(.clk(clk),.rst(rst),.en(en12),.in_A(r2[count]),.in_B(r12),.out_B(r23),.P(wMV2),.en_o(en23));
      PE1 PE_r3(.clk(clk),.rst(rst),.en(en23),.in_A(r3[count]),.in_B(r23),.out_B(r34),.P(wMV3),.en_o(en34));
       PE1 PE_r4(.clk(clk),.rst(rst),.en(en34),.in_A(r4[count]),.in_B(r34),.out_B(),.P(wMV4),.en_o());

genvar i;
/*assign r2[0]=0;
assign r3[0]=0;
assign r3[1]=0;
assign r4[0]=0;
assign r4[1]=0;
assign r4[3]=0;*/
generate
for(i=0;i<DIMENSION;i=i+1)
begin: gen
assign r1[i]=M1[(i+1)*WIDTH-1:i*WIDTH];
assign r2[i+1]=M2[(i+1)*WIDTH-1:i*WIDTH];
assign r3[i+2]=M3[(i+1)*WIDTH-1:i*WIDTH];
assign r4[i+3]=M4[(i+1)*WIDTH-1:i*WIDTH];
assign col[i]=V[(i+1)*WIDTH-1:i*WIDTH];
end
endgenerate
assign r2[0]= r2[4];
assign r3[0]= r3[4];
assign r3[1]= r3[5];
assign r4[0]= r4[4];
assign r4[1]= r4[5];
assign r4[2]= r4[6];

always@(posedge clk)
begin
if(!rst)
count<=0;
else if(en)
 begin
 if(count<3)
 count<=count+1;
 else 
 begin
 count=0;
 end
 end
else 
  count<=0;
end
//always @(posedge clk)
//begin
//if(!rst)
//count<=0;
//else if(en)
//  if(count<4)
//  count<=count+1;
//  else
//  count<=0;
//else
// count<=0;
//end
   always@(posedge clk)
   begin
    if(!rst )
    begin
    MV1<=0;
    MV2<=0;
    MV3<=0;
   MV4<=0;
    end
    else if(en)
    begin
     MV1<= wMV1;
     MV2<= wMV2;
     MV3<=wMV3;
     MV4<=wMV4;
    end
    else 
    begin
    MV1<=0;
    MV2<=0;
    MV3<=0;
    MV4<=0;
    end
    
    end
    
//    always@(posedge clk)
//        begin
//        if(!rst)
//        en_n<=1;
//        else if(count==4)
//        en_n<=0;
//        else
//        if(en)
//        en_n<=1;
//        else 
//        en_n<=0;
//        end
    
endmodule
