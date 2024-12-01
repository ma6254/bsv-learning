package UartTx;

import StmtFSM::*;

interface UartTx;
   method Action write(Bit#(8) data);
   method bit tx;
   method Action set_delay(UInt#(32) val);
endinterface

(* synthesize, always_ready="tx" *)
module mkUartTx (UartTx);
   Reg#(bit) r_tx <- mkReg(1);
   Reg#(Bit#(8)) wdata <- mkReg(8'h0);
   Reg#(UInt#(32)) clk_delay <- mkReg(32'h0);
   Reg#(int) cnt <- mkReg(0);

   FSM uart_tx_fsm <- mkFSM (seq

      // start
      action
         r_tx <= 1'b0;
         cnt <= 0;
      endaction

      delay(clk_delay);

      // data bits
      while (cnt<8) seq
         action
         r_tx <= wdata[cnt];
         cnt <= cnt + 1;
         endaction

         delay(clk_delay);
      endseq

      // stop
      action
         r_tx <= 1'b1;
      endaction

      delay(clk_delay);

   endseq);

   method Action write(Bit#(8) data);

      wdata <= data;
      uart_tx_fsm.start();

   endmethod

   method Action set_delay(UInt#(32) val);
      clk_delay <= val;
   endmethod

   method bit tx = r_tx;
endmodule

endpackage
