package uart_tx_top;

import ConfigReg::*;
import StmtFSM::*;

import UartTx::*;

`define SYS_FREQ 27_000_000
`define TIME_US `SYS_FREQ / 1_000_000
`define TIME_MS `SYS_FREQ / 1_000
`define TIME_S `SYS_FREQ
`define BLINK_COUNT `TIME_MS * 100

`define UART_TX_BAUD 115200


(* always_enabled *)
interface Tb;
	method bit uart_tx_pin;
	method bit bl702_uart_rx_pin;
endinterface

(* synthesize *)
module mkTb (Tb);
   
   let uart_tx <- mkUartTx;

   Reg#(UInt#(32)) r_counter <- mkConfigReg(0);

   Reg#(UInt#(32)) r_uart_tx_delay <- mkConfigReg(`SYS_FREQ / `UART_TX_BAUD);

   FSM tick_fsm <- mkFSM(seq

         action
         uart_tx.set_delay(r_uart_tx_delay);
         endaction

         // h
         action
         uart_tx.write(8'h68);
         endaction
         
         // e
         action
         uart_tx.write(8'h65);
         endaction
  
         // l
         action
         uart_tx.write(8'h6C);
         endaction
         
         // l
         action
         uart_tx.write(8'h6C);
         endaction

         // o
         action
         uart_tx.write(8'h6F);
         endaction

         // space
         action
         uart_tx.write(8'h20);
         endaction

         // w
         action
         uart_tx.write(8'h77);
         endaction

         // o
         action
         uart_tx.write(8'h6F);
         endaction

         // r
         action
         uart_tx.write(8'h72);
         endaction

         // l
         action
         uart_tx.write(8'h6C);
         endaction

         // d
         action
         uart_tx.write(8'h64);
         endaction

         // \r
         action
         uart_tx.write(8'h0D);
         endaction

         // \n
         action
         uart_tx.write(8'h0A);
         endaction

         // uart_tx.write(8'h02);
         // uart_tx.write(8'h04);
         // uart_tx.write(8'h08);

         // uart_tx.write(8'h55);
      // uart_tx.write(8'hA5);
      // uart_tx.write(8'h5A);
   endseq);


   rule update;

      if (r_counter < `BLINK_COUNT) begin
         r_counter <= r_counter + 1;
      end else begin
         r_counter <= 0;
         tick_fsm.start();
      end
   endrule


   method uart_tx_pin = uart_tx.tx;
   method bl702_uart_rx_pin = uart_tx.tx;

endmodule


endpackage
