module note_queuer (
	input  logic Clk, //Clk should be operating at 1-3Hz
	input  logic RESET,
	output logic g_activate,
	output logic r_activate,
	output logic y_activate,
	output logic b_activate,
	output logic o_activate
);
	logic [7:0] ADDR;
	logic [4:0] out;
	assign g_activate = out[4];
	assign r_activate = out[3];
	assign y_activate = out[2];
	assign b_activate = out[1];
	assign o_activate = out[0];
	// This module will be synthesized into a RAM
	always_ff @ (posedge Clk) begin
		if (RESET) begin
			ADDR <= 8'b0;
		end
		case (ADDR)
			8'h00: out <= 5'b00001;    8'h01: out <= 5'b00010;    8'h02: out <= 5'b00100;    8'h03: out <= 5'b01000;
			8'h04: out <= 5'b10000;    8'h05: out <= 5'b00101;    8'h06: out <= 5'b01010;    8'h07: out <= 5'b00000;
			8'h08: out <= 5'b00000;    8'h09: out <= 5'b00000;    8'h0a: out <= 5'b00000;    8'h0b: out <= 5'b00000;
			8'h0c: out <= 5'b00000;    8'h0d: out <= 5'b00000;    8'h0e: out <= 5'b00000;    8'h0f: out <= 5'b00000;
			8'h10: out <= 5'b00000;    8'h11: out <= 5'b00000;    8'h12: out <= 5'b00000;    8'h13: out <= 5'b00000;
			8'h14: out <= 5'b00000;    8'h15: out <= 5'b00000;    8'h16: out <= 5'b00000;    8'h17: out <= 5'b00000;
			8'h18: out <= 5'b00000;    8'h19: out <= 5'b00000;    8'h1a: out <= 5'b00000;    8'h1b: out <= 5'b00000;
			8'h1c: out <= 5'b00000;    8'h1d: out <= 5'b00000;    8'h1e: out <= 5'b00000;    8'h1f: out <= 5'b00000;
			8'h20: out <= 5'b00000;    8'h21: out <= 5'b00000;    8'h22: out <= 5'b00000;    8'h23: out <= 5'b00000;
			8'h24: out <= 5'b00000;    8'h25: out <= 5'b00000;    8'h26: out <= 5'b00000;    8'h27: out <= 5'b00000;
			8'h28: out <= 5'b00000;    8'h29: out <= 5'b00000;    8'h2a: out <= 5'b00000;    8'h2b: out <= 5'b00000;
			8'h2c: out <= 5'b00000;    8'h2d: out <= 5'b00000;    8'h2e: out <= 5'b00000;    8'h2f: out <= 5'b00000;
			8'h30: out <= 5'b00000;    8'h31: out <= 5'b00000;    8'h32: out <= 5'b00000;    8'h33: out <= 5'b00000;
			8'h34: out <= 5'b00000;    8'h35: out <= 5'b00000;    8'h36: out <= 5'b00000;    8'h37: out <= 5'b00000;
			8'h38: out <= 5'b00000;    8'h39: out <= 5'b00000;    8'h3a: out <= 5'b00000;    8'h3b: out <= 5'b00000;
			8'h3c: out <= 5'b00000;    8'h3d: out <= 5'b00000;    8'h3e: out <= 5'b00000;    8'h3f: out <= 5'b00000;
			8'h40: out <= 5'b00000;    8'h41: out <= 5'b00000;    8'h42: out <= 5'b00000;    8'h43: out <= 5'b00000;
			8'h44: out <= 5'b00000;    8'h45: out <= 5'b00000;    8'h46: out <= 5'b00000;    8'h47: out <= 5'b00000;
			8'h48: out <= 5'b00000;    8'h49: out <= 5'b00000;    8'h4a: out <= 5'b00000;    8'h4b: out <= 5'b00000;
			8'h4c: out <= 5'b00000;    8'h4d: out <= 5'b00000;    8'h4e: out <= 5'b00000;    8'h4f: out <= 5'b00000;
			8'h50: out <= 5'b00000;    8'h51: out <= 5'b00000;    8'h52: out <= 5'b00000;    8'h53: out <= 5'b00000;
			8'h54: out <= 5'b00000;    8'h55: out <= 5'b00000;    8'h56: out <= 5'b00000;    8'h57: out <= 5'b00000;
			8'h58: out <= 5'b00000;    8'h59: out <= 5'b00000;    8'h5a: out <= 5'b00000;    8'h5b: out <= 5'b00000;
			8'h5c: out <= 5'b00000;    8'h5d: out <= 5'b00000;    8'h5e: out <= 5'b00000;    8'h5f: out <= 5'b00000;
			8'h60: out <= 5'b00000;    8'h61: out <= 5'b00000;    8'h62: out <= 5'b00000;    8'h63: out <= 5'b00000;
			8'h64: out <= 5'b00000;    8'h65: out <= 5'b00000;    8'h66: out <= 5'b00000;    8'h67: out <= 5'b00000;
			8'h68: out <= 5'b00000;    8'h69: out <= 5'b00000;    8'h6a: out <= 5'b00000;    8'h6b: out <= 5'b00000;
			8'h6c: out <= 5'b00000;    8'h6d: out <= 5'b00000;    8'h6e: out <= 5'b00000;    8'h6f: out <= 5'b00000;
			8'h70: out <= 5'b00000;    8'h71: out <= 5'b00000;    8'h72: out <= 5'b00000;    8'h73: out <= 5'b00000;
			8'h74: out <= 5'b00000;    8'h75: out <= 5'b00000;    8'h76: out <= 5'b00000;    8'h77: out <= 5'b00000;
			8'h78: out <= 5'b00000;    8'h79: out <= 5'b00000;    8'h7a: out <= 5'b00000;    8'h7b: out <= 5'b00000;
			8'h7c: out <= 5'b00000;    8'h7d: out <= 5'b00000;    8'h7e: out <= 5'b00000;    8'h7f: out <= 5'b00000;
			8'h80: out <= 5'b00000;    8'h81: out <= 5'b00000;    8'h82: out <= 5'b00000;    8'h83: out <= 5'b00000;
			8'h84: out <= 5'b00000;    8'h85: out <= 5'b00000;    8'h86: out <= 5'b00000;    8'h87: out <= 5'b00000;
			8'h88: out <= 5'b00000;    8'h89: out <= 5'b00000;    8'h8a: out <= 5'b00000;    8'h8b: out <= 5'b00000;
			8'h8c: out <= 5'b00000;    8'h8d: out <= 5'b00000;    8'h8e: out <= 5'b00000;    8'h8f: out <= 5'b00000;
			8'h90: out <= 5'b00000;    8'h91: out <= 5'b00000;    8'h92: out <= 5'b00000;    8'h93: out <= 5'b00000;
			8'h94: out <= 5'b00000;    8'h95: out <= 5'b00000;    8'h96: out <= 5'b00000;    8'h97: out <= 5'b00000;
			8'h98: out <= 5'b00000;    8'h99: out <= 5'b00000;    8'h9a: out <= 5'b00000;    8'h9b: out <= 5'b00000;
			8'h9c: out <= 5'b00000;    8'h9d: out <= 5'b00000;    8'h9e: out <= 5'b00000;    8'h9f: out <= 5'b00000;
			8'ha0: out <= 5'b00000;    8'ha1: out <= 5'b00000;    8'ha2: out <= 5'b00000;    8'ha3: out <= 5'b00000;
			8'ha4: out <= 5'b00000;    8'ha5: out <= 5'b00000;    8'ha6: out <= 5'b00000;    8'ha7: out <= 5'b00000;
			8'ha8: out <= 5'b00000;    8'ha9: out <= 5'b00000;    8'haa: out <= 5'b00000;    8'hab: out <= 5'b00000;
			8'hac: out <= 5'b00000;    8'had: out <= 5'b00000;    8'hae: out <= 5'b00000;    8'haf: out <= 5'b00000;
			8'hb0: out <= 5'b00000;    8'hb1: out <= 5'b00000;    8'hb2: out <= 5'b00000;    8'hb3: out <= 5'b00000;
			8'hb4: out <= 5'b00000;    8'hb5: out <= 5'b00000;    8'hb6: out <= 5'b00000;    8'hb7: out <= 5'b00000;
			8'hb8: out <= 5'b00000;    8'hb9: out <= 5'b00000;    8'hba: out <= 5'b00000;    8'hbb: out <= 5'b00000;
			8'hbc: out <= 5'b00000;    8'hbd: out <= 5'b00000;    8'hbe: out <= 5'b00000;    8'hbf: out <= 5'b00000;
			8'hc0: out <= 5'b00000;    8'hc1: out <= 5'b00000;    8'hc2: out <= 5'b00000;    8'hc3: out <= 5'b00000;
			8'hc4: out <= 5'b00000;    8'hc5: out <= 5'b00000;    8'hc6: out <= 5'b00000;    8'hc7: out <= 5'b00000;
			8'hc8: out <= 5'b00000;    8'hc9: out <= 5'b00000;    8'hca: out <= 5'b00000;    8'hcb: out <= 5'b00000;
			8'hcc: out <= 5'b00000;    8'hcd: out <= 5'b00000;    8'hce: out <= 5'b00000;    8'hcf: out <= 5'b00000;
			8'hd0: out <= 5'b00000;    8'hd1: out <= 5'b00000;    8'hd2: out <= 5'b00000;    8'hd3: out <= 5'b00000;
			8'hd4: out <= 5'b00000;    8'hd5: out <= 5'b00000;    8'hd6: out <= 5'b00000;    8'hd7: out <= 5'b00000;
			8'hd8: out <= 5'b00000;    8'hd9: out <= 5'b00000;    8'hda: out <= 5'b00000;    8'hdb: out <= 5'b00000;
			8'hdc: out <= 5'b00000;    8'hdd: out <= 5'b00000;    8'hde: out <= 5'b00000;    8'hdf: out <= 5'b00000;
			8'he0: out <= 5'b00000;    8'he1: out <= 5'b00000;    8'he2: out <= 5'b00000;    8'he3: out <= 5'b00000;
			8'he4: out <= 5'b00000;    8'he5: out <= 5'b00000;    8'he6: out <= 5'b00000;    8'he7: out <= 5'b00000;
			8'he8: out <= 5'b00000;    8'he9: out <= 5'b00000;    8'hea: out <= 5'b00000;    8'heb: out <= 5'b00000;
			8'hec: out <= 5'b00000;    8'hed: out <= 5'b00000;    8'hee: out <= 5'b00000;    8'hef: out <= 5'b00000;
			8'hf0: out <= 5'b00000;    8'hf1: out <= 5'b00000;    8'hf2: out <= 5'b00000;    8'hf3: out <= 5'b00000;
			8'hf4: out <= 5'b00000;    8'hf5: out <= 5'b00000;    8'hf6: out <= 5'b00000;    8'hf7: out <= 5'b00000;
			8'hf8: out <= 5'b00000;    8'hf9: out <= 5'b00000;    8'hfa: out <= 5'b00000;    8'hfb: out <= 5'b00000;
			8'hfc: out <= 5'b00000;    8'hfd: out <= 5'b00000;    8'hfe: out <= 5'b00000;    8'hff: out <= 5'b00000;
		endcase
	end
