# 网络中心故障收集脚本

----------------------------------------
## Win
### all文件夹：
使用方式（不同按键对应不同操作）：  
[0]quit    			[1]ipconfig  
[2]nslookup			[3]arp -a -d -a  
[4]all_test

### ping文件夹：
双击	_ping.bat		运行类似于 ping -n 10 **ip**  
一次能够 ping 多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

### tracert文件夹：
双击	_tracert.bat	运行类似于 tracert -d **ip**  
一次能够 tracert 多个ip(默认网关和MyIp.txt下的ip)加快运行速度。

### 注意：
1.请务必等待所有窗口关闭，并且最后按任意键结束，不允许直接点击关闭按钮。  
2."route PRINT" 的输出含有"0.0.0.0"的第一行第三列为默认网关，通过以下方式获取默认网关。
```
for /f "tokens=3" %%i in ('route PRINT ^| findstr "[^0-9]0.0.0.0" ') do (
	start test_ping.bat %%i 0
)
```

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
_all.sh		脚本包含下面四种命令

### single文件夹：
含有四个文件，根据需要使用  
_ifconfig.sh 	ifconfig主机  
_ping.sh		ping 包括默认网关和 MyIp.txt 下的网络  
_tracert.sh			tracert 包括默认网关和 MyIp.txt 下的网络  
_nslookup.sh 		nslookup MyIp.txt下的网络

### 执行步骤(_all.sh为例)：
0.   打开终端Terminal  
1.   cd 脚本所在目录路径  
2.   chmod 755 *  
3.   ./_all.sh  
4.   开始等待，开始会稍微慢，因为在获取默认网关。

### 注意：
1.这里我们没法像Win那样用脚本同时打开多个窗口加速，所以这里我把多个 ping traceroute 进程放在后台同时运行。  
运行脚本我们会发现窗口输出是乱的，不过因为每个 ping traceroute 都是不同进程，所以输出到文件都是正常的。  
2."netstat -r" 的输出含有"deault"的第1行第2列为默认网关，通过以下方式获取默认网关。
```
default=`netstat -r | grep "default" | awk '(NR==1){print $2}'`
```
----------------------------------------
