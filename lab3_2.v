`timescale 1ns / 1ps 
module lab3_2(
			input[3:0] number,
			input CLK, 
			input selection,
			input mode,
			input clear,
			output reg [7:0] digit1,
			output reg [7:0] digit0,
			output reg [7:0] count1,
			output reg [7:0] count0,
			output reg warning
    );
   //Modify the lines below to implement your design .
	
	reg [7:0] counter0;
	reg [7:0] counter1;
	reg [7:0] coun0;
	reg [7:0] coun1;
	
	initial begin
        digit0 = 8'b00000000;
		  digit1 = 8'b00000000;
		  count1 = 8'b00000000;
		  count0 = 8'b00000000;
		  counter1 = 8'b00000000;
		  counter0 = 8'b00000000;
		  coun1 = 8'b00000000;
		  coun0 = 8'b00000000;
	end
	
	
	always@(posedge CLK) begin
	
			if(clear == 1'b1) begin
				digit0 <= 8'b00000000;
				digit1 <= 8'b00000000;
				count0 <= 8'b00000000;
				count1 <= 8'b00000000;
				counter1 <= 8'b00000000;
				counter0 <= 8'b00000000;
				coun1 <= 8'b00000000;
		      		coun0 <= 8'b00000000;
				warning <= 1'b0;
			end
			
			
			
			if(selection == 1'b0 && clear == 1'b0) begin
				
						if(mode == 1'b1) begin	
							 
							case (number)
								4'b0010 : begin digit0 <= 8'b00000010;	digit1 <= 8'b00000011;  warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end
								4'b0011 : begin digit0 <= 8'b00000011;	digit1 <= 8'b00000101;  warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end
								4'b0101 : begin digit0 <= 8'b00000101;	digit1 <= 8'b00000111;	warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end 
								4'b0111 : begin digit0 <= 8'b00000111;	digit1 <= 8'b00001011;  warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end
								4'b1011 : begin digit0 <= 8'b00001011;	digit1 <= 8'b00001101;  warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end
								4'b1101 : begin digit0 <= 8'b00001101;	digit1 <= 8'b00000010;  warning <= 1'b0; if(coun1 == 8'b00001001) begin count1 <= 8'b00000000; coun1 <= 8'b00000000; count0 <= coun0; end else begin count1 <= coun1 + 1; coun1 <= coun1 + 1; count0 <= coun0; end  end
								default : warning <= 1'b1;
							endcase	
						end
						
						else if(mode == 1'b0) begin	
							
							case (number) 
								4'b0010 : begin digit0 <= 8'b00000010;	digit1 <= 8'b00001101;  warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end end
								4'b0011 : begin digit0 <= 8'b00000011;	digit1 <= 8'b00000010;  warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end  end
								4'b0101 : begin digit0 <= 8'b00000101;	digit1 <= 8'b00000011;	warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end  end 
								4'b0111 : begin digit0 <= 8'b00000111;	digit1 <= 8'b00000101;  warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end  end
								4'b1011 : begin digit0 <= 8'b00001011;	digit1 <= 8'b00000111;  warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end  end
								4'b1101 : begin digit0 <= 8'b00001101;	digit1 <= 8'b00001011;  warning <= 1'b0; if(coun0 == 8'b00001001) begin count0 <= 8'b00000000; coun0 <= 8'b00000000; count1 <= coun1; end else begin count0 <= coun0 + 1; coun0 <= coun0 + 1; count1 <= coun1; end  end
								default : warning <= 1'b1;
							endcase	
						end
					
			end
			
			else if(selection == 1'b1 && clear == 1'b0)
						
						if(mode == 1'b1) begin
							
							case (number)
								4'b0001 : begin digit0 <= 8'b00000001;	digit1 <= 8'b00000010;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end  end
								4'b0100 : begin digit0 <= 8'b00000100;	digit1 <= 8'b00001000;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b0110 : begin digit0 <= 8'b00000110;	digit1 <= 8'b00001100;	warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1000 : begin digit0 <= 8'b00001000;	digit1 <= 8'b00000000;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1001 : begin digit0 <= 8'b00001001;	digit1 <= 8'b00000010;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1010 : begin digit0 <= 8'b00001010;	digit1 <= 8'b00000100;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1100 : begin digit0 <= 8'b00001100;	digit1 <= 8'b00001000;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1110 : begin digit0 <= 8'b00001110;	digit1 <= 8'b00001100;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								4'b1111 : begin digit0 <= 8'b00001111;	digit1 <= 8'b00001110;  warning <= 1'b0; if(counter1 == 8'b00001001) begin count1 <= 8'b00000000; counter1 <= 8'b00000000; count0 <= counter0; end else begin count1 <= counter1 + 1; counter1 <= counter1 + 1; count0 <= counter0; end end
								default : warning <= 1'b1;
							endcase
						end
						
						else  if(mode == 1'b0) begin
							
							case (number)
								4'b0001 : begin digit0 <= 8'b00000001;	digit1 <= 8'b00000000;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b0100 : begin digit0 <= 8'b00000100;	digit1 <= 8'b00000010;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b0110 : begin digit0 <= 8'b00000110;	digit1 <= 8'b00000011;	warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1000 : begin digit0 <= 8'b00001000;	digit1 <= 8'b00000100;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1001 : begin digit0 <= 8'b00001001;	digit1 <= 8'b00000100;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1010 : begin digit0 <= 8'b00001010;	digit1 <= 8'b00000101;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1100 : begin digit0 <= 8'b00001100;	digit1 <= 8'b00000110;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1110 : begin digit0 <= 8'b00001110;	digit1 <= 8'b00000111;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								4'b1111 : begin digit0 <= 8'b00001111;	digit1 <= 8'b00000111;  warning <= 1'b0; if(counter0 == 4'b1001) begin count0 <= 4'b0000; counter0 <= 4'b0000; count1 <= counter1; end else begin count0 <= counter0 + 1; counter0 <= counter0 + 1; count1 <= counter1; end  end
								default : warning <= 1'b1;
							endcase	
						end


			end
	
	
endmodule
	



