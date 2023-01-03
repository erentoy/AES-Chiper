`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2020 18:21:24
// Design Name: 
// Module Name: tb_sifreleme
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


module tb_sifreleme(

    );
    
    reg  [127:0] text;
    reg  [127:0] key ;
    wire [127:0] out;
    Sifreleme_Modulu k (text,key,out);
    
    initial begin
        text=128'h193de3be_a0f4e22b_9ac68d2a_e9f84808;
        key= 128'ha0fafe1788542cb123a339392a6c7605;
    end    
endmodule
