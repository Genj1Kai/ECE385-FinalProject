//-------------------------------------------------------------------------
//      lab8.sv                                                          --
//      Nikhil Parmar & Kush Patel                                       --
//      Spring 2019                                                      --
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab Final Proj                              --
//-------------------------------------------------------------------------


module toplevel(
				input               CLOCK_50,
            input        [3:0]  KEY,          //bit 0 is set up as Reset
            output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,

				output logic [19:0] SRAM_ADDR,
				inout wire   [15:0] SRAM_DQ,
				output logic        SRAM_UB_N,
										  SRAM_LB_N,
										  SRAM_CE_N,
										  SRAM_OE_N,
										  SRAM_WE_N,

             // VGA Interface
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA vertical sync signal
                                 VGA_HS,       //VGA horizontal sync signal

             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt

             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK,      //SDRAM Clock
				 input        [17:0] SW, 
				 output logic [17:0] LEDR,
				 inout  wire         I2C_SDAT,
				 output logic        I2C_SCLK, AUD_XCK, AUD_BCLK, AUD_DACLRCK, AUD_DACDAT
	 
                    );
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset;
	 
	 logic clk_one_sec, clk_final, clk_onestep;
	 logic player_flag;
	 
	 logic g_activate1;
	 logic r_activate1;
	 logic y_activate1;
	 logic b_activate1;
	 logic g_activate2;
	 logic r_activate2;
	 logic y_activate2;
	 logic b_activate2;
	 logic g_activate3;
	 logic r_activate3;
	 logic y_activate3;
	 logic b_activate3;	 
	 logic g_activate4;
	 logic r_activate4;
	 logic y_activate4;
	 logic b_activate4;	 
	 logic g_activate5;
	 logic r_activate5;
	 logic y_activate5;
	 logic b_activate5;	 
	 logic get_r,get_b,get_y,get_g;
	 
	 
	 
	 

    logic Reset_h, Clk, is_sprite_red1, is_sprite_blue1, is_sprite_green1, is_sprite_yellow1;
    logic [31:0] keycode; 
	 logic [7:0] score_1, score_2;
	 logic [3:0] toHex;
	 logic [9:0] DrawX;
	 logic [9:0] DrawY;

	 logic [3:0] toHex00;
	 logic [3:0] toHex01;
	 logic [3:0] toHex02;
	 logic [3:0] toHex03;
	 logic [3:0] toHex10;
	 logic [3:0] toHex11;
	 logic [3:0] toHex12;
	 logic [3:0] toHex13;

	 logic [9:0] yellow_x_pos1, yellow_y_pos1, red_x_pos1, red_y_pos1, blue_x_pos1, blue_y_pos1, green_x_pos1, green_y_pos1;
	 logic [9:0] yellow_x_pos2, yellow_y_pos2, red_x_pos2, red_y_pos2, blue_x_pos2, blue_y_pos2, green_x_pos2, green_y_pos2;
	logic [9:0]  yellow_x_pos3, yellow_y_pos3, red_x_pos3, red_y_pos3, blue_x_pos3, blue_y_pos3, green_x_pos3, green_y_pos3;
	logic [9:0]  yellow_x_pos4, yellow_y_pos4, red_x_pos4, red_y_pos4, blue_x_pos4, blue_y_pos4, green_x_pos4, green_y_pos4;
	logic [9:0]  yellow_x_pos5, yellow_y_pos5, red_x_pos5, red_y_pos5, blue_x_pos5, blue_y_pos5, green_x_pos5, green_y_pos5;

    assign Clk = CLOCK_50;
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
    end
	
	
	logic start_game;

	 always_ff @ (posedge Clk) begin
		  if (Reset_h)
				start_game <= 0;
        else if (keycode[7:0] == 8'h28)
				start_game <= 1;
			else
				start_game <= start_game;
    end
	 
	 
	 
	 
	 
	 

	 
    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
		 .Clk(Clk),
		 .Reset(Reset_h),
		 // signals connected to NIOS II
		 .from_sw_address(hpi_addr),
		 .from_sw_data_in(hpi_data_in),
		 .from_sw_data_out(hpi_data_out),
		 .from_sw_r(hpi_r),
		 .from_sw_w(hpi_w),
		 .from_sw_cs(hpi_cs),
		 .from_sw_reset(hpi_reset),
		 // signals connected to EZ-OTG chip
		 .OTG_DATA(OTG_DATA),
		 .OTG_ADDR(OTG_ADDR),
		 .OTG_RD_N(OTG_RD_N),
		 .OTG_WR_N(OTG_WR_N),
		 .OTG_CS_N(OTG_CS_N),
		 .OTG_RST_N(OTG_RST_N)
	);

     finalproj_soc nios_system(
		  .clk_clk(Clk),
		  .reset_reset_n(1'b1),    // Never reset NIOS
		  .sdram_wire_addr(DRAM_ADDR),
		  .sdram_wire_ba(DRAM_BA),
		  .sdram_wire_cas_n(DRAM_CAS_N),
		  .sdram_wire_cke(DRAM_CKE),
		  .sdram_wire_cs_n(DRAM_CS_N),
		  .sdram_wire_dq(DRAM_DQ),
		  .sdram_wire_dqm(DRAM_DQM),
		  .sdram_wire_ras_n(DRAM_RAS_N),
		  .sdram_wire_we_n(DRAM_WE_N),
		  .sdram_clk_clk(DRAM_CLK),
		  .keycode_export(keycode),
		  .otg_hpi_address_export(hpi_addr),
		  .otg_hpi_data_in_port(hpi_data_in),
		  .otg_hpi_data_out_port(hpi_data_out),
		  .otg_hpi_cs_export(hpi_cs),
		  .otg_hpi_r_export(hpi_r),
		  .otg_hpi_w_export(hpi_w),
		  .otg_hpi_reset_export(hpi_reset)
	);


	vga_clk vga_clk_instance(
		.inclk0(Clk),
		.c0(VGA_CLK)
	);


	 VGA_controller vga_controller_instance(
		.Clk(Clk),
		.Reset(Reset_h),
		.VGA_CLK(VGA_CLK),
		.VGA_BLANK_N(VGA_BLANK_N),
		.VGA_SYNC_N(VGA_SYNC_N),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS),
		.DrawX(DrawX),
		.DrawY(DrawY)
	);
	logic signal;
	counter ctr_onesec_top (.CLK_SIG(AUD_MCLK), .RESET(Reset_h), .counter_val(32'd3125000), .clk_out(clk_one_sec),.keycode(keycode)); //1s
//	counter ctr_onesec_top (.CLK_SIG(Clk), .RESET(Reset_h), .counter_val(36'd50000000), .clk_out(clk_one_sec)); //1s
//	counter ctr_onesec_top1 (.CLK_SIG(AUD_MCLK), .RESET(Reset_h), .counter_val(32'd312500000), .clk_out(clk_final),.keycode(keycode)); //100s
	counter ctr_onesec_top1 (.CLK_SIG(VGA_VS), .RESET(Reset_h), .counter_val(32'd3000), .clk_out(clk_final),.keycode(keycode), .signal(signal)); //50s
	counter ctr_onestep (.CLK_SIG(Clk), .RESET(Reset_h), .counter_val(32'd8670520), .clk_out(clk_onestep),.keycode(keycode));//one step

	logic [12:0] figure;
	RNG2 rng(.Clk(Clk), .RESET(Reset_h), .frame_clk(VGA_VS), .figure(figure), .start_game(start_game),
		.g_activate1(g_activate1), .g_activate2(g_activate2), .g_activate3(g_activate3), .g_activate4(g_activate4), .g_activate5(g_activate5),
		.r_activate1(r_activate1), .r_activate2(r_activate2), .r_activate3(r_activate3), .r_activate4(r_activate4), .r_activate5(r_activate5),
		.y_activate1(y_activate1), .y_activate2(y_activate2), .y_activate3(y_activate3), .y_activate4(y_activate4), .y_activate5(y_activate5),
		.b_activate1(b_activate1), .b_activate2(b_activate2), .b_activate3(b_activate3), .b_activate4(b_activate4), .b_activate5(b_activate5)
		);

		

	color_mapper col(
		.is_sprite_red1(is_sprite_red1),
		.is_sprite_blue1(is_sprite_blue1),
		.is_sprite_green1(is_sprite_green1),
		.is_sprite_yellow1(is_sprite_yellow1),
		.is_sprite_red2(is_sprite_red2),
		.is_sprite_blue2(is_sprite_blue2),
		.is_sprite_green2(is_sprite_green2),
		.is_sprite_yellow2(is_sprite_yellow2),
				.is_sprite_red3(is_sprite_red3),
		.is_sprite_blue3(is_sprite_blue3),
		.is_sprite_green3(is_sprite_green3),
		.is_sprite_yellow3(is_sprite_yellow3),
				.is_sprite_red4(is_sprite_red4),
		.is_sprite_blue4(is_sprite_blue4),
		.is_sprite_green4(is_sprite_green4),
		.is_sprite_yellow4(is_sprite_yellow4),
				.is_sprite_red5(is_sprite_red5),
		.is_sprite_blue5(is_sprite_blue5),
		.is_sprite_green5(is_sprite_green5),
		.is_sprite_yellow5(is_sprite_yellow5),
		
		.frame_clk(VGA_VS),
		
		
		
		.start_game(start_game),
		.red_x_pos1(red_x_pos1),
	   .red_y_pos1(red_y_pos1),
		.blue_x_pos1(blue_x_pos1),
	   .blue_y_pos1(blue_y_pos1),
		.green_x_pos1(green_x_pos1),
	   .green_y_pos1(green_y_pos1),
		.yellow_x_pos1(yellow_x_pos1),
	   .yellow_y_pos1(yellow_y_pos1),
		
				.red_x_pos2(red_x_pos2),
	   .red_y_pos2(red_y_pos2),
		.blue_x_pos2(blue_x_pos2),
	   .blue_y_pos2(blue_y_pos2),
		.green_x_pos2(green_x_pos2),
	   .green_y_pos2(green_y_pos2),
		.yellow_x_pos2(yellow_x_pos2),
	   .yellow_y_pos2(yellow_y_pos2),
		
				.red_x_pos3(red_x_pos3),
	   .red_y_pos3(red_y_pos3),
		.blue_x_pos3(blue_x_pos3),
	   .blue_y_pos3(blue_y_pos3),
		.green_x_pos3(green_x_pos3),
	   .green_y_pos3(green_y_pos3),
		.yellow_x_pos3(yellow_x_pos3),
	   .yellow_y_pos3(yellow_y_pos3),
		
				.red_x_pos4(red_x_pos4),
	   .red_y_pos4(red_y_pos4),
		.blue_x_pos4(blue_x_pos4),
	   .blue_y_pos4(blue_y_pos4),
		.green_x_pos4(green_x_pos4),
	   .green_y_pos4(green_y_pos4),
		.yellow_x_pos4(yellow_x_pos4),
	   .yellow_y_pos4(yellow_y_pos4),
		
				.red_x_pos5(red_x_pos5),
	   .red_y_pos5(red_y_pos5),
		.blue_x_pos5(blue_x_pos5),
	   .blue_y_pos5(blue_y_pos5),
		.green_x_pos5(green_x_pos5),
	   .green_y_pos5(green_y_pos5),
		.yellow_x_pos5(yellow_x_pos5),
	   .yellow_y_pos5(yellow_y_pos5),
		

		//.greenn_x_pos1(greenn_x_pos1),
	   //.greenn_y_pos1(greenn_y_pos1),
		//.yyellow_x_pos1(yyellow_x_pos1),
	   //.yyellow_y_pos1(yyellow_y_pos1),		
				.is_sprite_greenn1(is_sprite_greenn1),
		.is_sprite_yyellow1(is_sprite_yyellow1),
		
		
		
		.Clk(Clk),
		.Reset(Reset_h),
		.keycode(keycode),
		.DrawX(DrawX),
		.DrawY(DrawY),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.get_r(get_r), 
		.get_b(get_b), 
		.get_y(get_y), 
		.get_g(get_g),
		.score_1(score_1), 
		.score_2(score_2),
		//.game_over(clk_final)
	);
	
//	logic p_clock;
//	counter ctr_player (.CLK_SIG(clk_one_sec), .RESET(Reset_h), .counter_val(32'd30), .clk_out(p_clock)); 
//	
//	player p(
//		.Clk,
//		.OtherClk(p_clock),
//		.RESET(Reset_h),
//		.player_flag(player_flag)
//	);

	scoring sc(
		.Clk(Clk),
		.Reset(Reset_h),
	   .red_x_pos1(red_x_pos1),
	   .blue_x_pos1(blue_x_pos1),
	   .green_x_pos1(green_x_pos1),
	   .yellow_x_pos1(yellow_x_pos1),
		
		
			   .red_x_pos2(red_x_pos2),
	   .blue_x_pos2(blue_x_pos2),
	   .green_x_pos2(green_x_pos2),
	   .yellow_x_pos2(yellow_x_pos2),
		
			   .red_x_pos3(red_x_pos3),
	   .blue_x_pos3(blue_x_pos3),
	   .green_x_pos3(green_x_pos3),
	   .yellow_x_pos3(yellow_x_pos3),
		
			   .red_x_pos4(red_x_pos4),
	   .blue_x_pos4(blue_x_pos4),
	   .green_x_pos4(green_x_pos4),
	   .yellow_x_pos4(yellow_x_pos4),
		
			   .red_x_pos5(red_x_pos5),
	   .blue_x_pos5(blue_x_pos5),
	   .green_x_pos5(green_x_pos5),
	   .yellow_x_pos5(yellow_x_pos5),
		
		
		
		.keycode(keycode),
		.score_1(score_1),
		.score_2(score_2),
		.player_flag(1),
		.get_r(get_r), 
		.get_b(get_b), 
		.get_y(get_y), 
		.get_g(get_g)
		);


	sprite_red r1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_red(is_sprite_red1),
	  .red_x_pos(red_x_pos1),
	  .red_y_pos(red_y_pos1),
	  .rng(r_activate1)
		//.rng(0)
	);
	Sound_Top Sound_Top_inst( 
     .clk(Clk), .reset(KEY[0]), 
     .SDIN(I2C_SDAT), .SCLK(I2C_SCLK), .USB_clk(AUD_XCK), .BCLK(AUD_BCLK),
     .DAC_LR_CLK(AUD_DACLRCK), .DAC_DATA(AUD_DACDAT), .ACK_LEDR(LEDR[2:0])
    );
    
	sprite_red r2(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_red(is_sprite_red2),
	  .red_x_pos(red_x_pos2),
	  .red_y_pos(red_y_pos2),
	  .rng(r_activate2)
	);
	sprite_red r3(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_red(is_sprite_red3),
	  .red_x_pos(red_x_pos3),
	  .red_y_pos(red_y_pos3),
	  .rng(r_activate3)
	);
	sprite_red r4(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_red(is_sprite_red4),
	  .red_x_pos(red_x_pos4),
	  .red_y_pos(red_y_pos4),
	  .rng(r_activate4)
	);
	sprite_red r5(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_red(is_sprite_red5),
	  .red_x_pos(red_x_pos5),
	  .red_y_pos(red_y_pos5),
	  .rng(r_activate5)
	);

	sprite_blue b1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_blue(is_sprite_blue1),
	  .blue_x_pos(blue_x_pos1),
	  .blue_y_pos(blue_y_pos1),
	  .rng(b_activate1)
	  //.rng(0)
	);
		sprite_blue b2(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_blue(is_sprite_blue2),
	  .blue_x_pos(blue_x_pos2),
	  .blue_y_pos(blue_y_pos2),
	  .rng(b_activate2)
	);	sprite_blue b3(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_blue(is_sprite_blue3),
	  .blue_x_pos(blue_x_pos3),
	  .blue_y_pos(blue_y_pos3),
	  .rng(b_activate3)
	);	sprite_blue b4(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_blue(is_sprite_blue4),
	  .blue_x_pos(blue_x_pos4),
	  .blue_y_pos(blue_y_pos4),
	  .rng(b_activate4)
	);	sprite_blue b5(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_blue(is_sprite_blue5),
	  .blue_x_pos(blue_x_pos5),
	  .blue_y_pos(blue_y_pos5),
	  .rng(b_activate5)
	);
	
	
	sprite_green2 gg1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_green(is_sprite_greenn1),
	  .green_x_pos(greenn_x_pos1),
	  .green_y_pos(greenn_y_pos1),
	  .rng(g_activate1)
	  //.rng(0)
	);
	
	

	sprite_green g1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_green(is_sprite_green1),
	  .green_x_pos(green_x_pos1),
	  .green_y_pos(green_y_pos1),
	  .rng(g_activate1)
	  //.rng(0)
	);
//	sprite_green g2(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_green(is_sprite_green2),
//	  .green_x_pos(green_x_pos2),
//	  .green_y_pos(green_y_pos2),
//	  .rng(g_activate2)
//	);
//	sprite_green g3(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_green(is_sprite_green3),
//	  .green_x_pos(green_x_pos3),
//	  .green_y_pos(green_y_pos3),
//	  .rng(g_activate3)
//	);
//	sprite_green g4(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_green(is_sprite_green4),
//	  .green_x_pos(green_x_pos4),
//	  .green_y_pos(green_y_pos4),
//	  .rng(g_activate4)
//	);	
//	sprite_green g5(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_green(is_sprite_green5),
//	  .green_x_pos(green_x_pos5),
//	  .green_y_pos(green_y_pos5),
//	  .rng(g_activate5)
//	);	
	
	
	sprite_yellow2 yy1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_yellow(is_sprite_yyellow1),
	  .yellow_x_pos(yyellow_x_pos1),
	  .yellow_y_pos(yyellow_y_pos1),
	  .rng(y_activate1)
	  //.rng(0)
	);

	sprite_yellow y1(
	  .Clk(Clk),
	  .Reset(Reset_h),
	  .frame_clk(VGA_VS),
	  .DrawX(DrawX),
	  .DrawY(DrawY),
	  .is_sprite_yellow(is_sprite_yellow1),
	  .yellow_x_pos(yellow_x_pos1),
	  .yellow_y_pos(yellow_y_pos1),
	  .rng(y_activate1)
	  //.rng(0)
	);
//	sprite_yellow y2(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_yellow(is_sprite_yellow2),
//	  .yellow_x_pos(yellow_x_pos2),
//	  .yellow_y_pos(yellow_y_pos2),
//	  .rng(y_activate2)
//	);
//	sprite_yellow y3(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_yellow(is_sprite_yellow3),
//	  .yellow_x_pos(yellow_x_pos3),
//	  .yellow_y_pos(yellow_y_pos3),
//	  .rng(y_activate3)
//	);	
//	sprite_yellow y4(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_yellow(is_sprite_yellow4),
//	  .yellow_x_pos(yellow_x_pos4),
//	  .yellow_y_pos(yellow_y_pos4),
//	  .rng(y_activate4)
//	);	
//	sprite_yellow y5(
//	  .Clk(Clk),
//	  .Reset(Reset_h),
//	  .frame_clk(VGA_VS),
//	  .DrawX(DrawX),
//	  .DrawY(DrawY),
//	  .is_sprite_yellow(is_sprite_yellow5),
//	  .yellow_x_pos(yellow_x_pos5),
//	  .yellow_y_pos(yellow_y_pos5),
//	  .rng(y_activate5)
//	);	
//	
	
	



    // Display keycode on hex display
    HexDriver hex_inst_0 (figure[3:0], HEX0);
    HexDriver hex_inst_1 (figure[7:4], HEX1);
	 HexDriver hex_inst_2 (start_game, HEX2);
//	 HexDriver hex_inst_3 (keycode[15:12], HEX3);
    HexDriver hex_inst_3 (signal, HEX3);

	 HexDriver hex_inst_4 (score_2[3:0], HEX4);
    HexDriver hex_inst_5 (score_2[7:4], HEX5);
	 HexDriver hex_inst_6 (score_1[3:0], HEX6);
    HexDriver hex_inst_7 (score_1[7:4], HEX7);

endmodule
