`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2020 19:21:55
// Design Name: 
// Module Name: tb_anahtar_ekleme
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


module tb_anahtar_ekleme(

    );
     reg [127:0] matris;
     reg [127:0] anahtar;
     wire [127:0] anahtarlanmis_matris;
     Anahtar_Ekleme ae(matris,anahtar,anahtarlanmis_matris);
    
    initial begin
        matris=127'h54776F204F6E65204E696E652054776F; anahtar=127'h5468617473206D79204B756E67204675;
    end
endmodule
