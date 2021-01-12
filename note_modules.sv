//module player (
//	input  logic Clk,
//	input  logic OtherClk, //Clk should be operating at 1/30 Hz
//	input  logic RESET,
//	output logic player_flag
//);
//
//	// This module will be synthesized into a RAM
//	always_ff @ (posedge OtherClk or posedge RESET) begin
//		
//		if (RESET) begin
//			player_flag <= 1'b0;
//		end
//		else if (player_flag == 1'b0) begin
//			player_flag <= ~player_flag;
//		end
//		else begin
//			player_flag <= 1'b1;
//		end
//	end
//	
//endmodule




module RNG2 (
	input logic Clk,
	//input logic OtherClk,
	input logic frame_clk,
	input logic RESET,
	input logic start_game,
	
	output logic [12:0] figure,
	output logic g_activate1,g_activate2,g_activate3,g_activate4,g_activate5,
	output logic r_activate1,r_activate2,r_activate3,r_activate4,r_activate5,
	output logic y_activate1,y_activate2,y_activate3,y_activate4,y_activate5,
	output logic b_activate1,b_activate2,b_activate3,b_activate4,b_activate5
     
);

//	logic [12:0] random, rnd;
//
//	wire feedback = random[12] ^ random[3] ^ random[2] ^ random[0]; 
//
//
//	always_ff @ (posedge Clk or posedge RESET) begin
//		if (RESET) begin // active high reset
//			random <= 13'b0000000000001 ;
//		end
//		else begin
//			random <= {random[12:0], feedback};
//		end 
//  end


	logic [31:0] countt, countt_in;
	logic [12:0] read_address_sh,read_address_sh_in;
	logic [7:0] do_sh;
	logic frame_clk_delayed, frame_clk_rising_edge;
	
	
	 always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	
	
	always_ff @(posedge frame_clk or posedge RESET) begin
			if (RESET) begin
				countt <= 0;
				read_address_sh <= 0;
			end
			else
			begin
				countt <= countt_in;
				read_address_sh <= read_address_sh_in;
			end	
	end
	
	
	always_comb begin
		countt_in = countt;
		read_address_sh_in = read_address_sh;
		if (start_game) begin
			//if(frame_clk_rising_edge) begin
				countt_in = countt + 1'b1;
				if (countt_in%10 == 0)
					read_address_sh_in = countt_in/10;
				else
					read_address_sh_in = 0;
			//end
		end	
			//figure = read_address_sh_in;
				if (countt_in < 6000)
					figure = 0;
				else begin
					figure = 1;
					end

	end
	
	
	
	
	frameRAM_sh sh(
		.read_address(read_address_sh),
		.Clk(Clk),
		.data_Out(do_sh)
	 );
	
	 always_comb
    begin
		if (do_sh == 4'd1) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b1;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end
		else if (do_sh == 4'd2) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b1;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end
		else if (do_sh == 4'd3) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b1;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end
		else if (do_sh == 4'd4) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b1;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end		
		else if (do_sh == 4'd5) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b1;
				b_activate5 = 1'b0;
		end
		
		else if (do_sh == 4'd6) begin
				g_activate1 = 1'b1;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end
		else if (do_sh == 4'd7) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b1;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end
		else if (do_sh == 4'd8) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b1;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end		
		else if (do_sh == 4'd9) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b1;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end		
		else if (do_sh == 4'ha) begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b1;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end			
		else begin
				g_activate1 = 1'b0;
				r_activate1 = 1'b0;
				y_activate1 = 1'b0;
				b_activate1 = 1'b0;
				g_activate2 = 1'b0;
				r_activate2 = 1'b0;
				y_activate2 = 1'b0;
				b_activate2 = 1'b0;
				g_activate3 = 1'b0;
				r_activate3 = 1'b0;
				y_activate3 = 1'b0;
				b_activate3 = 1'b0;
				g_activate4 = 1'b0;
				r_activate4 = 1'b0;
				y_activate4 = 1'b0;
				b_activate4 = 1'b0;
				g_activate5 = 1'b0;
				r_activate5 = 1'b0;
				y_activate5 = 1'b0;
				b_activate5 = 1'b0;
		end	
		
	end
	

//	assign rnd = random;

endmodule


module counter(
	input logic CLK_SIG,
	input logic RESET,
	input logic [31:0] counter_val,
	input logic [31:0] keycode,
	output logic clk_out, //turns 1 when the counter resets to 0.
	output logic signal
);

	logic [31:0] counter;
	
	always_ff @(posedge CLK_SIG) begin
		if (RESET) begin
			counter <= 32'b0;
			signal <= 0;
		end
		if (keycode[7:0] == 8'h28) begin
			counter <= 32'b0;
			signal <= 0;
		end
		if ((~RESET) && (counter >= counter_val)) begin
				counter <= 32'b0;
				clk_out <= 1'b1;
				signal <= 1;
		end
		else if (~RESET) begin
			counter <= counter + 1;
			clk_out <= 0;
		end
	end

//	 always_ff @ (posedge CLK_SIG) begin
//        frame_clk_delayed <= CLK_SIG;
//        frame_clk_rising_edge <= (CLK_SIG == 1'b1) && (frame_clk_delayed == 1'b0);
//		if (RESET || keycode[7:0] == 8'h28) begin
//			counter <= 32'b0;
//			signal <= 0;
//			counter <= 0;
//			clk_out <= 0;
//		end
//		else begin
//			counter <= counter_in;
//			clk_out <= clk_out_in;
//		end		  
//    end
//	 
//	 
//	 always_comb begin
//		counter_in = counter;
//		
//		if(frame_clk_rising_edge) begin
//			

	
endmodule
