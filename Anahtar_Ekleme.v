`timescale 1ns / 1ps

module Anahtar_Ekleme(
    input [127:0] matris,
    input [127:0] anahtar,
    output reg [127:0] anahtarlanmis_matris
    );
    
  always@* begin
    anahtarlanmis_matris = matris ^ anahtar;
  end
endmodule
