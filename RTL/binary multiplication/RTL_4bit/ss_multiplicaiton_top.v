`timescale 1ns / 1ps
module ss_multiplication_4bit_top
(
	input			clk, rst,
	input		[10:0]	x_input,
	input		[10:0]	y_input,
	input		[7:0]	x_randnum,
	input		[7:0]	y_randnum,
	output	reg	[9:0]	z_output
);

	wire		[3:0]	x_ss;
	wire		[3:0]	y_ss;
	wire		[7:0]	z_ss;

	ss_generator_11_8bit x_ss_generator(x_input, x_randnum, x_ss);
	ss_generator_11_8bit y_ss_generator(y_input, y_randnum, y_ss);

	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			z_output	<=	0;
		end
		else
		begin
			z_output	<=	z_output + {2'b0, z_ss};
		end
	end

	assign	z_ss	=	x_ss * y_ss;

endmodule
