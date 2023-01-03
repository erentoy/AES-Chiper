`timescale 1ns / 1ps



module tb_ana(

    );
    
    reg clk=0;
    reg rst;
    reg [127:0] anahtar;
    reg [127:0] blok;
    reg g_gecerli;
    wire hazir;
    wire [127:0] sifre;
    wire c_gecerli;
    
    
    ana_modul  uut (clk,rst,anahtar,blok,g_gecerli,hazir,sifre,c_gecerli);
    
    initial begin
        g_gecerli = 1;
        anahtar   = 128'h2345_3333_3333_3333_3333_4444_4444_4444
;
        blok      = 128'h3333_1111_1111_5111_2222_2222_2222_2222
;
        rst      = 0;#100;
//        g_gecerli = 1;
//        anahtar   = 128'h5468617473206D79204B756E67204675;
//        blok      = 128'h54776F204F6E65204E696E652054776F;
//        rst      = 0;#100;
//        g_gecerli = 0;
        $stop;
       
    end
    
   always begin
     clk = ~clk; #5;
    end
    
endmodule
