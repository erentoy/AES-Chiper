`timescale 1ns / 1ps



module Sifreleme_Modulu(

   input [127:0] matris,
   input [127:0] anahtar,
   output [127:0] sifrelenmis_Matrix
    );
    
    wire [7 : 0] sbox [0 : 255];
    wire [127:0] sbox_cikis;
    
    Bit_Degisikligi bdegisiklik0 (matris[31:0],sbox_cikis[31:0]);
    Bit_Degisikligi bdegisiklik1 (matris[63:32],sbox_cikis[63:32]);  
    Bit_Degisikligi bdegisiklik2 (matris[95:64],sbox_cikis[95:64]);
    Bit_Degisikligi bdegisiklik3 (matris[127:96],sbox_cikis[127:96]);
  
    wire [127:0] kaydirildi;
    Satir_Kaydirma skaydir (sbox_cikis,kaydirildi);

    wire [127:0] karisitirildi;
    Sutun_Karistirma sKarisitr(kaydirildi,karisitirildi);
    
    Anahtar_Ekleme aEkle(karisitirildi,anahtar,sifrelenmis_Matrix);
    
endmodule