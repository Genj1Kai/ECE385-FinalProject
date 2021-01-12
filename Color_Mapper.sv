//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//		Modified by Yuan Xinkai   30-12-2020										 --                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input              is_sprite_red1,            // Whether current pixel belongs to ball
							  input					is_sprite_blue1,
							  input					is_sprite_green1,
							  input					is_sprite_yellow1,
							  input              is_sprite_red2,            // Whether current pixel belongs to ball
							  input					is_sprite_blue2,
							  input					is_sprite_green2,
							  input					is_sprite_yellow2,
							  input              is_sprite_red3,            // Whether current pixel belongs to ball
							  input					is_sprite_blue3,
							  input					is_sprite_green3,
							  input					is_sprite_yellow3,
							  input              is_sprite_red4,            // Whether current pixel belongs to ball
							  input					is_sprite_blue4,
							  input					is_sprite_green4,
							  input					is_sprite_yellow4,
							  input              is_sprite_red5,            // Whether current pixel belongs to ball
							  input					is_sprite_blue5,
							  input					is_sprite_green5,
							  input					is_sprite_yellow5,
//							  

								input					is_sprite_greenn1,
							  input					is_sprite_yyellow1,


							  input					Clk,Reset,frame_clk,
							  input		get_b, get_y, get_r, get_g,
							  input 			[31:0] keycode,
							  input			[7:0] score_1, score_2,
                       //input      game_over ,                            
							  
							  //   or background (computed in ball.sv)
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  input 			[9:0]  red_x_pos1, red_y_pos1, green_x_pos1, green_y_pos1, blue_x_pos1, blue_y_pos1, yellow_x_pos1, yellow_y_pos1,
							  //input 			[9:0]  greenn_x_pos1, greenn_y_pos1,  yyellow_x_pos1, yyellow_y_pos1,
						input 			[9:0]  red_x_pos2, red_y_pos2, green_x_pos2, green_y_pos2, blue_x_pos2, blue_y_pos2, yellow_x_pos2, yellow_y_pos2,
							  input 			[9:0]  red_x_pos3, red_y_pos3, green_x_pos3, green_y_pos3, blue_x_pos3, blue_y_pos3, yellow_x_pos3, yellow_y_pos3,
							  input 			[9:0]  red_x_pos4, red_y_pos4, green_x_pos4, green_y_pos4, blue_x_pos4, blue_y_pos4, yellow_x_pos4, yellow_y_pos4,
							  input 			[9:0]  red_x_pos5, red_y_pos5, green_x_pos5, green_y_pos5, blue_x_pos5, blue_y_pos5, yellow_x_pos5, yellow_y_pos5,
							  
                       output logic [7:0] VGA_R, VGA_G, VGA_B, // VGA RGB output
							  input logic start_game
                     );
    
    logic [7:0] Red, Green, Blue;
	 logic [23:0] do_yellow1, do_green1, do_blue1, do_red1, do_circle, do_doom, do_bg, do_start;
	 logic [23:0] do_yyellow1, do_greenn1,  do_ccircle, do_ddoom;
	 logic [23:0] do_yellow2, do_green2, do_blue2, do_red2;
	 logic [23:0] do_yellow3, do_green3, do_blue3, do_red3;
	 logic [23:0] do_yellow4, do_green4, do_blue4, do_red4;
	 logic [23:0] do_yellow5, do_green5, do_blue5, do_red5;
	 logic [3:0] do_bit1, do_bit2, do_bit0, do_p1, do_p2, do_p11, do_p22;
	 logic [7:0] score, score_in;
	 logic [7:0] sscore, sscore_in;
	 logic [31:0] counterr, counterr_in;
	 logic [12:0]read_address_red1, read_address_blue1, read_address_green1, read_address_yellow1;
	 logic [12:0]read_address_greenn1, read_address_yyellow1;
	 logic [12:0]read_address_red2, read_address_blue2, read_address_green2, read_address_yellow2;
	 logic [12:0]read_address_red3, read_address_blue3, read_address_green3, read_address_yellow3;
	 logic [12:0]read_address_red4, read_address_blue4, read_address_green4, read_address_yellow4;
	 logic [12:0]read_address_red5, read_address_blue5, read_address_green5, read_address_yellow5;
	 logic [12:0] read_address_circle,read_address_doom, read_address_ccircle,read_address_ddoom;
	 logic [12:0] read_address_bit2, read_address_bit1, read_address_bit0,read_address_bbit2, read_address_bbit1, read_address_bbit0,read_address_p1, read_address_p11, read_address_p2, read_address_p22;
	 logic [1:0] menu_flag, menu_dis, player_flag, player_dis;
	 logic up_flag, up_dis;
	 logic [9:0] draw_x_bit2, draw_y_bit2, draw_x_bit1, draw_y_bit1, draw_x_bit0, draw_y_bit0,draw_x_p1, draw_y_p1, draw_x_p2, draw_y_p2;
	 logic [9:0] draw_x_bbit2, draw_y_bbit2, draw_x_bbit1, draw_y_bbit1, draw_x_bbit0, draw_y_bbit0;
	 logic [9:0] draw_x_p11, draw_y_p11, draw_x_p22, draw_y_p22;
	 logic [9:0] draw_x_red1, draw_y_red1, draw_x_blue1, draw_y_blue1, draw_x_green1, draw_y_green1, draw_x_yellow1, draw_y_yellow1; 
	 logic [9:0] draw_x_greenn1, draw_y_greenn1, draw_x_yyellow1, draw_y_yyellow1; 
	 	 logic [9:0] draw_x_red2, draw_y_red2, draw_x_blue2, draw_y_blue2, draw_x_green2, draw_y_green2, draw_x_yellow2, draw_y_yellow2;
		 	 logic [9:0] draw_x_red3, draw_y_red3, draw_x_blue3, draw_y_blue3, draw_x_green3, draw_y_green3, draw_x_yellow3, draw_y_yellow3;
			 	 logic [9:0] draw_x_red4, draw_y_red4, draw_x_blue4, draw_y_blue4, draw_x_green4, draw_y_green4, draw_x_yellow4, draw_y_yellow4;
				 	 logic [9:0] draw_x_red5, draw_y_red5, draw_x_blue5, draw_y_blue5, draw_x_green5, draw_y_green5, draw_x_yellow5, draw_y_yellow5;
	 logic [9:0] draw_x_circle, draw_y_circle;
	 logic [9:0] draw_x_ddoom, draw_y_ddoom, draw_x_ccircle, draw_y_ccircle;
    logic [9:0] draw_x_doom, draw_y_doom, draw_x_bg, draw_y_bg, draw_x_start, draw_y_start;
	 logic [17:0] read_address_bg, read_address_start;
	 logic [4:0] cont_0, cont_1, cont_2, bitbit2, bitbit1, bitbit0;
	 logic [4:0] cont_in_0, cont_in_1, cont_in_2;
	 logic is_bit2, is_bit1, is_bit0;
	 
	 	 logic [4:0] ccont_0, ccont_1, ccont_2, bbitbit2, bbitbit1, bbitbit0;
	 logic [4:0] ccont_in_0, ccont_in_1, ccont_in_2;
	 logic is_bbit2, is_bbit1, is_bbit0;
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 logic frame_clk_delayed, frame_clk_rising_edge;
	   always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 logic 			[9:0]  greenn_x_pos1, greenn_y_pos1,  yyellow_x_pos1, yyellow_y_pos1;
	 
	 always_ff @ (posedge Clk or posedge Reset) begin
		
		if (Reset) begin
			menu_flag <= 2'b00;
			player_flag <= 2'b00;
			up_flag <= 1'b1;
		end
		else begin
			menu_flag <= menu_dis;
			player_flag <= player_dis;
			up_flag <= up_dis;
		end
	 end	 

	 
				  always_ff @ (posedge Clk or posedge Reset) begin
						if (Reset) begin
							cont_0 <= 0;
							cont_1 <= 0;
							cont_2 <= 0;
							score <= 0;
							sscore <= 0;
							ccont_0 <= 0;
							ccont_1 <= 0;
							ccont_2 <= 0;
						end
						else begin							
							cont_0 <= cont_in_0;
							cont_1 <= cont_in_1;
							cont_2 <= cont_in_2;
							score <= score_in;
							sscore <= sscore_in;
							ccont_0 <= ccont_in_0;
							ccont_1 <= ccont_in_1;
							ccont_2 <= ccont_in_2;							
						end
				  end

	 	always_ff @(posedge frame_clk or posedge Reset) begin
			if (Reset) begin
				counterr <= 0;
			end
			else
			begin
				counterr <= counterr_in;
			end	
	end
	
	

	 
	 
	 
	 always_comb begin
	 				  cont_in_0 = cont_0;
				     cont_in_1 = cont_1;
					  cont_in_2 = cont_2;  
					  score_in = score;
	 				  ccont_in_0 = ccont_0;
				     ccont_in_1 = ccont_1;
					  ccont_in_2 = ccont_2;  
					  sscore_in = sscore;
					  
					  //if (score < score_1) begin // have changed
					  if (score_in < score_1) begin
							score_in = score + 1'b1;

							if (cont_0 == 4'd9) begin
								if (cont_1 == 4'd9) begin
									cont_in_2 = cont_2 + 1'b1;
									cont_in_1 = 0;
									cont_in_0 = 0;
								end
								else 
								begin
									cont_in_1 = cont_1 + 1'b1;
									cont_in_0 = 0;
								end
							end
							else
							begin
								cont_in_0 = cont_0 + 1'b1;
							end
					  end 
					  	if (sscore_in < score_2) begin
							sscore_in = score + 1'b1;

							if (ccont_0 == 4'd9) begin
								if (ccont_1 == 4'd9) begin
									ccont_in_2 = ccont_2 + 1'b1;
									ccont_in_1 = 0;
									ccont_in_0 = 0;
								end
								else 
								begin
									ccont_in_1 = ccont_1 + 1'b1;
									ccont_in_0 = 0;
								end
							end
							else
							begin
								ccont_in_0 = ccont_0 + 1'b1;
							end
					  end 


	 		
		bitbit2 = cont_in_2;
		bitbit1 = cont_in_1;
		bitbit0 = cont_in_0;
		is_bit2 = 1'b1;
		is_bit1 = 1'b1;
		is_bit0 = 1'b1;
		if (bitbit2 == 1'b0) begin
			is_bit2 = 1'b0;
			if (bitbit1 == 1'b0) begin
				is_bit1 = 1'b0;
				if (bitbit0 == 1'b0) begin
					is_bit0 = 1'b0;
				end
			end
		end
		
		
		
		
		bbitbit2 = ccont_in_2;
		bbitbit1 = ccont_in_1;
		bbitbit0 = ccont_in_0;
		is_bbit2 = 1'b1;
		is_bbit1 = 1'b1;
		is_bbit0 = 1'b1;
		if (bbitbit2 == 1'b0) begin
			is_bbit2 = 1'b0;
			if (bbitbit1 == 1'b0) begin
				is_bbit1 = 1'b0;
				if (bbitbit0 == 1'b0) begin
					is_bbit0 = 1'b0;
				end
			end
		end
		
		
		greenn_x_pos1 = green_x_pos1;
		greenn_y_pos1 = green_y_pos1 + 10'd100;
		yyellow_x_pos1 = yellow_x_pos1;
		yyellow_y_pos1 = yellow_y_pos1 + 10'd100;
		draw_x_bit0 = DrawX - 10'd80;
		draw_y_bit0 = DrawY - 10'd170;
		read_address_bit0 = draw_y_bit0 * 10'd11 + draw_x_bit0;

		draw_x_bit1 = DrawX - 10'd65;
		draw_y_bit1 = DrawY - 10'd170;
		read_address_bit1 = draw_y_bit1 * 10'd11 + draw_x_bit1;

		draw_x_bit2 = DrawX - 10'd50;
		draw_y_bit2 = DrawY - 10'd170;
		read_address_bit2 = draw_y_bit2 * 10'd11 + draw_x_bit2;	 
		
		
		
		
		
		draw_x_bbit0 = DrawX - 10'd80;
		draw_y_bbit0 = DrawY - 10'd270;
		read_address_bit0 = draw_y_bbit0 * 10'd11 + draw_x_bbit0;

		draw_x_bbit1 = DrawX - 10'd65;
		draw_y_bbit1 = DrawY - 10'd270;
		read_address_bbit1 = draw_y_bbit1 * 10'd11 + draw_x_bbit1;

		draw_x_bbit2 = DrawX - 10'd50;
		draw_y_bbit2 = DrawY - 10'd270;
		read_address_bbit2 = draw_y_bbit2 * 10'd11 + draw_x_bbit2;	
		
		
		
 
	 
	 	draw_x_start = DrawX/2'd2;
		draw_y_start = DrawY/2'd2;
		read_address_start = draw_y_start * 10'd320 + draw_x_start;
	 
	 
		
		draw_x_red1 = DrawX - red_x_pos1;
		draw_y_red1 = DrawY - red_y_pos1;
		read_address_red1 = draw_y_red1 * 10'd40 + draw_x_red1;
		
		draw_x_green1 = DrawX - green_x_pos1;
		draw_y_green1 = DrawY - green_y_pos1;
		read_address_green1 = draw_y_green1 * 10'd40 + draw_x_green1;
		
		
				draw_x_greenn1 = DrawX - greenn_x_pos1;
		draw_y_greenn1 = DrawY - greenn_y_pos1;
		read_address_greenn1 = draw_y_greenn1 * 10'd40 + draw_x_greenn1;
		
		
		draw_x_yyellow1 = DrawX - yyellow_x_pos1;
		draw_y_yyellow1 = DrawY - yyellow_y_pos1;
		read_address_yyellow1= draw_y_yyellow1 * 10'd40 + draw_x_yyellow1;
		

		
		draw_x_blue1 = DrawX - blue_x_pos1;
		draw_y_blue1= DrawY - blue_y_pos1;
		read_address_blue1= draw_y_blue1 * 10'd40 + draw_x_blue1;
		
		draw_x_yellow1 = DrawX - yellow_x_pos1;
		draw_y_yellow1 = DrawY - yellow_y_pos1;
		read_address_yellow1= draw_y_yellow1 * 10'd40 + draw_x_yellow1;
		
		
				draw_x_red2 = DrawX - red_x_pos2;
		draw_y_red2 = DrawY - red_y_pos2;
		read_address_red2 = draw_y_red2 * 10'd40 + draw_x_red2;
		
		draw_x_green2 = DrawX - green_x_pos2;
		draw_y_green2 = DrawY - green_y_pos2;
		read_address_green2 = draw_y_green2 * 10'd40 + draw_x_green2;
		
		draw_x_blue2 = DrawX - blue_x_pos2;
		draw_y_blue2 = DrawY - blue_y_pos2;
		read_address_blue2 = draw_y_blue2 * 10'd40 + draw_x_blue2;
		
		draw_x_yellow2 = DrawX - yellow_x_pos2;
		draw_y_yellow2 = DrawY - yellow_y_pos2;
		read_address_yellow2 = draw_y_yellow2 * 10'd40 + draw_x_yellow2;
		
		
				draw_x_red3 = DrawX - red_x_pos3;
		draw_y_red3 = DrawY - red_y_pos3;
		read_address_red3 = draw_y_red3* 10'd40 + draw_x_red3;
		
		draw_x_green3 = DrawX - green_x_pos3;
		draw_y_green3 = DrawY - green_y_pos3;
		read_address_green3 = draw_y_green3 * 10'd40 + draw_x_green3;
		
		draw_x_blue3 = DrawX - blue_x_pos3;
		draw_y_blue3 = DrawY - blue_y_pos3;
		read_address_blue3 = draw_y_blue3 * 10'd40 + draw_x_blue3;
		
		draw_x_yellow3 = DrawX - yellow_x_pos3;
		draw_y_yellow3 = DrawY - yellow_y_pos3;
		read_address_yellow3 = draw_y_yellow3 * 10'd40 + draw_x_yellow3;
		
						draw_x_red4 = DrawX - red_x_pos4;
		draw_y_red4 = DrawY - red_y_pos4;
		read_address_red4 = draw_y_red4* 10'd40 + draw_x_red4;
		
		draw_x_green4 = DrawX - green_x_pos4;
		draw_y_green4 = DrawY - green_y_pos4;
		read_address_green4 = draw_y_green4 * 10'd40 + draw_x_green4;
		
		draw_x_blue4 = DrawX - blue_x_pos4;
		draw_y_blue4 = DrawY - blue_y_pos4;
		read_address_blue4 = draw_y_blue4 * 10'd40 + draw_x_blue4;
		
		draw_x_yellow4 = DrawX - yellow_x_pos4;
		draw_y_yellow4 = DrawY - yellow_y_pos4;
		read_address_yellow4 = draw_y_yellow4 * 10'd40 + draw_x_yellow4;

		
		
				draw_x_red5 = DrawX - red_x_pos5;
		draw_y_red5 = DrawY - red_y_pos5;
		read_address_red5 = draw_y_red5* 10'd40 + draw_x_red5;
		
		draw_x_green5 = DrawX - green_x_pos5;
		draw_y_green5 = DrawY - green_y_pos5;
		read_address_green5 = draw_y_green5 * 10'd40 + draw_x_green5;
		
		draw_x_blue5 = DrawX - blue_x_pos5;
		draw_y_blue5 = DrawY - blue_y_pos5;
		read_address_blue5 = draw_y_blue5 * 10'd40 + draw_x_blue5;
		
		draw_x_yellow5 = DrawX - yellow_x_pos5;
		draw_y_yellow5 = DrawY - yellow_y_pos5;
		read_address_yellow5 = draw_y_yellow5 * 10'd40 + draw_x_yellow5;
		
		
		
		draw_x_ccircle = DrawX - 10'd160;
		draw_y_ccircle = DrawY - 10'd260;
		read_address_ccircle = draw_y_ccircle * 10'd40 + draw_x_ccircle;		
		
		
		
		draw_x_circle = DrawX - 10'd160;
		draw_y_circle = DrawY - 10'd160;
		read_address_circle = draw_y_circle * 10'd40 + draw_x_circle;
		
		draw_x_doom = DrawX - 10'd120;
		draw_y_doom = DrawY - 10'd158;
		read_address_doom = draw_y_doom * 10'd40 + draw_x_doom;
		
		
				draw_x_ddoom = DrawX - 10'd120;
		draw_y_ddoom = DrawY - 10'd258;
		read_address_ddoom = draw_y_ddoom * 10'd40 + draw_x_ddoom;
		
		
//		draw_x_bg = DrawX/2'd2;
//		draw_y_bg = DrawY/2'd2;
//		read_address_bg = draw_y_bg * 10'd320 + draw_x_bg;
		

		draw_x_p11 = DrawX - 10'd309;
		draw_y_p11 = DrawY - 10'd170;
		read_address_p11 = draw_y_p11 * 10'd11 + draw_x_p11;
		draw_x_p1 = DrawX - 10'd320;
		draw_y_p1 = DrawY - 10'd170;
		read_address_p1 = draw_y_p1 * 10'd11 + draw_x_p1;
		draw_x_p22 = DrawX - 10'd309;
		draw_y_p22 = DrawY - 10'd290;
		read_address_p22 = draw_y_p22 * 10'd11 + draw_x_p22;	
		draw_x_p2 = DrawX - 10'd320;
		draw_y_p2 = DrawY - 10'd290;
		read_address_p2 = draw_y_p2 * 10'd11 + draw_x_p2;			
			
		
	 end
	 
	 
	 frameRAM_yellow y1(
		.read_address(read_address_yellow1),
		.Clk(Clk),
		.data_Out(do_yellow1)
	 );
	 
	 	frameRAM_yellow yy1(
		.read_address(read_address_yyellow1),
		.Clk(Clk),
		.data_Out(do_yyellow1)
	 );
	 
	 frameRAM_red r1(
		.read_address(read_address_red1),
		.Clk(Clk),
		.data_Out(do_red1)
	 );
	 
	 frameRAM_blue b1(
		.read_address(read_address_blue1),
		.Clk(Clk),
		.data_Out(do_blue1)
	 );
	 
	 frameRAM_green g1(
		.read_address(read_address_green1),
		.Clk(Clk),
		.data_Out(do_green1)
	 );
	 
	 	 frameRAM_green gg1(
		.read_address(read_address_greenn1),
		.Clk(Clk),
		.data_Out(do_greenn1)
	 );
	 
	 frameRAM_yellow y2(
		.read_address(read_address_yellow2),
		.Clk(Clk),
		.data_Out(do_yellow2)
	 );
	 
	 frameRAM_red r2(
		.read_address(read_address_red2),
		.Clk(Clk),
		.data_Out(do_red2)
	 );
	 
	 frameRAM_blue b2(
		.read_address(read_address_blue2),
		.Clk(Clk),
		.data_Out(do_blue2)
	 );
	 
	 frameRAM_green g2(
		.read_address(read_address_green2),
		.Clk(Clk),
		.data_Out(do_green2)
	 );
	 
	 
	 frameRAM_yellow y3(
		.read_address(read_address_yellow3),
		.Clk(Clk),
		.data_Out(do_yellow3)
	 );
	 
	 frameRAM_red r3(
		.read_address(read_address_red3),
		.Clk(Clk),
		.data_Out(do_red3)
	 );
	 
	 frameRAM_blue b3(
		.read_address(read_address_blue3),
		.Clk(Clk),
		.data_Out(do_blue3)
	 );
	 
	 frameRAM_green g3(
		.read_address(read_address_green3),
		.Clk(Clk),
		.data_Out(do_green3)
	 );
	 	 
	 
	 frameRAM_yellow y4(
		.read_address(read_address_yellow4),
		.Clk(Clk),
		.data_Out(do_yellow4)
	 );
	 
	 frameRAM_red r4(
		.read_address(read_address_red4),
		.Clk(Clk),
		.data_Out(do_red4)
	 );
	 
	 frameRAM_blue b4(
		.read_address(read_address_blue4),
		.Clk(Clk),
		.data_Out(do_blue4)
	 );
	 
	 frameRAM_green g4(
		.read_address(read_address_green4),
		.Clk(Clk),
		.data_Out(do_green4)
	 );
	 	 
	 frameRAM_yellow y5(
		.read_address(read_address_yellow5),
		.Clk(Clk),
		.data_Out(do_yellow5)
	 );
	 
	 frameRAM_red r5(
		.read_address(read_address_red5),
		.Clk(Clk),
		.data_Out(do_red5)
	 );
	 
	 frameRAM_blue b5(
		.read_address(read_address_blue5),
		.Clk(Clk),
		.data_Out(do_blue5)
	 );
	 
	 frameRAM_green g5(
		.read_address(read_address_green5),
		.Clk(Clk),
		.data_Out(do_green5)
	 );
	 	 
	 
	 
	 
	 
	 
	 
	 
	 
	 frameRAM_circle c(
		.read_address(read_address_circle),
		.Clk(Clk),
		.data_Out(do_circle)
	 );
	 
	 	frameRAM_doom d(
		.read_address(read_address_doom),
		.Clk(Clk),
		.data_Out(do_doom)
	 );
	 
	 
	 
	 	 frameRAM_circle cc(
		.read_address(read_address_ccircle),
		.Clk(Clk),
		.data_Out(do_ccircle)
	 );
	 
	 	frameRAM_doom dd(
		.read_address(read_address_ddoom),
		.Clk(Clk),
		.data_Out(do_ddoom)
	 );
	 
	 
	 
	 
	 
	 
//	 frameRAM_bg bg(
//		.read_address(read_address_bg),
//		.Clk(Clk),
//		.data_Out(do_bg)
//	 );

	 	frameRAM_p p1(
		.read_address(read_address_p1),
		.Clk(Clk),
		.data_Out(do_p1)
	 );
	 	 frameRAM_p p2(
		.read_address(read_address_p2),
		.Clk(Clk),
		.data_Out(do_p2)
	 );
	 
	 	frameRAM_num p11(
		.read_address(read_address_p11),
		.Clk(Clk),
		.bitbit(1),
		.data_Out(do_p11)
	 );
	 	 frameRAM_num p22(
		.read_address(read_address_p22),
		.Clk(Clk),
		.bitbit(2),
		.data_Out(do_p22)
	 );	 
	 
	 
	 
	 frameRAM_start start(
		.read_address(read_address_start),
		.Clk(Clk),
		.data_Out(do_start)
	 );


	 	frameRAM_num num2(
		.read_address(read_address_bit2),
		.Clk(Clk),
		.bitbit(bitbit2),
		.data_Out(do_bit2)
	 );
	 
	 
	 	frameRAM_num num1(
		.read_address(read_address_bit1),
		.Clk(Clk),
		.bitbit(bitbit1),
		.data_Out(do_bit1)
	 );

	 	frameRAM_num num0(
		.read_address(read_address_bit0),
		.Clk(Clk),
		.bitbit(bitbit0),
		.data_Out(do_bit0)
	 );	 
	 
	 	frameRAM_num nnum2(
		.read_address(read_address_bbit2),
		.Clk(Clk),
		.bitbit(bbitbit2),
		.data_Out(do_bbit2)
	 );
	 
	 
	 	frameRAM_num nnum1(
		.read_address(read_address_bbit1),
		.Clk(Clk),
		.bitbit(bbitbit1),
		.data_Out(do_bbit1)
	 );

	 	frameRAM_num nnum0(
		.read_address(read_address_bbit0),
		.Clk(Clk),
		.bitbit(bbitbit0),
		.data_Out(do_bbit0)
	 );
	 
	 
	 

	 
    
    // Assign color based on is_ball signal
    always_comb
    begin
		menu_dis = menu_flag;
		player_dis = player_flag;
		up_dis = up_flag;
		
//		if(game_over == 1'b1) begin
//
//			player_dis = 2'b00;
//
//		end
//		else begin
		if (keycode[7:0] == 8'h2c && menu_dis == 2'b00) begin
			menu_dis = 2'b01; // selection page
			end
		else if (keycode[7:0] == 8'h28 && menu_dis == 2'b01 && player_dis == 2'b00) begin
			player_dis = 2'b01; // game page
		end

		if (menu_dis == 2'b01 && player_dis == 2'b00) begin
			if (keycode[7:0] == 8'h52)//up
				begin
					up_dis = 1'b1;//1p
				end
			else if(keycode[7:0] == 8'h51)
					up_dis = 1'b0;//2p
		end
//		end
			
		//if (menu_dis == 2'b00) begin
		  Red = do_start[23:16];
        Green = do_start[15:8];
        Blue = do_start[7:0];
		//end
//				Red = 8'hff;
//				Green = 8'hff;
//				Blue = 8'hf6;
		if (menu_dis == 2'b01 && player_dis == 2'b00) //this is the selection players page
		begin
				//background
				Red = 8'hd6;
				Green = 8'haf;
				Blue = 8'hbc;
	
				//selection
		  if ((DrawY > 160 && DrawY < 200 && DrawX > 220 && DrawX < 420) ||(DrawY > 280 && DrawY < 320 && DrawX > 220 && DrawX < 420))
		  begin
				//two sections
			  Red = 8'hf3; 
			  Green = 8'h46;
			  Blue = 8'h29;
		  end
		  
		  if (up_dis==1'b1 && ((DrawY > 158 && DrawY < 160 && DrawX > 220 && DrawX < 420) ||(DrawY > 200 && DrawY < 202 && DrawX > 220 && DrawX < 420) || (DrawY > 160 && DrawY < 200 && DrawX > 218 && DrawX < 220) || (DrawY > 160 && DrawY < 200 && DrawX > 420 && DrawX < 422)))
		  begin
				//white frames for above one
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
			  
			  
		  end
		  if (up_dis==1'b0 && ((DrawY > 278 && DrawY < 280 && DrawX > 220 && DrawX < 420) ||(DrawY > 320 && DrawY < 322 && DrawX > 220 && DrawX < 420) || (DrawY > 280 && DrawY < 320 && DrawX > 218 && DrawX < 220) || (DrawY > 280 && DrawY < 320 && DrawX > 420 && DrawX < 422)))
		  begin
				//white frames for lower one
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end
		  
		  if((DrawY > 170 && DrawY < 185 && DrawX > 309 && DrawX < 320) && do_p11 != 4'd0 ) begin//p1
		 	  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end
		  if((DrawY > 170 && DrawY < 185 && DrawX > 320 && DrawX < 331) && do_p1 != 4'd0) begin//p11
		 	  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end
		  if((DrawY > 290 && DrawY < 305 && DrawX > 309 && DrawX < 320) && do_p22 != 4'd0) begin//p2
		 	  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end
		  if((DrawY > 290 && DrawY < 305 && DrawX > 320 && DrawX < 331) && do_p2 != 4'd0) begin//p22
		 	  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end
		  
		  
		end
		
		
		
		
		
		else if(player_dis == 2'b01 && up_dis == 1'b1)//this is the game page 
		begin
		              // Background with nice color gradient
//        Red = do_bg[23:16];
//        Green = do_bg[15:8];
//        Blue = do_bg[7:0];
				Red = 8'hd6;
				Green = 8'haf;
				Blue = 8'hbc;
		  if (DrawY > 140 && DrawY < 220)
		  begin
				//Fret-board
				Red = 8'h2d;
				Green = 8'h2a;
				Blue = 8'h2d;
		  end
		  	
				
		  if ((DrawX > 200) &&(DrawX < 240) &&(DrawY > 160) &&(DrawY < 200) ) begin
//				//Strings
				Red = do_circle[23:16];
				Green = do_circle[15:8];
				Blue = do_circle[7:0];
		  end


		  
		  if (is_sprite_red1 == 1'b1 && do_red1 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red1[23:16];
            Green = do_red1[15:8];
            Blue = do_red1[7:0];
        end
		  if (is_sprite_blue1 == 1'b1 && do_blue1 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue1[23:16];
            Green = do_blue1[15:8];
            Blue = do_blue1[7:0];
        end
		  if (is_sprite_green1 == 1'b1 && do_green1 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green1[23:16];
            Green = do_green1[15:8];
            Blue = do_green1[7:0];
        end
		  if (is_sprite_yellow1 == 1'b1 && do_yellow1 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow1[23:16];
            Green = do_yellow1[15:8];
            Blue = do_yellow1[7:0];
        end
		  
		  
		  
		  
		  		  if (is_sprite_red2 == 1'b1 && do_red2 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red2[23:16];
            Green = do_red2[15:8];
            Blue = do_red2[7:0];
        end
		  if (is_sprite_blue2 == 1'b1 && do_blue2 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue2[23:16];
            Green = do_blue2[15:8];
            Blue = do_blue2[7:0];
        end
		  if (is_sprite_green2 == 1'b1 && do_green2 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green2[23:16];
            Green = do_green2[15:8];
            Blue = do_green2[7:0];
        end
		  if (is_sprite_yellow2 == 1'b1 && do_yellow2 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow2[23:16];
            Green = do_yellow2[15:8];
            Blue = do_yellow2[7:0];
        end
		  

		  		  if (is_sprite_red3 == 1'b1 && do_red3 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red3[23:16];
            Green = do_red3[15:8];
            Blue = do_red3[7:0];
        end
		  if (is_sprite_blue3 == 1'b1 && do_blue3 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue3[23:16];
            Green = do_blue3[15:8];
            Blue = do_blue3[7:0];
        end
		  if (is_sprite_green3 == 1'b1 && do_green3 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green3[23:16];
            Green = do_green3[15:8];
            Blue = do_green3[7:0];
        end
		  if (is_sprite_yellow3 == 1'b1 && do_yellow3 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow3[23:16];
            Green = do_yellow3[15:8];
            Blue = do_yellow3[7:0];
        end		


		  
		  
		  
		  if (is_sprite_red4 == 1'b1 && do_red4 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red4[23:16];
            Green = do_red4[15:8];
            Blue = do_red4[7:0];
        end
		  if (is_sprite_blue4 == 1'b1 && do_blue4 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue4[23:16];
            Green = do_blue4[15:8];
            Blue = do_blue4[7:0];
        end
		  if (is_sprite_green4 == 1'b1 && do_green4 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green4[23:16];
            Green = do_green4[15:8];
            Blue = do_green4[7:0];
        end
		  if (is_sprite_yellow4 == 1'b1 && do_yellow4 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow4[23:16];
            Green = do_yellow4[15:8];
            Blue = do_yellow4[7:0];
        end		





		  
		  if (is_sprite_red5 == 1'b1 && do_red5 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red5[23:16];
            Green = do_red5[15:8];
            Blue = do_red5[7:0];
        end
		  if (is_sprite_blue5 == 1'b1 && do_blue5 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue5[23:16];
            Green = do_blue5[15:8];
            Blue = do_blue5[7:0];
        end
		  if (is_sprite_green5 == 1'b1 && do_green5 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green5[23:16];
            Green = do_green5[15:8];
            Blue = do_green5[7:0];
        end
		  if (is_sprite_yellow5 == 1'b1 && do_yellow5 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow5[23:16];
            Green = do_yellow5[15:8];
            Blue = do_yellow5[7:0];
        end		  
		  
		 
		  
		  
		  
		  
		  

//		  else if (DrawX > 149 && DrawX < 491 && DrawY > 419 && DrawY < 451)
//		  begin
//				Red = 8'hff;
//				Green = 8'h39;
//				Blue = 8'h88;
//		  end
//		  else if (DrawX > 144 && DrawX < 150) 
//		  begin
//				// Left Bar
//				Red = 8'hC0;
//				Green = 8'hC0;
//				Blue = 8'hC0;
//		  end
//		  else if (DrawX > 490 && DrawX < 496) 
//		  begin
//				// Right Bar
//				Red = 8'hC0;
//				Green = 8'hC0;
//				Blue = 8'hC0;
//		  end
//		  else if ((DrawX == 170) ||(DrawX == 245) ||(DrawX == 320) ||(DrawX ==395) || (DrawX ==470)) begin
//		  else if ((DrawX > 100) &&(DrawX < 140) &&(DrawY > 180) &&(DrawY < 220) ) begin
////				//Strings
//				Red = 8'hF5;
//				Green = 8'hF5;
//				Blue = 8'hF5;
//		  end
//		  else if (DrawY > 160 && DrawY < 240)
//		  begin
//				//Fret-board
//				Red = 8'h38;
//				Green = 8'h00;
//				Blue = 8'h00;
//		  end
//        else 
//        begin
//            // Background with nice color gradient
//            Red = 8'h20; 
//            Green = 8'h20;
//            Blue = 8'h20;
//        end

		  if (DrawY > 140 && DrawY < 220 && DrawX > 0 && DrawX < 180)
		  begin
				//left fret-board
			  Red = 8'hf3; 
			  Green = 8'h46;
			  Blue = 8'h29;
		  end
		  
		  if ((DrawX > 120) &&(DrawX < 160) &&(DrawY > 158) &&(DrawY < 202) )
		  begin
				//doom
			  Red = do_doom[23:16];
			  Green = do_doom[15:8];
			  Blue = do_doom[7:0];
		  end		  
		 	

		  
		  
		  if ((DrawX > 80) &&(DrawX < 91) &&(DrawY > 170) &&(DrawY < 185)  && do_bit0 != 4'd0 && is_bit0 != 4'd0)
		  begin
				//bit0
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 65) &&(DrawX < 76) &&(DrawY > 170) &&(DrawY < 185)  && do_bit1 != 4'd0 && is_bit1 != 4'd0)
		  begin
				//bit1
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 50) &&(DrawX < 61) &&(DrawY > 170) &&(DrawY < 185) && do_bit2 != 4'd0 && is_bit2 != 4'd0)
		  begin
				//bit2
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end				  

    end 
	 
	 else if(player_dis == 2'b01 && up_dis == 1'b0) /////////////////////////////////////////////////////////2p
	 begin
	 				Red = 8'hd6;
				Green = 8'haf;
				Blue = 8'hbc;
		  if (DrawY > 240 && DrawY < 320)
		  begin
				//Fret-board
				Red = 8'h2d;
				Green = 8'h2a;
				Blue = 8'h2d;
		  end
		  
		  if (DrawY > 140 && DrawY < 220)
		  begin
				//Fret-board
				Red = 8'h2d;
				Green = 8'h2a;
				Blue = 8'h2d;
		  end
		  	
				
		  if ((DrawX > 200) &&(DrawX < 240) &&(DrawY > 160) &&(DrawY < 200) ) begin
//				//Strings
				Red = do_circle[23:16];
				Green = do_circle[15:8];
				Blue = do_circle[7:0];
		  end
		  
		  
		  
		  	if ((DrawX > 200) &&(DrawX < 240) &&(DrawY > 260) &&(DrawY < 300) ) begin
//				//Strings
				Red = do_ccircle[23:16];
				Green = do_ccircle[15:8];
				Blue = do_ccircle[7:0];
		  end


		  
		  if (is_sprite_red1 == 1'b1 && do_red1 != 24'h2d2a2d && get_r == 1'b0) 
        begin
            // Red Sprite
            Red = do_red1[23:16];
            Green = do_red1[15:8];
            Blue = do_red1[7:0];
        end
		  if (is_sprite_blue1 == 1'b1 && do_blue1 != 24'h2d2a2d && get_b == 1'b0) 
        begin
            // Blue Sprite
            Red = do_blue1[23:16];
            Green = do_blue1[15:8];
            Blue = do_blue1[7:0];
        end
		  if (is_sprite_green1 == 1'b1 && do_green1 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_green1[23:16];
            Green = do_green1[15:8];
            Blue = do_green1[7:0];
        end
		  if (is_sprite_yellow1 == 1'b1 && do_yellow1 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yellow1[23:16];
            Green = do_yellow1[15:8];
            Blue = do_yellow1[7:0];
        end
		  
		  if (is_sprite_greenn1 == 1'b1 && do_greenn1 != 24'h2d2a2d && get_g == 1'b0) 
        begin
            // Green Sprite
            Red = do_greenn1[23:16];
            Green = do_greenn1[15:8];
            Blue = do_greenn1[7:0];
        end
		  if (is_sprite_yyellow1 == 1'b1 && do_yyellow1 != 24'h2d2a2d && get_y == 1'b0) 
        begin
            // Yellow Sprite
            Red = do_yyellow1[23:16];
            Green = do_yyellow1[15:8];
            Blue = do_yyellow1[7:0];
        end
		  
		  
//		  		  if (is_sprite_red2 == 1'b1 && do_red2 != 24'h2d2a2d && get_r == 1'b0) 
//        begin
//            // Red Sprite
//            Red = do_red2[23:16];
//            Green = do_red2[15:8];
//            Blue = do_red2[7:0];
//        end
//		  if (is_sprite_blue2 == 1'b1 && do_blue2 != 24'h2d2a2d && get_b == 1'b0) 
//        begin
//            // Blue Sprite
//            Red = do_blue2[23:16];
//            Green = do_blue2[15:8];
//            Blue = do_blue2[7:0];
//        end
//		  if (is_sprite_green2 == 1'b1 && do_green2 != 24'h2d2a2d && get_g == 1'b0) 
//        begin
//            // Green Sprite
//            Red = do_green2[23:16];
//            Green = do_green2[15:8];
//            Blue = do_green2[7:0];
//        end
//		  if (is_sprite_yellow2 == 1'b1 && do_yellow2 != 24'h2d2a2d && get_y == 1'b0) 
//        begin
//            // Yellow Sprite
//            Red = do_yellow2[23:16];
//            Green = do_yellow2[15:8];
//            Blue = do_yellow2[7:0];
//        end
//		  
//
//		  		  if (is_sprite_red3 == 1'b1 && do_red3 != 24'h2d2a2d && get_r == 1'b0) 
//        begin
//            // Red Sprite
//            Red = do_red3[23:16];
//            Green = do_red3[15:8];
//            Blue = do_red3[7:0];
//        end
//		  if (is_sprite_blue3 == 1'b1 && do_blue3 != 24'h2d2a2d && get_b == 1'b0) 
//        begin
//            // Blue Sprite
//            Red = do_blue3[23:16];
//            Green = do_blue3[15:8];
//            Blue = do_blue3[7:0];
//        end
//		  if (is_sprite_green3 == 1'b1 && do_green3 != 24'h2d2a2d && get_g == 1'b0) 
//        begin
//            // Green Sprite
//            Red = do_green3[23:16];
//            Green = do_green3[15:8];
//            Blue = do_green3[7:0];
//        end
//		  if (is_sprite_yellow3 == 1'b1 && do_yellow3 != 24'h2d2a2d && get_y == 1'b0) 
//        begin
//            // Yellow Sprite
//            Red = do_yellow3[23:16];
//            Green = do_yellow3[15:8];
//            Blue = do_yellow3[7:0];
//        end		
//
//
//		  
//		  
//		  
//		  		  		  if (is_sprite_red4 == 1'b1 && do_red4 != 24'h2d2a2d && get_r == 1'b0) 
//        begin
//            // Red Sprite
//            Red = do_red4[23:16];
//            Green = do_red4[15:8];
//            Blue = do_red4[7:0];
//        end
//		  if (is_sprite_blue4 == 1'b1 && do_blue4 != 24'h2d2a2d && get_b == 1'b0) 
//        begin
//            // Blue Sprite
//            Red = do_blue4[23:16];
//            Green = do_blue4[15:8];
//            Blue = do_blue4[7:0];
//        end
//		  if (is_sprite_green4 == 1'b1 && do_green4 != 24'h2d2a2d && get_g == 1'b0) 
//        begin
//            // Green Sprite
//            Red = do_green4[23:16];
//            Green = do_green4[15:8];
//            Blue = do_green4[7:0];
//        end
//		  if (is_sprite_yellow4 == 1'b1 && do_yellow4 != 24'h2d2a2d && get_y == 1'b0) 
//        begin
//            // Yellow Sprite
//            Red = do_yellow4[23:16];
//            Green = do_yellow4[15:8];
//            Blue = do_yellow4[7:0];
//        end		
//
//
//
//
//
//		  
//		  		  if (is_sprite_red5 == 1'b1 && do_red5 != 24'h2d2a2d && get_r == 1'b0) 
//        begin
//            // Red Sprite
//            Red = do_red5[23:16];
//            Green = do_red5[15:8];
//            Blue = do_red5[7:0];
//        end
//		  if (is_sprite_blue5 == 1'b1 && do_blue5 != 24'h2d2a2d && get_b == 1'b0) 
//        begin
//            // Blue Sprite
//            Red = do_blue5[23:16];
//            Green = do_blue5[15:8];
//            Blue = do_blue5[7:0];
//        end
//		  if (is_sprite_green5 == 1'b1 && do_green5 != 24'h2d2a2d && get_g == 1'b0) 
//        begin
//            // Green Sprite
//            Red = do_green5[23:16];
//            Green = do_green5[15:8];
//            Blue = do_green5[7:0];
//        end
//		  if (is_sprite_yellow5 == 1'b1 && do_yellow5 != 24'h2d2a2d && get_y == 1'b0) 
//        begin
//            // Yellow Sprite
//            Red = do_yellow5[23:16];
//            Green = do_yellow5[15:8];
//            Blue = do_yellow5[7:0];
//        end		  
//		  
		  


		  if (DrawY > 240 && DrawY < 320 && DrawX > 0 && DrawX < 180)
		  begin
				//left fret-board
			  Red = 8'hf3; 
			  Green = 8'h46;
			  Blue = 8'h29;
		  end
		  
		  	if (DrawY > 140 && DrawY < 220 && DrawX > 0 && DrawX < 180)
		  begin
				//left fret-board
			  Red = 8'hf3; 
			  Green = 8'h46;
			  Blue = 8'h29;
		  end
		  
		  
		  
		  if ((DrawX > 120) &&(DrawX < 160) &&(DrawY > 158) &&(DrawY < 202) )
		  begin
				//doom
			  Red = do_doom[23:16];
			  Green = do_doom[15:8];
			  Blue = do_doom[7:0];
		  end		  
		 	
			
		  if ((DrawX > 120) &&(DrawX < 160) &&(DrawY > 258) &&(DrawY < 302) )
		  begin
				//doom
			  Red = do_ddoom[23:16];
			  Green = do_ddoom[15:8];
			  Blue = do_ddoom[7:0];
		  end					
			
			

		  
		  
		  if ((DrawX > 80) &&(DrawX < 91) &&(DrawY > 170) &&(DrawY < 185)  && do_bit0 != 4'd0 && is_bit0 != 4'd0)
		  begin
				//bit0
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 65) &&(DrawX < 76) &&(DrawY > 170) &&(DrawY < 185)  && do_bit1 != 4'd0 && is_bit1 != 4'd0)
		  begin
				//bit1
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 50) &&(DrawX < 61) &&(DrawY > 170) &&(DrawY < 185) && do_bit2 != 4'd0 && is_bit2 != 4'd0)
		  begin
				//bit2
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  
		  
		  
		  		  if ((DrawX > 80) &&(DrawX < 91) &&(DrawY > 270) &&(DrawY < 285)  && do_bbit0 != 4'd0 && is_bbit0 != 4'd0)
		  begin
				//bit0
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 65) &&(DrawX < 76) &&(DrawY > 270) &&(DrawY < 285)  && do_bbit1 != 4'd0 && is_bbit1 != 4'd0)
		  begin
				//bit1
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end		
		  if ((DrawX > 50) &&(DrawX < 61) &&(DrawY > 270) &&(DrawY < 285) && do_bbit2 != 4'd0 && is_bbit2 != 4'd0)
		  begin
				//bit2
			  Red = 8'hff; 
			  Green = 8'hff;
			  Blue = 8'hf8;
		  end	
		  
		  
		  
		  
	 
	 end
	 
	 
	 end

	 	 
//	 always_comb
//	 begin
//			if (start_game)
//	 			//if(frame_clk_rising_edge)
//				counterr_in = counterr + 4'd6;
//			else
//				counterr_in = counterr;
//
//
//		  if (DrawY > 260 && DrawY < 264 && DrawX > 0 && DrawX < counterr_in)
//		  begin
//				//left fret-board
//			  Red = 8'hd3; 
//			  Green = 8'hf0;
//			  Blue = 8'hf0;
//		  end		  
//	end
	 
	 
	 
	 
    
endmodule
