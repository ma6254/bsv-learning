package key_test_1_top;

import ConfigReg::*;

(* always_enabled *)
interface ITop;
    method Bit#(6) led;
    method Action key1(bit data);
    method Action key2(bit data);
endinterface

(* synthesize *)
module top(ITop);

    Reg#(Bit#(32)) r_counter <- mkConfigReg(0);
    Reg#(Bit#(6)) r_led <- mkConfigReg(6'b00_0001);
    Reg#(Bit#(1)) r_dir <- mkConfigReg(0);
    Reg#(Bit#(1)) r_key1 <- mkConfigReg(0);
    Reg#(Bit#(1)) r_key2 <- mkConfigReg(0);
    
    Reg#(Bit#(1)) r_last_key1 <- mkConfigReg(0);
    Reg#(Bit#(1)) r_last_key2 <- mkConfigReg(0);


    rule update;
        
        // 检测到key1按下
        if ((r_last_key1 == 0) && (r_key1 == 1)) begin
        
            if (r_led != 6'b10_0000)
                r_led <= r_led << 1;
            else
                r_led <= 6'b00_0001;
        
        // 检测到key2按下
        end else if ((r_last_key2 == 0) && (r_key2 == 1)) begin

            if (r_led != 6'b00_0001)
                r_led <= r_led >> 1;
            else
                r_led <= 6'b10_0000;
        end


        r_last_key1 <= r_key1;
        r_last_key2 <= r_key2;

    endrule

    method led = ~r_led;

    method Action key1(bit data);
        r_key1 <= ~data;
    endmethod
    
    method Action key2(bit data);
        r_key2 <= ~data;
    endmethod

endmodule

endpackage
