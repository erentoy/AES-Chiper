`timescale 1ns / 1ps

module Satir_Kaydirma(
        input [127:0] matris,
        output reg [127:0] kaydirilmis_matris
    );

    reg [31:0] satir0, satir1, satir2, satir3;
    reg [31:0] y_satir0, y_satir1, y_satir2, y_satir3;
    
    
    always @* begin
    
    satir0 = matris[127 : 96];//1.sütün en soldaki 
    satir1 = matris[95 : 64];//2
    satir2 = matris[63 : 32];//3.
    satir3 = matris[31:0];//4.
    
    y_satir0 ={satir0[31:24], satir1[23:16], satir2[15:8], satir3[7:0]};//yeni 1. sütün
    y_satir1 ={satir1[31:24], satir2[23:16], satir3[15:8], satir0[7:0]};//yeni 2. sütün
    y_satir2 ={satir2[31:24], satir3[23:16], satir0[15:8], satir1[7:0]};//3.
    y_satir3 ={satir3[31:24], satir0[23:16], satir1[15:8], satir2[7:0]};//4.
    
    kaydirilmis_matris = {y_satir0, y_satir1, y_satir2, y_satir3};
    end
 endmodule