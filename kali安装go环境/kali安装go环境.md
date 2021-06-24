## kali 安装 go 环境 

#### 下载安装包

go版本可变，建议安装时使用最新版本

`wget -c https://storage.googleapis.com/golang/go1.15.11.linux-amd64.tar.gz`	

#### 解压到  /usr/local  目录下

`tar -C /usr/local/ -xzf go1.15.11.linux-amd64.tar.gz`

以上命令没执行成功，本人是先tar后mv的

![image-20210527171223387](.\images\image1.png)

#### 修改配置文件

`vim /etc/profile`

文件最后添加：export PATH=$PATH:/usr/local/go/bin

![image-20210527172920972](.\images\image2.png)

#### 更新环境变量

`source /etc/profile`

![image-20210527173211372](.\images\image3.png)

#### 安装成功

#### 设置go代理

`vim /etc/profile`

添加如下行

```shell
export GO111MODULE=on

export GOPROXY=http://goproxy.io
```



