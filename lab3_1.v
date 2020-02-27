`timescale 1ns / 1ps

module df(
    input d,
    input f,
    input clk,
    output reg q
    );
    
    initial begin
        q = 0;
    end
	
    always @(posedge clk) begin
		if(d == 1'b0 && f == 1'b0) begin
			q <= 1'b1; 
		end
		else if(d == 1'b1 && f == 1'b0) begin
			q <= 1'b0; 
		end
		else if(d == 1'b1 && f == 1'b1) begin
			q <= ~q; 
		end	
		
	end	


endmodule







module icplusplus(
	input d0,
	input f0,
	input d1,
	input f1,
	input clk,
	output q0,
	output q1,
	output y
	
   ); 
	
		df fe(d0,f0,clk,q0);
		 
		df fe2(d1,f1,clk,q1);	
		  
		assign y = q0 ~^ q1;  
	




endmodule