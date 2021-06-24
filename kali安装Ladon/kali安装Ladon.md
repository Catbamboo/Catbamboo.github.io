## kali安装LadonGo

#### 源码编译

###### 下载源码

`go get github.com/k8gege/LadonGo`

###### issue：

无法下载

###### 解决办法：

设置go代理

`vim /etc/profile`

添加如下行

```shell
export GO111MODULE=on

export GOPROXY=http://goproxy.io
```

源码下载到/root/go，具体路径需视实际情况而定

```sh
cd  /root/go/src/github.com/k8gege/LadonGo

go build Ladon.go
```

![image-20210528092608662](.\images\image1.png)

#### 快速编译

选择对应的OS环境

```sh
make windows
make linux 
make mac
```

会报如下错误

![image-20210528094759363](.\images\image2.png)

原因：同一文件夹中不能存在两个含main的.go文件

解决办法：将无关的.go文件移走

#### 一键安装

linux/Mac

```sh
make install
```

![image-20210528095109527](.\images\image3.png)

wimdows

```sh
go run install.go
```

#### 安装完成

## 本人自写的安装脚本

 [ladonGo_install.sh](ladonGo_install.sh) 

