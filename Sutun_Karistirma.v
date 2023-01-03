`timescale 1ns / 1ps

 module Sutun_Karistirma(
    input [127:0] matris,
    output reg [127:0] y_matris

    );
    
    function [7 : 0] galois_2ile_carpim(input [7 : 0] carpim);
    begin
        if(carpim[7]==1'd0) begin
        galois_2ile_carpim = (carpim << 1);//0 ise sadece sola kaydir
        end else
        galois_2ile_carpim = (carpim << 1) ^ (8'h1b);// 1 ise sola kaydýr ve XOR'la
        end
    endfunction 

    function [7 : 0] galois_3ile_carpim(input [7 : 0] carpim);
    begin
      galois_3ile_carpim = galois_2ile_carpim(carpim) ^ carpim;
    end
    endfunction 

  function [31 : 0] galois_matris_carpim(input [31 : 0] sutun);
    reg [7 : 0] sayi0, sayi1, sayi2, sayi3;
    reg [7 : 0] y_sayi0, y_sayi1, y_sayi2, y_sayi3;
    begin
      sayi0 = sutun[31 : 24];//1.eleman
      sayi1 = sutun[23 : 16];//2.
      sayi2 = sutun[15 : 08];//3.
      sayi3 = sutun[07 : 00];//4. eleman

      y_sayi0 = galois_2ile_carpim(sayi0) ^ galois_3ile_carpim(sayi1) ^ sayi2 ^ sayi3;
      y_sayi1 = sayi0 ^ galois_2ile_carpim(sayi1) ^ galois_3ile_carpim(sayi2) ^ sayi3;
      y_sayi2 = sayi0 ^ sayi1 ^ galois_2ile_carpim(sayi2) ^ galois_3ile_carpim(sayi3);
      y_sayi3 = galois_3ile_carpim(sayi0) ^ sayi1 ^ sayi2 ^ galois_2ile_carpim(sayi3);

      galois_matris_carpim = {y_sayi0, y_sayi1, y_sayi2, y_sayi3};
    end
  endfunction
  
   
    reg [31 : 0] sutun0, sutun1, sutun2, sutun3;
    reg [31 : 0] y_sutun0, y_sutun1, y_sutun2, y_sutun3;
    
    always @* begin
      sutun0 = matris[127 : 096];//1.sütün 
      sutun1 = matris[095 : 064];//2.
      sutun2 = matris[063 : 032];//3.
      sutun3 = matris[031 : 000];//4.

      y_sutun0 = galois_matris_carpim(sutun0);
      y_sutun1 = galois_matris_carpim(sutun1);
      y_sutun2 = galois_matris_carpim(sutun2);
      y_sutun3 = galois_matris_carpim(sutun3);

      y_matris = {y_sutun0, y_sutun1, y_sutun2, y_sutun3}; 
      end
endmodule

