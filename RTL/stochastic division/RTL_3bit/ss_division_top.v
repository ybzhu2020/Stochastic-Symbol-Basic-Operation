`timescale 1ns / 1ps
module ss_division_3bit_top
(
	input			clk, rst,
	input		[9:0]	x_input,
	input		[9:0]	y_input,
	input		[7:0]	x_randnum,
	input		[7:0]	y_randnum,
	input		[7:0]	z_randnum,
	output	reg	[9:0]	counter
);

	reg		[9:0]	x_input_1d;
	reg		[9:0]	y_input_1d;
	wire		[2:0]	x_ss;
	wire		[2:0]	y_ss;
	wire		[2:0]	z_ss;
	

	ss_generator_10_8bit x_ss_generator(x_input, x_randnum, x_ss);
	ss_generator_10_8bit y_ss_generator(y_input, y_randnum, y_ss);

	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			counter		<=	0;
		end
		else
		begin
			counter		<=	counter + {7'b0, z_ss};
		end
	end

	ss_division_3bit ss_divider(clk, rst, x_ss, y_ss, z_randnum, z_ss);

endmodule
