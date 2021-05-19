# chrome 0day复现

#### 复现过程

1. 环境win10、win7均可
2. 关闭沙箱模式-no-sandbox
3. chrome客户端需64位（Google Chrome < = 89.0.4389.114）
4. 使用命令关闭沙箱模式`chrome.exe --no-sandbox`

![image-20210512093300981](.\image\image3.png)

结果

![image-20210512093421711](.\image\image4.png)

### 坑

必须在执行了`chrome.exe --no-sandbox`命令后弹出的带有如下标记的浏览器打开exploit

![image-20210512092756952](.\image\image1.png)

必须在地址栏里访问exploit，而非在文件夹中打开exploit.html

![image-20210512093000906](.\image\image2.png)



### POC链接

https://github.com/r4j0x00/exploits/tree/master/chrome-0day

### 对形成原因的猜测

整个POC是对内存进行了一系列操作，正常情况下98行的cor是只存在三个元素[1.1,.12,1.3]，当产生溢出时，有了cor[3]，即113行有了进行下去的条件，此时达到了弹出计算器的要求。

且cor[3]值是固定的，为4.763781708924645e-270

![image-20210513142327369](.\image\image5.png)



![image-20210514101435934](.\image\image6.png)

`buf2[object ArrayBuffer]
exploit.js:130 buf_addr136707881`

![image-20210514112214184](.\image\image7.png)