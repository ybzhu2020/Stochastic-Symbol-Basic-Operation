`timescale 1ns / 1ps
module ss_division_3bit
(
	input			clk, rst,
	input		[2:0]	x_ss,
	input		[2:0]	y_ss,
	input		[7:0]	z_randnum,
	output		[2:0]	z_output
);

	reg			[8:0]	counter;
	wire		[8:0]	counter_next;
	wire		[9:0]	counter_next_temp;
	wire		[2:0]	z_ss;
	wire		[2:0]	z_ss_temp;
	wire		[5:0]	y_z_multiplication;

	assign	y_z_multiplication	=	z_ss * y_ss;
	assign	counter_next_temp	=	{1'b0, counter} + {7'b0, x_ss} - {4'b0, y_z_multiplication};
	assign	counter_next	=	counter_next_temp[9] == 1'b1 ? 8'b0 : counter_next_temp[8:0];

	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			counter	<=	0;
		end
		else
		begin
			counter	<=	counter_next;
		end
	end

	ss_generator_10_8bit x_ss_generator({counter[4:0], 5'b0}, z_randnum, z_ss_temp);
	assign	z_ss	=	(|counter[8:5] == 1'b1) ? 3'd4 : z_ss_temp;
	assign	z_output	=	z_ss;

endmodule
