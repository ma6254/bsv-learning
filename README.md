# bsv learning

用于记录学习BSV的过程

## 使用的开发板为 [Sipeed Tang Primer 20K](https://wiki.sipeed.com/hardware/zh/tang/tang-primer-20k/primer-20k.html)

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
