# Win-Linux-Net
Script for Win and Linux

----------------------------------------
Win
all文件夹：
使用方式（不同按键对应不同操作）：
[0]quit				[1]ipconfig
[2]nslookup			[3]arp -a -d -a
[4]all_test

ping文件夹：
双击	test_ping.bat		运行类似于 ping -n 10 ***
一次能够ping多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

tracert文件夹：
双击	test_tracert.bat	运行类似于 tracert -d ***
一次能够tracert多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

加速原理：
实际上cmd环境无法进行多进程或者多线程任务。但是可以同时打开多个
命令窗口模拟多进程。
另外不同进程不允许同时向同一个文件进行写操作，因此不同进程生成
对应不同ip的文件，最后所有窗口关闭的时候将所有生成的子文件连接
起来形成一个总文件。

辅助工具：
tee.exe（windows下使用）
这个工具能够将命令行的结果输出到界面并且重定向到文件。
----------------------------------------
----------------------------------------
Linux(Unix、Mac):
_all.sh  -->  包含下面四种命令
_ifconfig.sh  -->  ifconfig主机
_ping.sh  --> ping包括默认网关和MyIp.txt下的网络
_tracert.sh  --> traccert包括默认网关和MyIp.txt下的网络
_nslookup.sh  --> nslookup MyIp.txt下的网络

实现上比Win版简洁
----------------------------------------
