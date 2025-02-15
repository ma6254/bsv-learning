# bsv learning

用于记录学习BSV的过程

## 使用的开发板为 [Sipeed Tang Primer 20K](https://wiki.sipeed.com/hardware/zh/tang/tang-primer-20k/primer-20k.html)

### 例程：LED和KEY

| 名称                                          | 完成 | 介绍                           |
| --------------------------------------------- | ---- | ------------------------------ |
| [01.led_blink](src/01.led_key/01.led_blink/)  | ✅    | LED闪烁                        |
| [02.led_flow](src/01.led_key/02.led_flow/)    | ✅    | LED流水灯                      |
| [03.key_test_1](src/01.led_key/03.key_test_1) | ✅    | 按键测试程序1，控制LED上下走动 |


### 例程：UART

| 名称                                 | 完成 | 介绍                                       |
| ------------------------------------ | ---- | ------------------------------------------ |
| [01.uart_tx](src/02.uart/01.uart_tx) | ✅    | 串口发送，115200波特率，输出`hello world!` |
| [02.uart_rx](src/02.uart/02.uart_rx) | ✅    | 串口接收, 发送`5A`点亮LED, 发送`A5`熄灭LED |
| 03.uart_shell                        | 🚧    |                                            |
| 04.uart_modbus                       | 🚧    |                                            |


### 例程：RV32i

## 需要设置安装了BSV编译器的WSL分发版本

```powershell
PS > wsl -l                  
适用于 Linux 的 Windows 子系统分发:
docker-desktop (默认)
Ubuntu-24.04
PS > wsl --set-default Ubuntu-24.04
操作成功完成。
```

## FAQ 

 [FAQ.md](docs/FAQ.md)

## 参考

- <https://github.com/WangXuan95/BSV_Tutorial_cn>
- <https://github.com/anydream/FPGAIOTest>
- <https://github.com/anydream/BSV_Notes>
