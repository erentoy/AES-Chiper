`timescale 1ns / 1ps



module tb_Sutun_Karistirma(
    
    );
           reg [127:0] gir;
    wire [127:0] cik;
    
    Sutun_Karistirma md(gir,cik);
    
    initial begin 
        gir = 128'hd4bf5d30e0b452aeb84111f11e2798e5;
    end
endmodule
