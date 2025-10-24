`timescale 1ns / 1ps
module ss_generator_10_8bit
(
	input		[9:0]	x_input,
	input		[7:0]	randnum,
	output		[2:0]	x_output
);
	wire		rand_bit;

	assign	rand_bit	=	(x_input[7 : 0] > randnum) ? 1'b1 : 1'b0;
	assign	x_output	=	{1'b0, x_input[9 : 8]} + {2'd0, rand_bit};

endmodule
