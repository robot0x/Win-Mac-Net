# Script for Win and Linux

----------------------------------------
## Win
### all文件夹：
使用方式（不同按键对应不同操作）：  
[0]quit    			[1]ipconfig  
[2]nslookup			[3]arp -a -d -a  
[4]all_test

### ping文件夹：
双击	test_ping.bat		运行类似于 ping -n 10 **ip**  
一次能够ping多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

### tracert文件夹：
双击	test_tracert.bat	运行类似于 tracert -d **ip**  
一次能够tracert多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

### 加速原理：
实际上cmd环境无法进行多进程或者多线程任务。但是可以同时打开多个命令窗口模拟多进程。  
另外不同进程不允许同时向同一个文件进行写操作，因此不同进程生成对应不同ip的临时文件。  
最后所有窗口关闭的时候将所有生成的子文件拼接起来形成一个总文件。

### 辅助工具：
tee.exe（windows下使用）  
这个工具能够将命令行的结果输出到界面并且重定向到文件。

----------------------------------------

----------------------------------------
## Mac(Linux、Unix):
### all文件夹：
双击	_all.sh		脚本包含下面四种命令

### single文件夹：
含有四个文件，根据需要使用
双击	_ifconfig.sh 	ifconfig主机
双击	_ping.sh		ping包括默认网关和MyIp.txt下的网络
双击	tracert			tracert包括默认网关和MyIp.txt下的网络
双击	nslookup 		nslookup MyIp.txt下的网络

### 注意：
这里我们没法像Win那样用脚本同时打开多个窗口加速，所以这里我把多个 ping traceroute 进程放在后台同时运行。
运行脚本我们会发现窗口输出是乱的，不过因为每个 ping tracert 都是不同进程，所以输出到文件都是正常的。

----------------------------------------
