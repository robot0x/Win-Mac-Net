#!/bin/sh
echo "!!!!!!!!!!Start!!!!!!!!!!" >> all_test.log

##### date相关
date | tee -a all_test.log


##### ifconfig相关
echo "---------------------------------------------" | tee -a all_test.log
ifconfig | tee -a all_test.log
echo "---------------------------------------------" | tee -a all_test.log


##### ping相关
n=1

# ping默认网关
default=`netstat -r | grep "default" | awk '{print $2}'`
(ping -c 10 $default | tee -a "ping"$n".tmp")&

# ping文件里的ip
for ip in $(cat MyIp.txt | cut -d '$' -f 1)
do
    n=`expr $n + 1`
    (ping -c 10 $ip | tee -a "ping"$n".tmp")&
done

# 等待所有后台执行完毕
wait

# 将ping的所有输出文件重定向到ping文件
for ip in $(find . -type f -name "ping*.tmp")
do
    echo "----------------------------------------" >> all_test.log
    cat $ip >> all_test.log
    echo "----------------------------------------" >> all_test.log
    rm -f $ip
done


##### tracert相关
n=1

# tracert默认网关
default=`netstat -r | grep "default" | awk '{print $2}'`
(traceroute -n $default | tee -a "tracert"$n".tmp")&

# traceroute文件里的ip
for ip in $(cat MyIp.txt | cut -d '$' -f 1)
do
n=`expr $n + 1`
(traceroute -n $ip | tee -a "tracert"$n".tmp")&
done

# 等待所有后台执行完毕
wait

# 将tracert的输出文件全部重定向到tracert文件
for ip in $(find . -type f -name "tracert*.tmp")
do
    echo "----------------------------------------" >> all_test.log
    cat $ip >> all_test.log
    echo "----------------------------------------" >> all_test.log
    rm -f $ip
done


##### nslookup相关
for ip in $(cat MyIp.txt | cut -d '$' -f 1)
do
echo "----------------------------------------" >> all_test.log
nslookup $ip | tee -a all_test.log
echo "----------------------------------------" >> all_test.log
done


echo "!!!!!!!!!!End!!!!!!!!!!\n\n" >> all_test.log
vim all_test.log
