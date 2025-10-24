`timescale 1ns / 1ps
module ss_division_2bit
(
	input			clk, rst,
	input		[1:0]	x_ss,
	input		[1:0]	y_ss,
	input		[7:0]	z_randnum,
	output		[1:0]	z_output
);

	reg			[6:0]	counter;
	reg			[6:0]	counter_next;
	wire		[7:0]	counter_next_temp;
	wire		[1:0]	z_ss;
	wire		[1:0]	z_ss_temp;
	wire		[3:0]	y_z_multiplication;

	assign	y_z_multiplication	=	z_ss * y_ss;
	assign	counter_next_temp	=	{1'b0, counter} + {6'b0, x_ss} - {4'b0, y_z_multiplication};
	always @(*)
	begin
		if ($signed(counter_next_temp) > $signed(8'd63))
		begin
			counter_next	=	7'd63;
		end
		else if ($signed(counter_next_temp) < $signed(8'd0))
		begin
			counter_next	=	7'd0;
		end
		else
		begin
			counter_next	=	counter_next_temp[6 : 0];
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

	ss_generator_9_8bit x_ss_generator({counter[2:0], 6'b0}, z_randnum, z_ss_temp);
	assign	z_ss	=	(|counter[6:3] == 1'b1) ? 2'd2 : z_ss_temp;
	assign	z_output	=	z_ss;

endmodule
