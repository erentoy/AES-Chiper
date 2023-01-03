`timescale 1ns / 1ps


 module ana_modul(
    input clk,
    input rst,
    input [127:0] anahtar,
    input [127:0] blok,
    input g_gecerli,
    output reg hazir = 1,
    output reg [127:0] sifre,
    output reg c_gecerli = 0
    
    );
    
  
    reg [3:0] sayac = 0, sayac_s;
    
   
    reg  [127:0] sifre_cikis;// þifre giriþi için
    wire [127:0] sifre_cikisi;
    
    reg  [127:0] anahtar_cikis;//anahtar giriþi için
    wire [127:0] anahtar_cikisi;
    
    reg  [127:0] son_giris;
    wire [127:0] son_cikis;
  
    
    
   
      Anahtar_Olusturma aa ((sayac),(anahtar_cikis),(anahtar_cikisi));//son tur için 9 giriyo sifre oluþuyo 
      Sifreleme_Modulu  aaa ((sifre_cikis),(anahtar_cikisi),(sifre_cikisi));
      Sifreleme_Modulu_Son aaaa(son_giris,anahtar_cikisi,son_cikis);// 
    
    
    always @* begin
     sayac_s = sayac;
    
     
        if(sayac==0)begin
            
            sifre_cikis   = anahtar ^ blok;
            anahtar_cikis = anahtar;
            son_giris     = 128'h0;
            
        end
    
        
        if(g_gecerli && anahtar_cikisi >0 && sifre_cikisi>0 )begin
            sayac_s = sayac+1 ;   
         end    
         
         if(g_gecerli && sayac_s ==1'b1)
             hazir = 1'b0;
                  
                  
        if(sayac == 4'd9)begin// son çevrim ise
            son_giris   = sifre_cikis;// bu i li  olursa 1 tur dönmüþ olur. 
            sifre       = son_cikis;
            sayac_s     = 0;
            hazir       = 1'b1;
            c_gecerli   = 1'b1;
         end  
         
         if(hazir)
            c_gecerli = 1'b1;
         else
            c_gecerli = 1'b0;   
             
       
    
 end
  
    
    always @ (posedge clk) begin
        if(rst) begin
            sifre     = 128'h0;
            c_gecerli = 1'b0;
            hazir     = 1'b1;
            sayac_s   = 4'd0;
        end
        
        sayac          <= sayac_s;
        anahtar_cikis  <= anahtar_cikisi;
        sifre_cikis    <= sifre_cikisi;
     
      
    end
    
endmodule
