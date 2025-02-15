package led_flow;

import ConfigReg::*;

`define MAIN_FREQ 27_000_000
`define TIME_US `MAIN_FREQ / 1_000_000
`define TIME_MS `MAIN_FREQ / 1_000
`define TIME_S `MAIN_FREQ
`define BLINK_COUNT `TIME_MS * 100

(* always_enabled *)
interface ITop;
	method bit led0;
	method bit led1;
	method bit led2;
	method bit led3;
	method bit led4;
	method bit led5;
endinterface

(* synthesize, clock_prefix="clk", reset_prefix="rst_n" *)
module top(ITop);

	Reg#(Bit#(32)) r_counter <- mkConfigReg(0);
	Reg#(Bit#(6)) r_led <- mkConfigReg(1);
	Reg#(Bit#(1)) r_dir <- mkConfigReg(0);

	rule update;
		if (r_counter < `BLINK_COUNT) begin
			r_counter <= r_counter + 1;
		end
		else begin
			r_counter <= 0;

			if ((r_dir == 0) && (r_led == 'b10_0000)) begin
				r_dir <= 1;
				r_led <= r_led >> 1;
			end else if ((r_dir == 1) &&(r_led == 'b00_0001)) begin
				r_dir <= 0;
				r_led <= r_led << 1;
			end else begin
				if (r_dir == 0) begin
					r_led <= r_led << 1;
				end else begin
					r_led <= r_led >> 1;
				end
			end
		end
	endrule

	method led0 = ~r_led[0];
	method led1 = ~r_led[1];
	method led2 = ~r_led[2];
	method led3 = ~r_led[3];
	method led4 = ~r_led[4];
	method led5 = ~r_led[5];
endmodule

endpackage
