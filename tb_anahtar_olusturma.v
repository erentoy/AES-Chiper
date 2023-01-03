`timescale 1ns / 1ps


module tb_anahtar_olusturma(

    );
    reg [3:0]tur;
    reg [127:0]an;
    wire [127:0]cik;
    
    Anahtar_Olusturma aa(tur,an,cik);
    
    initial begin
    
   tur=0;an=128'h5468617473206D79204B756E67204675;#500;
   tur=9;an=128'hac7766f3_19fadc21_28d12941_575c006e;#500;
    end
endmodule
