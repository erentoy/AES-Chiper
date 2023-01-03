`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2020 11:52:39
// Design Name: 
// Module Name: tb_sbox
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


module tb_sbox(

    );
   
    reg [31:0]an;
    wire [31:0]cik;
    
    Bit_Degisikligi aa(an,cik);
    
    initial begin
    
   an=31'h193de3be;#500;
    end
endmodule
