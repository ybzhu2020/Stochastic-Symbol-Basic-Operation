`timescale 1ns / 1ps
module ss_MAC_4bit_top
(
	input			clk, rst,
	input		[10:0]	x_input_0,
	input		[10:0]	x_input_1,
	input		[10:0]	x_input_2,
	input		[10:0]	x_input_3,
	input		[10:0]	x_input_4,
	input		[10:0]	x_input_5,
	input		[10:0]	x_input_6,
	input		[10:0]	x_input_7,
	input		[7:0]	x_randnum_0,
	input		[7:0]	x_randnum_1,
	input		[7:0]	x_randnum_2,
	input		[7:0]	x_randnum_3,
	input		[7:0]	x_randnum_4,
	input		[7:0]	x_randnum_5,
	input		[7:0]	x_randnum_6,
	input		[7:0]	x_randnum_7,
	input		[2:0]	sel,
	output	reg	[9:0]	z_output
);

	wire		[3:0]	x_ss_0;
	wire		[3:0]	x_ss_1;
	wire		[3:0]	x_ss_2;
	wire		[3:0]	x_ss_3;
	wire		[3:0]	x_ss_4;
	wire		[3:0]	x_ss_5;
	wire		[3:0]	x_ss_6;
	wire		[3:0]	x_ss_7;
	reg			[3:0]	z_ss;

	ss_generator_11_8bit x_ss_generator_0(x_input_0, x_randnum_0, x_ss_0);
	ss_generator_11_8bit x_ss_generator_1(x_input_1, x_randnum_1, x_ss_1);
	ss_generator_11_8bit x_ss_generator_2(x_input_2, x_randnum_2, x_ss_2);
	ss_generator_11_8bit x_ss_generator_3(x_input_3, x_randnum_3, x_ss_3);
	ss_generator_11_8bit x_ss_generator_4(x_input_4, x_randnum_4, x_ss_4);
	ss_generator_11_8bit x_ss_generator_5(x_input_5, x_randnum_5, x_ss_5);
	ss_generator_11_8bit x_ss_generator_6(x_input_6, x_randnum_6, x_ss_6);
	ss_generator_11_8bit x_ss_generator_7(x_input_7, x_randnum_7, x_ss_7);

	always @(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
		begin
			z_output	<=	0;
		end
		else
		begin
			z_output	<=	z_output + {6'b0, z_ss};
		end
	end
	
	always @(*)
	begin
		case (sel)
			3'b000:		z_ss	=	x_ss_0;
			3'b001:		z_ss	=	x_ss_1;
			3'b010:		z_ss	=	x_ss_2;
			3'b011:		z_ss	=	x_ss_3;
			3'b100:		z_ss	=	x_ss_4;
			3'b101:		z_ss	=	x_ss_5;
			3'b110:		z_ss	=	x_ss_6;
			default:	z_ss	=	x_ss_7;
		endcase
	end
endmodule
