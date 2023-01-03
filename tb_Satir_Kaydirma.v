`timescale 1ns / 1ps



module tb_Satir_Kaydirma(


    );
         
        reg[127:0] matris;
        wire [127:0] k_matris;
        
        Satir_Kaydirma ss(matris,k_matris);

initial begin 
    matris =128'hd42711aee0bf98f1b8b45de51e415230;
end
  
endmodule
