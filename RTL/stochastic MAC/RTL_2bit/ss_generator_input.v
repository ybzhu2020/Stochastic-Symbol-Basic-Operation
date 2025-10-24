`timescale 1ns / 1ps
module ss_generator_9_8bit
(
	input		[8:0]	x_input,
	input		[7:0]	randnum,
	output		[1:0]	x_output
);
	wire		rand_bit;

	assign	rand_bit	=	(x_input[7 : 0] > randnum) ? 1'b1 : 1'b0;
	assign	x_output	=	{1'b0, x_input[8 : 8]} + {1'd0, rand_bit};
	// assign	x_output	=	rand_bit;

endmodule
