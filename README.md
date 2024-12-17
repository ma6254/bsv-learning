# bsv learning

用于记录学习BSV的过程

## 使用的开发板为 [Sipeed Tang Primer 20K](https://wiki.sipeed.com/hardware/zh/tang/tang-primer-20k/primer-20k.html)

| 名称                         | 完成 | 介绍                                                                            |
| ---------------------------- | ---- | ------------------------------------------------------------------------------- |
| [led_blink](src/led_blink/)  | ✅    | LED闪烁                                                                         |
| [led_flow](src/led_flow/)    | ✅    | LED流水灯                                                                       |
| [uart_tx](src/uart_tx)       | ✅    | 串口发送，115200波特率，输出`hello world!`                                      |
| [key_test_1](src/key_test_1) | ✅    | 按键测试程序1，控制LED上下走动                                                  |
| [uart_rx](src/uart_rx)       | ✅    | 串口接收, 发送`5A`点亮LED, 发送`A5`熄灭LED                                      |
| uart_shell                   | 🚧    |                                                                                 |
| uart_modbus                  | 🚧    |                                                                                 |
| ddr3                         | 🚧    | 调通DDR3读写                                                                    |
| ddr3_rgb_lcd                 | 🚧    | 使用DDR3作为缓存给RGB565LCD刷屏                                                 |
| ddr3_rgb_lcd_hdmi            | 🚧    | 使用HDMI接口，作为显示器接收显示数据，以DDR3为缓存，将显示数据刷新到RGB565LCD中 |

### 需要设置安装了BSV编译器的WSL分发版本

```powershell
PS > wsl -l                  
适用于 Linux 的 Windows 子系统分发:
docker-desktop (默认)
Ubuntu-24.04
PS > wsl --set-default Ubuntu-24.04
操作成功完成。
```

### libffi.so.6: cannot open shared object file: No such file or directory

```bash
curl -LO http://archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb
sudo dpkg -i libffi6_3.2.1-8_amd64.deb
```

## 参考

- <https://github.com/WangXuan95/BSV_Tutorial_cn>
- <https://github.com/anydream/FPGAIOTest>
- <https://github.com/anydream/BSV_Notes>
