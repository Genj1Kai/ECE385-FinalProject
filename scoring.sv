module scoring ( input       Clk,                // 50 MHz clock
                             Reset,             // Active-high reset signal
					  input [31:0] keycode,
					  input 		  player_flag,
					  input [9:0] yellow_x_pos1, green_x_pos1, blue_x_pos1, red_x_pos1,
					  input [9:0] yyellow_x_pos1, greenn_x_pos1, 
					  input [9:0] yellow_x_pos2, green_x_pos2, blue_x_pos2, red_x_pos2,
					  input [9:0] yellow_x_pos3, green_x_pos3, blue_x_pos3, red_x_pos3,
					  input [9:0] yellow_x_pos4, green_x_pos4, blue_x_pos4, red_x_pos4,
					  input [9:0] yellow_x_pos5, green_x_pos5, blue_x_pos5, red_x_pos5,
					  output[7:0] score_1, score_2,
					  output get_r, get_b, get_y, get_g
              );
				  
				  logic [7:0] score_in_1, score_in_2;
				  logic 		  score_counted_g, score_counted_b, score_counted_y, score_counted_o, score_counted_r; 
				  logic       score_counted_in_g, score_counted_in_b, score_counted_in_y, score_counted_in_o, score_counted_in_r;
				  logic 		get_r_in, get_b_in ,get_y_in ,get_g_in;
				  //logic	player_flag
				  always_ff @ (posedge Clk) begin
						if (Reset) begin
							score_1 <= 0;
							score_2 <= 0;
							get_r <= 0;
							get_b <= 0;
							get_y <= 0;
							get_g <= 0;
						end
						else begin							
						   get_r <= get_r_in;
							get_b <= get_b_in;
							get_y <= get_y_in;
							get_g <= get_g_in;
							score_1 <= score_in_1;
							score_2 <= score_in_2;
							score_counted_g <= score_counted_in_g;
							score_counted_b <= score_counted_in_b;
							score_counted_y <= score_counted_in_y;
							score_counted_o <= score_counted_in_o;
							score_counted_r <= score_counted_in_r;
						end
				  end
				  
				  always_comb begin
				     score_in_1 = score_1;
					  score_in_2 = score_2;
					  score_counted_in_g = score_counted_g;
					  score_counted_in_b = score_counted_b;
					  score_counted_in_y = score_counted_y;
					  score_counted_in_r = score_counted_r;
					  score_counted_in_o = score_counted_o;
					  get_r_in = get_r;
						get_b_in = get_b;
						get_y_in = get_y;
						get_g_in = get_g;
					  
					  
					  
					  
					  
					  if ((green_x_pos1 > 180 && green_x_pos1 < 220)  && (keycode[7:0] == 8'h04 || keycode[7:0] == 8'h0a || keycode[15:8] == 8'h04 || keycode[15:8] == 8'h0a) && score_counted_g == 1'b0) begin //a g

								score_in_1 = score_1 + 1'b1;
								score_counted_in_g = 1'b1;
								get_g_in = 1'b1;
							end
						if ((green_x_pos1 > 180 && green_x_pos1 < 220)  && (keycode[7:0] == 8'h50 || keycode[7:0] == 8'h1f || keycode[15:8] == 8'h50 || keycode[15:8] == 8'h1f) && score_counted_g == 1'b0) begin //<-,2
								score_in_2 = score_2 + 1'b1;
								score_counted_in_g = 1'b1;
						end
							

					  else if (green_x_pos1 < 180) begin
							score_counted_in_g = 1'b0;
					  end
					  
					  if (green_x_pos1 < 100) begin
						get_g_in= 1'b0;
						end
					  
					  if ((red_x_pos1 > 180 && red_x_pos1 < 220) && (keycode[15:0] == 16'h1609 || keycode[15:0] == 16'h0916) && score_counted_r == 1'b0) begin // s&f

								score_in_1 = score_1 + 1'b1;
								score_counted_in_r = 1'b1;
								get_r_in = 1'b1;
							end
							if ((red_x_pos1 > 180 && red_x_pos1 < 220) && (keycode[15:0] == 16'h1609 || keycode[15:0] == 16'h0916) && score_counted_r == 1'b0)begin//s 1
								score_in_2 = score_2 + 1'b1;
								score_counted_in_r = 1'b1;
							end
							
					  else if (red_x_pos1 < 180) begin
							score_counted_in_r = 1'b0;
					  end
					  
					  if (red_x_pos1 < 100) begin
						get_r_in = 1'b0;
						end
					  
					  if ((yellow_x_pos1 > 180 && yellow_x_pos1 < 220) && (keycode[7:0] == 8'h16 || keycode[7:0] == 8'h09 || keycode[15:8] == 8'h16 || keycode[15:8] == 8'h09) && score_counted_y == 1'b0) begin
								score_in_1 = score_1 + 1'b1;
								score_counted_in_y = 1'b1;
								get_y_in = 1'b1;
							end
							if ((yellow_x_pos1 > 180 && yellow_x_pos1 < 220) && (keycode[7:0] == 8'h1e || keycode[7:0] == 8'h51|| keycode[15:8] == 8'h1e || keycode[15:8] == 8'h51) && score_counted_y == 1'b0)begin
								score_in_2 = score_2 + 1'b1;
								score_counted_in_y = 1'b1;
							end

					  else if (yellow_x_pos1 < 180 ) begin
							score_counted_in_y = 1'b0;

					  end
					  if (yellow_x_pos1 < 100) begin
						get_y_in = 1'b0;
						end				  
					  
					  if ((blue_x_pos1 > 180 && blue_x_pos1 < 220) && (keycode[15:0] == 16'h040a || keycode[15:0] == 16'h0a04) && score_counted_b == 1'b0) begin
							if (player_flag == 1'b1) begin
								score_in_1 = score_1 + 1'b1;
								score_counted_in_b = 1'b1;
								get_b_in = 1'b1;
							end
							else begin
								score_in_2 = score_2 + 1'b1;
								score_counted_in_b = 1'b1;
							end
							
					  end 
					  else if (blue_x_pos1 < 180) begin
							score_counted_in_b = 1'b0;
					  end
					  if (blue_x_pos1 < 100 ) begin
						get_b_in = 1'b0;
						end				  
				end	  
				  
endmodule 




