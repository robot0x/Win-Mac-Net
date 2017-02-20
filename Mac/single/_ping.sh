#!/bin/sh
echo "!!!!!!!!!!Start!!!!!!!!!!" >> ping_test.log
date | tee -a ping_test.log

n=1

# ping默认网关
default=`netstat -r | grep "default" | awk '(NR==1){print $2}'`
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
    echo "----------------------------------------" >> ping_test.log
    cat $ip >> ping_test.log
    echo "----------------------------------------" >> ping_test.log
    rm -f $ip
done

echo "!!!!!!!!!!End!!!!!!!!!!\n\n" >> ping_test.log
vim ping_test.log
