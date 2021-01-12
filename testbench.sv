module testbench();

timeunit 10ns;

timeprecision 1ns;

logic CLOCK_50;
logic [3:0] KEY;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
logic AUD_ADCDAT, AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
logic AUD_DACDAT, AUD_MCLK, I2C_SCLK, I2C_SDAT;
wire [15:0] SRAM_DQ;
logic [19:0] SRAM_ADDR;
logic SRAM_UB_N, SRAM_LB_N, SRAM_CE_N, SRAM_OE_N,SRAM_WE_N;	
	

logic mus_INIT, mus_INIT_FINISH, mus_data_over, RESET_h;
logic [3:0] state_msm;
logic [4:0] state_audint;
logic i2c_counter;
logic [15:0] mus_LDATA, mus_RDATA;

assign AUD_ADCDAT  = 1'b0;
assign AUD_ADCLRCK = 1'b0;
assign AUD_BCLK    = 1'b0;

always @*
	begin: INTERNAL_SIG_MONITOR
//		mus_INIT        = tp.msm.mus_INIT;
//		mus_INIT_FINISH = tp.msm.mus_INIT_FINISH;
//		mus_data_over   = tp.msm.mus_data_over;
//		mus_LDATA       = tp.msm.mus_LDATA;
//		mus_RDATA       = tp.msm.mus_RDATA;
//		state_msm       = tp.msm.current;
//		RESET_h         = tp.msm.RESET;
//		state_audint    = tp.msm.audint.state;
//		i2c_counter     = tp.msm.audint.i2c_counter[0];

		
	end

toplevel tp(.*);


always 
	begin : CLOCK_GENERATION
		#1 CLOCK_50 = ~CLOCK_50;
//		AUD_DACLRCK = #2 ~AUD_DACLRCK;
	end
	
	initial begin : CLOCK_INITIALIZATION
		CLOCK_50 = 0;
		AUD_DACLRCK = 1'b0;
	end

	

	initial begin : TEST_VECTORS
		KEY = 4'h1;

		#4 KEY = 4'h0;

		#4 KEY = 4'h1;
	

	#9000 AUD_DACLRCK = 1'b1;
end
endmodule 