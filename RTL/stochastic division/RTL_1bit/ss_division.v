`timescale 1ns / 1ps
module ss_division_1bit
(
	input			clk, rst,
	input		[0:0]	x_ss,
	input		[0:0]	y_ss,
	input		[7:0]	z_randnum,
	output		[0:0]	z_output
);

	reg			[4:0]	counter;
	reg			[4:0]	counter_next;
	wire		[5:0]	counter_next_temp;
	wire		[0:0]	z_ss;
	wire		[0:0]	z_ss_temp;
	wire		[1:0]	y_z_multiplication;

	assign	y_z_multiplication	=	z_ss * y_ss;
	assign	counter_next_temp	=	{1'b0, counter} + {5'b0, x_ss} - {4'b0, y_z_multiplication};
	always @(*)
	begin
		if ($signed(counter_next_temp) > $signed(6'd15))
		begin
			counter_next	=	5'd15;
		end
		else if ($signed(counter_next_temp) < $signed(6'd0))
		begin
			counter_next	=	5'd0;
		end
		else
		begin
			counter_next	=	counter_next_temp[4 : 0];
		end
	end


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

	ss_generator_8_8bit x_ss_generator({counter[0:0], 7'b0}, z_randnum, z_ss_temp);
	assign	z_ss	=	(|counter[4:1] == 1'b1) ? 1'd1 : z_ss_temp;
	assign	z_output	=	z_ss;

endmodule
