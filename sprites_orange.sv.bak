//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  12-08-2017                               --
//    Spring 2018 Distribution                                           --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module sprite ( input         Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          // The clock indicating a new frame (~60Hz)
					input [7:0]	  keycode,
               input [9:0]   DrawX, DrawY,       // Current pixel coordinates
               output logic  is_sprite             // Whether current pixel belongs to ball or background
              );
    
    parameter [9:0] Sprite_X_Min = 10'd0;       // Leftmost point on the X axis
    parameter [9:0] Sprite_X_Max = 10'd639;     // Rightmost point on the X axis
    parameter [9:0] sprite_Y_Min = 10'd0;       // Topmost point on the Y axis
    parameter [9:0] Sprite_Y_Max = 10'd479;     // Bottommost point on the Y axis
    parameter [9:0] Sprite_Y_Step = 10'd1;      // Step size on the Y axis
    parameter [9:0] Sprite_Size = 10'd64;        // Ball size
	 
	 logic frame_clk_delayed, frame_clk_rising_edge;
	 logic [9:0] Sprite_X_Pos, Sprite_Y_Pos;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
	 always_ff @ (posedge Clk) begin
		  Sprite_X_Pos <= 10'd320;
		  Sprite_Y_Pos <= 10'd240;
	 end
	 
	 int Sprite_Y_Bound, Sprite_X_Bound, Size;
    assign Size = Sprite_Size;
	 assign Sprite_X_Bound = Sprite_X_Pos + Sprite_Size;
	 assign Sprite_Y_Bound = Sprite_Y_Pos - Sprite_Size;
    always_comb begin
        if (DrawX  >= Sprite_X_Pos && DrawX < Sprite_X_Bound && DrawY <= Sprite_Y_Pos && DrawY > Sprite_Y_Bound) 
            is_sprite = 1'b1;
        else
            is_sprite = 1'b0;
    end
    
endmodule
    
//    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
//    logic [9:0] Ball_X_Pos_in, Ball_X_Motion_in, Ball_Y_Pos_in, Ball_Y_Motion_in;
//    
//    //////// Do not modify the always_ff blocks. ////////
//    // Detect rising edge of frame_clk
//    logic frame_clk_delayed, frame_clk_rising_edge;
//    always_ff @ (posedge Clk) begin
//        frame_clk_delayed <= frame_clk;
//        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
//    end
//    // Update registers
//    always_ff @ (posedge Clk)
//    begin
//        if (Reset)
//        begin
//            Ball_X_Pos <= Ball_X_Center;
//            Ball_Y_Pos <= Ball_Y_Center;
//            Ball_X_Motion <= 10'd0;
//            Ball_Y_Motion <= Ball_Y_Step;
//        end
//        else
//        begin
//            Ball_X_Pos <= Ball_X_Pos_in;
//            Ball_Y_Pos <= Ball_Y_Pos_in;
//            Ball_X_Motion <= Ball_X_Motion_in;
//            Ball_Y_Motion <= Ball_Y_Motion_in;
//        end
//    end
//    //////// Do not modify the always_ff blocks. ////////
//    
//    // You need to modify always_comb block.
//    always_comb
//    begin
//        // By default, keep motion and position unchanged
//        Ball_X_Pos_in = Ball_X_Pos;
//        Ball_Y_Pos_in = Ball_Y_Pos;
//        Ball_X_Motion_in = Ball_X_Motion;
//        Ball_Y_Motion_in = Ball_Y_Motion;
//        
//        // Update position and motion only at rising edge of frame clock
//        if (frame_clk_rising_edge)
//        begin
//		  
//		  		unique case (keycode)
//					
//					8'h1A:
//					begin
//						Ball_X_Motion_in = 10'd0;
//						Ball_Y_Motion_in = (~Ball_Y_Step) + 1'b1;
//					end
//					8'h16:
//					begin
//						Ball_X_Motion_in = 10'd0;
//						Ball_Y_Motion_in = (Ball_Y_Step);
//					end
//					8'h07:
//					begin
//						Ball_X_Motion_in = Ball_X_Step;
//						Ball_Y_Motion_in = 10'd0;
//					end
//					8'h04:
//					begin
//						Ball_X_Motion_in = ~Ball_X_Step + 1'b1;
//						Ball_Y_Motion_in = 10'd0;
//					end
//					default: ;
//					
//				endcase
//            // Be careful when using comparators with "logic" datatype because compiler treats 
//            //   both sides of the operator as UNSIGNED numbers.
//            // e.g. Ball_Y_Pos - Ball_Size <= Ball_Y_Min 
//            // If Ball_Y_Pos is 0, then Ball_Y_Pos - Ball_Size will not be -4, but rather a large positive number.
//            if( Ball_Y_Pos + Ball_Size >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
//				begin
//                Ball_Y_Motion_in = (~(Ball_Y_Step) + 1'b1);  // 2's complement.  
//					 Ball_X_Motion_in = 10'd0; 
//				end	 
//            else if ( Ball_Y_Pos <= Ball_Y_Min + Ball_Size )  // Ball is at the top edge, BOUNCE!
//				begin
//                Ball_Y_Motion_in = Ball_Y_Step;
//					 Ball_X_Motion_in = 10'd0; 
//				end
//				if( Ball_X_Pos + Ball_Size >= Ball_X_Max )  // Ball is at the bottom edge, BOUNCE!
//				begin
//                Ball_X_Motion_in = (~(Ball_X_Step) + 1'b1);  // 2's complement.  
//					 Ball_Y_Motion_in = 10'd0; 
//				end
//            else if ( Ball_X_Pos <= Ball_X_Min + Ball_Size )  // Ball is at the top edge, BOUNCE!
//				begin
//                Ball_X_Motion_in = Ball_X_Step;
//					 Ball_Y_Motion_in = 10'd0; 
//				end
//            // TODO: Add other boundary detections and handle keypress here.
//				
//
//				
//				
//        
//        
//            // Update the ball's position with its motion
//            Ball_X_Pos_in = Ball_X_Pos + Ball_X_Motion;
//            Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;
//        end
//        
//    end
    

