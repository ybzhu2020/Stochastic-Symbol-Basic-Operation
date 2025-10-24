`timescale 1ns / 1ps
module ss_generator_8_8bit
(
	input		[7:0]	x_input,
	input		[7:0]	randnum,
	output		[0:0]	x_output
);
	wire		rand_bit;

	assign	rand_bit	=	(x_input[7 : 0] > randnum) ? 1'b1 : 1'b0;
	assign	x_output	=	rand_bit;

endmodule