endmodule

module RNG(
	input logic CLK,
	input logic RESET,
	
	input logic AUD_CLK,
	
//	inout wire [15:0] SRAM_DQ,

	output logic [3:0] debug00,
	output logic [3:0] debug01,
	output logic [3:0] debug02,
	output logic [3:0] debug03,


	output logic [3:0] debug10,
	output logic [3:0] debug11,
	output logic [3:0] debug12,
	output logic [3:0] debug13,

	
//	output logic [15:0] LData, RData,	

	
	output logic g_activate,
	output logic r_activate,
	output logic y_activate,
	output logic b_activate,
	output logic o_activate

);

	enum logic [3:0] {RNG_0,RNG_1, RNG_2, RNG_3, RNG_4} current, next; //ReadLeft_0 state used because it takes a while to read from SRAM

//	logic [15:0] Data_to_SRAM, Data_from_SRAM;
	logic occured_once;
	logic [19:0] RAND_BITS;

	logic [15:0] debug0, debug1;

	assign debug03[3:0] = debug0[15:12];
	assign debug02[3:0] = debug0[11:8];	
	assign debug01[3:0] = debug0[7:4];
	assign debug00[3:0] = debug0[3:0];
	
	assign debug13[3:0] = debug1[15:12];
	assign debug12[3:0] = debug1[11:8];	
	assign debug11[3:0] = debug1[7:4];
	assign debug10[3:0] = debug1[3:0];
	

	assign debug1[15:0] = 16'b0;
	
	
	always_ff @(posedge CLK) begin
		if (RESET) begin
			//TODO: DELETE!!
			RAND_BITS <= 20'b0;
			current <= RNG_0;
			occured_once <= 1'b0;
		end
		
		if (current == RNG_2) begin
			RAND_BITS <= RAND_BITS + 20'b1;
		end
		if (AUD_CLK == 1'b0) begin
			occured_once <= 1'b0;
		end
		
		unique case (current)
			RNG_1: begin
				occured_once <= 1'b1;
			end
			RNG_3: begin
				RAND_BITS <= RAND_BITS + 20'b1;
			end	
			RNG_4: begin
				RAND_BITS <= RAND_BITS + 20'b1;

			end
		endcase
		
		current <= next;
	end
	
	
	always_ff @(posedge AUD_CLK) begin
		debug0 <= RAND_BITS;
		
		g_activate <= RAND_BITS[0];
		r_activate <= RAND_BITS[1];
		y_activate <= RAND_BITS[2];
		b_activate <= RAND_BITS[3];
		o_activate <= RAND_BITS[4];
	end
	
	always_comb begin
		next = current;
		unique case (current)
			RNG_0: begin
					if (AUD_CLK == 1'b1)begin
						if (occured_once == 1'b0) begin
							next = RNG_1;
						end
					end
			end
			RNG_1: begin
				next = RNG_2;
			end
			RNG_2: begin
				next = RNG_3;
			end
			RNG_3: begin
				next = RNG_4;
			end
			RNG_4: begin
				next = RNG_0;
			end
			default: ;
		endcase
	end

endmodule







//module sram_reader(
//	input logic CLK,
//	input logic RESET,
//	
//	input logic mus_data_over,
//
//	inout wire [15:0] SRAM_DQ,
//
//	
//	output logic [15:0] LData, RData,	
//	output logic [19:0] SRAM_ADDR,
//	output logic SRAM_UB_N,
//	output logic SRAM_LB_N,
//	output logic SRAM_CE_N,
//	output logic SRAM_OE_N,
//	output logic SRAM_WE_N
//);
//
//	enum logic [3:0] {RL_0,RR_0, RL_1, RR_1, IDLE} current, next; //ReadLeft_0 state used because it takes a while to read from SRAM
//
//	logic [15:0] Data_toSRAM, Data_fromSRAM;
//	
//	tristate #(.N(16)) ts0(.Clk(CLK), .tristate_output_enable(~SRAM_WE_N), .Data_write(Data_toSRAM), .Data_read(Data_from_SRAM), .Data(SRAM_DQ));
//	
//	assign SRAM_UB_N = 1'b0;
//	assign SRAM_LB_N = 1'b0;
//	assign SRAM_CE_N = 1'b0;
//	assign SRAM_WE_N = 1'b1;
//	assign SRAM_OE_N = 1'b0;
//	
//	always_ff @(posedge CLK) begin
//		if (RESET) begin
//			//TODO: DELETE!!
////			debug <= 4'b0;
//			SRAM_ADDR <= 20'b0;
//		end
//		
//		unique case(current)
//			RL_1: begin
//				LData <= Data_from_SRAM;
//				SRAM_ADDR <= SRAM_ADDR + 1;
//			end
//			RR_1: begin
//				RData <= Data_from_SRAM;
//				SRAM_ADDR <= SRAM_ADDR + 1;
//			end
//		endcase
//	end
//	
//	always_comb begin
//		next = current;
//		
//		unique case (current)
//			IDLE: begin
//					if (mus_data_over == 1'b1) begin
//						next = RL_0;
//					end
//			end
//			RL_0: begin
//				next = RL_1;
//			end
//			RL_1: begin
//				next = RR_0;
//			end
//			RR_0: begin
//				next = RR_1;
//			end
//			RR_1: begin
//				next = IDLE;
//			end
//			default: ;
//		endcase
//	end
//
//endmodule
