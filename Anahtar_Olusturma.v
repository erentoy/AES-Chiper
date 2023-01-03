`timescale 1ns / 1ps

module Anahtar_Olusturma(

    input [3:0] tur,
    input [127:0] anahtar,
    output [127:0] anahtar_cikis
    );
    
    wire [31:0] k0,k1,k2,k3,sbox_sonrasi,kaydirma_sonrasi;
    
    assign k0 = anahtar[127:96];//1. sütün
    assign k1 = anahtar[95:64];
    assign k2 = anahtar[63:32];
    assign k3 = anahtar[31:0];//4.
    
    Bit_Degisikligi bb (.sbox_giris(k3),.sbox_cikis(sbox_sonrasi));

    assign kaydirma_sonrasi[31:24] = sbox_sonrasi[23:16];
    assign kaydirma_sonrasi[23:16] = sbox_sonrasi[15:8];
    assign kaydirma_sonrasi[15:8]  = sbox_sonrasi[7:0];
    assign kaydirma_sonrasi[7:0]   = sbox_sonrasi[31:24];

    assign anahtar_cikis[127:96]= k0 ^ kaydirma_sonrasi ^ vektor(tur);// yeni ilk sütünü
    assign anahtar_cikis[95:64] = anahtar_cikis[127:96] ^ k1;
    assign anahtar_cikis[63:32] = anahtar_cikis[95:64] ^ k2;
    assign anahtar_cikis[31:0]  = anahtar_cikis[63:32] ^ k3;
    
    
   
    function [31:0]	vektor;
      input	[3:0]	tur;
      case(tur)	
         4'h0: vektor=32'h01_00_00_00;
         4'h1: vektor=32'h02_00_00_00;
         4'h2: vektor=32'h04_00_00_00;
         4'h3: vektor=32'h08_00_00_00;
         4'h4: vektor=32'h10_00_00_00;
         4'h5: vektor=32'h20_00_00_00;
         4'h6: vektor=32'h40_00_00_00;
         4'h7: vektor=32'h80_00_00_00;
         4'h8: vektor=32'h1b_00_00_00;
         4'h9: vektor=32'h36_00_00_00;
         default: vektor=32'h00_00_00_00;
       endcase
     endfunction
    
endmodule
