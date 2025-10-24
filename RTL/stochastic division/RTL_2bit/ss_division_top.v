`timescale 1ns / 1ps
module ss_division_2bit_top
(
	input			clk, rst,
	input		[8:0]	x_input,
	input		[8:0]	y_input,
	input		[7:0]	x_randnum,
	input		[7:0]	y_randnum,
	input		[7:0]	z_randnum,
	output	reg	[10:0]	counter
);

	wire		[1:0]	x_ss;
	wire		[1:0]	y_ss;
	wire		[1:0]	z_ss;

	ss_generator_9_8bit x_ss_generator(x_input, x_randnum, x_ss);
	ss_generator_9_8bit y_ss_generator(y_input, y_randnum, y_ss);

	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			counter		<=	0;
		end
		else
		begin
			counter		<=	counter + {9'b0, z_ss};
		end
	end

	ss_division_2bit ss_divider(clk, rst, x_ss, y_ss, z_randnum, z_ss);

endmodule
