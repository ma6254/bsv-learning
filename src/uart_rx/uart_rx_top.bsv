package uart_rx_top;

import ConfigReg::*;
import StmtFSM::*;

import UartRx::*;

`define SYS_FREQ 27_000_000
`define TIME_US `SYS_FREQ / 1_000_000
`define TIME_MS `SYS_FREQ / 1_000
`define TIME_S `SYS_FREQ
`define BLINK_COUNT `TIME_MS * 100

`define UART_RX_BAUD 115200 // 波特率

`define CMD_LED_ON  8'h5A // 开灯指令
`define CMD_LED_OFF 8'hA5 // 关灯指令


(* always_enabled *)
interface Tb;
   method bit test1;
   method bit test2;
   method bit led_pin;
   method Action uart_rx(bit data);
endinterface

(* synthesize *)
module top (Tb);
   let uartRx <- mkUartRx;

   // rule update;
   // endrule

   Reg#(bit) r_led <- mkConfigReg(0);
   Reg#(bit) r_uart_rx <- mkConfigReg(0);
   Reg#(int) cnt <- mkReg(0);
   Reg#(bit) r_init <- mkReg(0);
   // Reg#(UInt#(32)) r_uart_rx_delay <- mkConfigReg(`SYS_FREQ / `UART_RX_BAUD);


   rule update;

      if (r_init == 0) begin
         r_init <= 1;
         uartRx.set_delay(`SYS_FREQ / `UART_RX_BAUD);
      end else if (uartRx.interrupt == 1) begin

         if (uartRx.data == `CMD_LED_OFF)
            r_led <= 0;
         else if (uartRx.data == `CMD_LED_ON)
            r_led <= 1;
      end

   endrule


   /****************************************************************************
    * UART RX 输入信号
    ***************************************************************************/
   method Action uart_rx(bit data);

      if (r_init == 1)
         uartRx.rx(data);
      // r_led <= data;
   endmethod


   method led_pin = ~r_led;
   // method uart_rx = uartRx.rx;
   method test1 = r_led;
   method test2 = uartRx.interrupt;

endmodule // module mkTb
endpackage // package uart_rx_top
