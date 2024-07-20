module BoardTest(
input clk, reset,
input [2:0]add_A,
input [2:0]add_B,
output [3:0]sum_AB,

input [3:0]add_ABA,
input [3:0]add_ABB,
output [4:0]sum_ABBA,

output [3:0]small_out,
output [14:0]counter_out);

reg [14:0]counter_reg;
reg [3:0]small_counter;

always@(posedge clk or negedge reset)
begin
	if(reset == 0)
	begin
		counter_reg = 0;
		small_counter = 0;
	end
	else
	begin
		counter_reg <= counter_reg + 1;
		if(counter_reg == 15'h7FFF)
		begin
			small_counter <= small_counter + 1;
		end
	end	
end


assign counter_out = counter_reg;
assign sum_AB = add_A + add_B;
assign sum_ABBA = add_ABA + add_ABB;
assign small_out = small_counter;

endmodule

