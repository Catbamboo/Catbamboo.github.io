# Linux 部署hydra环境

## ubuntu 16需换源

```sh
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse 
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse 
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse 
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse 
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse 
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse 
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse 
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse 
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse 
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
```



## 然后直接安装freerdp2-dev即可

```shell
apt install freerdp2-dev
```

## 编译安装hydra

```shell
git clone https://github.com/vanhauser-thc/thc-hydra.git
cd thc-hydra
make clean
./configure
make
make install
```

# windows

直接下载即可

`https://github.com/maaaaz/thc-hydra-windows/`

## 本人自写的wimdows脚本

针对ip特定user进行爆破

字典格式：ip user

 [windows_rdp.bat](windows_rdp.bat) 
