package UartRx;

import StmtFSM::*;
import ConfigReg::*;

interface UartRx;
   method Action set_delay(UInt#(32) val); // 设置波特率
   method Bit#(8) data;
   method bit interrupt;
   method bit error;
   method Action rx(bit data);
endinterface

(* synthesize *)
module mkUartRx (UartRx);

   Reg#(UInt#(32)) r_delay <- mkReg(0);
   Reg#(bit) r_curr_rx <- mkConfigReg(0);
   Reg#(bit) r_last_rx <- mkConfigReg(0);
   Reg#(bit) r_int <- mkConfigReg(0);
   Reg#(bit) r_error <- mkConfigReg(0);
   Reg#(UInt#(8)) cnt <- mkReg(0);
   Reg#(Bit#(8)) rdata <- mkReg(8'h0);

   let mfsm_uart_rx <- mkFSM(seq

      action
         r_int <= 0;
         rdata <= 0;
         cnt <= 0;
      endaction
      delay(r_delay);

      // data bits
      while (cnt<8) seq
         action
            rdata[cnt] <= r_curr_rx;
            cnt <= cnt + 1;
         endaction
      
      delay(r_delay);
      endseq
      
      // stop
      action
         r_int <= 1;
      endaction
      // r_error <= ~r_curr_rx;
      delay(1);

      action
         r_int <= 0;
      endaction
      
      // mfsm_uart_rx.start();
   endseq);


   rule update;
      if ((r_last_rx == 1) && (r_curr_rx == 0)) begin
         // r_int <= 1;
         mfsm_uart_rx.start();
      end
      // else
      //    r_int <= 0;
      r_last_rx <= r_curr_rx;
      
   endrule


   /****************************************************************************
    * 设置波特率
    ***************************************************************************/
   method Action set_delay(UInt#(32) val);
      r_delay <= val;
   endmethod

   method Action rx(bit data);
      r_curr_rx <= data;
   endmethod

   // method r_curr_rx = rx;
   method interrupt = r_int;
   method error = r_error;
   method data = rdata;

endmodule // module mkUartRx
endpackage // package UartRx
